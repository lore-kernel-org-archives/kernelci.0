Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: kernelci-backend: /callback/lava/test: only "lava" results?
Date: Tue, 13 Aug 2019 15:40:18 -0700
Message-ID: <7hr25oy9il.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Guillaume Charles Tucker <guillaume.tucker@collabora.co.uk>
Cc: kernelci@groups.io, Khouloud Touil <ktouil@baylibre.com>

Hi Guillaume,

In testing the recent PR to add fastboot support and a new
"boot-fastboot" testplan[1], we noticed that while the jobs are booting
fine, there were not results in the backend.

After a bit of digging, I think this is because this new test-plan job
has a deploy and boot section, but no test section, but the
lava-v2-jobs-from-api will set the "notify" callback to use
/callback/lava/test for any testplan that's not called "boot".

Looking at the backend code[2] that's handling the suite_names, it seems
that we intentionally ignore the "lava" test-suite in any plan-name
that's not "boot".

This means that oure current "boot-nfs" test-plan and the new
"boot-fastboot" testplan, neither of which have a test section, and use
the /callback/lava/test API will never produce any data in the database.

So I came up with two potential solutions for this.

1) lava-v2-jobs-from-api solution: treat the "boot-*" test plans like
   the existing "boot" testplan and make them use the
   /callback/lava/boot API.  This is a simple patch[3]

2) backend solution: handle the boot-* test-plans like the "boot"
   test-plan and save the lava test-suite[4] as well

I kind of prefer (2) since I think the /test API and data are more
useful in the long term.

I guess another solution would be

3) ensure that all non-"boot" test-plans have a basic "test" section
(something like simple.jinja2)

Kevin

[1] https://github.com/kernelci/kernelci-core/pull/94
[2] https://github.com/kernelci/kernelci-backend/blob/master/app/utils/callback/lava.py#L577

[3]
diff --git a/lava-v2-jobs-from-api.py b/lava-v2-jobs-from-api.py
index 9daf5e035184..9612bad312af 100755
--- a/lava-v2-jobs-from-api.py
+++ b/lava-v2-jobs-from-api.py
@@ -80,7 +80,7 @@ def add_callback_params(params, config, plan):
     callback_type = config.get('callback_type')
 
     if callback_type == 'kernelci':
-        lava_cb = 'boot' if plan == 'boot' else 'test'
+        lava_cb = 'boot' if plan.startswith('boot') else 'test'
         params['callback_name'] = '/'.join(['lava', lava_cb])
 
     params.update({

[4]
diff --git a/app/utils/callback/lava.py b/app/utils/callback/lava.py
index dbf902509ef8..b92a63a3c12a 100644
--- a/app/utils/callback/lava.py
+++ b/app/utils/callback/lava.py
@@ -579,7 +579,7 @@ def add_tests(job_data, job_meta, lab_name, db_options,
                 # LAVA adds a prefix index to the test suite names "X_" except
                 # for the lava key.  Remove it to get the original name.
                 suite_name = suite_name.partition("_")[2]
-            elif plan_name != "boot":
+            elif not plan_name.startswith("boot"):
                 continue
             group = dict(meta)
             group[models.NAME_KEY] = suite_name
