Date: Fri, 31 Aug 2018 03:13:15 +0200
From: "Ana Guerrero Lopez" <ana.guerrero@collabora.com>
Subject: [bot@kernelci.org: Test suite results for stable/linux-4.14.y - v4.14.67]
Message-ID: <20180831011315.GA24074@delenn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi!

The code to send mail reports with the results from the test suites got
merged this week. Below you can find an example sent from staging.

If you have access to the jenkins in staging, I have added a jenkins
job where you can enter the tree/branch/kernel you're interested in
and trigger a mail that will be sent instantly. The job is at:
https://staging-ci.kernelci.org/job/Trigger%20mail%20with%20test%20suites%20report/
the values by default will trigger the report below.

If you want to start reciving emails like the ones with the build and boot reports, 
you can add yourself in the script kernelci-build-staging/jenkins/kernel-arch-complete.sh

The command line would be:
curl -X POST -H "Authorization: $EMAIL_AUTH_TOKEN" -H "Content-Type: application/json" -d '{"job": "'$TREE_NAME'", "kernel": "'$GIT_DESCRIBE'", "git_branch": "'$BRANCH'", "report_type": "test", "format": ["txt"], "send_to": ["YOUR@MAIL.COM"], "delay": 21600}' ${API}/send

Remember to change the mail. The delay in the example is 6h which might
need to be adjusted.

Ana

----- Forwarded message from "kernelci.org bot" <bot@kernelci.org> -----

From: "kernelci.org bot" <bot@kernelci.org>
To: ana@collabora.com
Date: Thu, 30 Aug 2018 17:41:33 -0700 (PDT)
Subject: Test suite results for stable/linux-4.14.y - v4.14.67
X-CRM114-Status: UNSURE (   0.76  )
Message-ID: <5b888ebd.1c69fb81.53349.84c8@mx.google.com>

Test suites results for:
  Tree:    stable
  Branch:  linux-4.14.y
  Kernel:  v4.14.67
  URL:     http://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
  Commit:  f4c88459f7c9320f587b839c3d24a2a9dc18a8a0


Summary
-------
16 test suites results

igt        | rk3288-veyron-jaq      |  13 total:   0 PASS  13 FAIL   0 SKIP
igt        | tegra124-nyan-big      |  13 total:   0 PASS  13 FAIL   0 SKIP
simple     | bcm2837-rpi-3-b        |   6 total:   4 PASS   2 FAIL   0 SKIP
simple     | x86-atom330            |   6 total:   6 PASS   0 FAIL   0 SKIP
sleep      | imx6q-sabrelite        |  20 total:   0 PASS  20 FAIL   0 SKIP
sleep      | rk3288-rock2-square    |  20 total:   0 PASS  20 FAIL   0 SKIP
sleep      | rk3288-veyron-jaq      |  20 total:   0 PASS  20 FAIL   0 SKIP
sleep      | bcm2836-rpi-2-b        |  20 total:   0 PASS  20 FAIL   0 SKIP
sleep      | tegra124-nyan-big      |   1 total:   1 PASS   0 FAIL   0 SKIP
usb        | rk3288-rock2-square    |   1 total:   1 PASS   0 FAIL   0 SKIP
usb        | imx6q-sabrelite        |   1 total:   1 PASS   0 FAIL   0 SKIP
usb        | r8a7796-m3ulcb         |   1 total:   1 PASS   0 FAIL   0 SKIP
usb        | rk3288-veyron-jaq      |   1 total:   1 PASS   0 FAIL   0 SKIP
usb        | bcm2836-rpi-2-b        |   1 total:   1 PASS   0 FAIL   0 SKIP
usb        | exynos5800-peach-pi    |   1 total:   1 PASS   0 FAIL   0 SKIP
v4l2       | rk3288-veyron-jaq      |   1 total:   0 PASS   1 FAIL   0 SKIP


Tests
-----

igt - 13 tests: 0  PASS, 13 FAIL, 0 SKIP

  Config:      multi_v7_defconfig
  Lab Name:    lab-collabora-dev
  Board:       rk3288-veyron-jaq
  Date:        2018-08-24 19:53:48.743000

  Test cases:

    * kms_vblank : FAIL
    * kms_setmode : FAIL
    * kms_flip_event_leak : FAIL
    * kms_atomic : FAIL
    * kms_addfb_basic : FAIL
    * drm_read : FAIL
    * core_setmaster_vs_auth : FAIL
    * core_prop_blob : FAIL
    * core_getversion : FAIL
    * core_getstats : FAIL
    * core_getclient : FAIL
    * core_get_client_auth : FAIL
    * core_auth : FAIL

igt - 13 tests: 0  PASS, 13 FAIL, 0 SKIP

  Config:      multi_v7_defconfig
  Lab Name:    lab-collabora-dev
  Board:       tegra124-nyan-big
  Date:        2018-08-24 19:58:46.200000

  Test cases:

    * kms_vblank : FAIL
    * kms_setmode : FAIL
    * kms_flip_event_leak : FAIL
    * kms_atomic : FAIL
    * kms_addfb_basic : FAIL
    * drm_read : FAIL
    * core_setmaster_vs_auth : FAIL
    * core_prop_blob : FAIL
    * core_getversion : FAIL
    * core_getstats : FAIL
    * core_getclient : FAIL
    * core_get_client_auth : FAIL
    * core_auth : FAIL

simple - 6 tests: 4  PASS, 2 FAIL, 0 SKIP

  Config:      defconfig
  Lab Name:    lab-mhart-dev
  Board:       bcm2837-rpi-3-b
  Date:        2018-08-24 19:49:56.412000

  Test cases:

    * ping : FAIL
    * ip : PASS
    * udhcpc : FAIL
    * ls : PASS
    * mount : PASS
    * df : PASS

simple - 6 tests: 6  PASS, 0 FAIL, 0 SKIP

  Config:      x86_64_defconfig
  Lab Name:    lab-mhart-dev
  Board:       x86-atom330
  Date:        2018-08-24 19:50:39.058000

  Test cases:

    * ping : PASS
    * ip : PASS
    * udhcpc : PASS
    * ls : PASS
    * mount : PASS
    * df : PASS

sleep - 20 tests: 0  PASS, 20 FAIL, 0 SKIP

  Config:      multi_v7_defconfig
  Lab Name:    lab-collabora-dev
  Board:       imx6q-sabrelite
  Date:        2018-08-24 19:49:41.559000

  Test cases:

    * rtcwake-freeze-10 : FAIL
    * rtcwake-freeze-9 : FAIL
    * rtcwake-freeze-8 : FAIL
    * rtcwake-freeze-7 : FAIL
    * rtcwake-freeze-6 : FAIL
    * rtcwake-freeze-5 : FAIL
    * rtcwake-freeze-4 : FAIL
    * rtcwake-freeze-3 : FAIL
    * rtcwake-freeze-2 : FAIL
    * rtcwake-freeze-1 : FAIL
    * rtcwake-mem-10 : FAIL
    * rtcwake-mem-9 : FAIL
    * rtcwake-mem-8 : FAIL
    * rtcwake-mem-7 : FAIL
    * rtcwake-mem-6 : FAIL
    * rtcwake-mem-5 : FAIL
    * rtcwake-mem-4 : FAIL
    * rtcwake-mem-3 : FAIL
    * rtcwake-mem-2 : FAIL
    * rtcwake-mem-1 : FAIL

sleep - 20 tests: 0  PASS, 20 FAIL, 0 SKIP

  Config:      multi_v7_defconfig
  Lab Name:    lab-collabora-dev
  Board:       rk3288-rock2-square
  Date:        2018-08-24 19:51:02.156000

  Test cases:

    * rtcwake-freeze-10 : FAIL
    * rtcwake-freeze-9 : FAIL
    * rtcwake-freeze-8 : FAIL
    * rtcwake-freeze-7 : FAIL
    * rtcwake-freeze-6 : FAIL
    * rtcwake-freeze-5 : FAIL
    * rtcwake-freeze-4 : FAIL
    * rtcwake-freeze-3 : FAIL
    * rtcwake-freeze-2 : FAIL
    * rtcwake-freeze-1 : FAIL
    * rtcwake-mem-10 : FAIL
    * rtcwake-mem-9 : FAIL
    * rtcwake-mem-8 : FAIL
    * rtcwake-mem-7 : FAIL
    * rtcwake-mem-6 : FAIL
    * rtcwake-mem-5 : FAIL
    * rtcwake-mem-4 : FAIL
    * rtcwake-mem-3 : FAIL
    * rtcwake-mem-2 : FAIL
    * rtcwake-mem-1 : FAIL

sleep - 20 tests: 0  PASS, 20 FAIL, 0 SKIP

  Config:      multi_v7_defconfig
  Lab Name:    lab-collabora-dev
  Board:       rk3288-veyron-jaq
  Date:        2018-08-24 19:51:03.538000

  Test cases:

    * rtcwake-freeze-10 : FAIL
    * rtcwake-freeze-9 : FAIL
    * rtcwake-freeze-8 : FAIL
    * rtcwake-freeze-7 : FAIL
    * rtcwake-freeze-6 : FAIL
    * rtcwake-freeze-5 : FAIL
    * rtcwake-freeze-4 : FAIL
    * rtcwake-freeze-3 : FAIL
    * rtcwake-freeze-2 : FAIL
    * rtcwake-freeze-1 : FAIL
    * rtcwake-mem-10 : FAIL
    * rtcwake-mem-9 : FAIL
    * rtcwake-mem-8 : FAIL
    * rtcwake-mem-7 : FAIL
    * rtcwake-mem-6 : FAIL
    * rtcwake-mem-5 : FAIL
    * rtcwake-mem-4 : FAIL
    * rtcwake-mem-3 : FAIL
    * rtcwake-mem-2 : FAIL
    * rtcwake-mem-1 : FAIL

sleep - 20 tests: 0  PASS, 20 FAIL, 0 SKIP

  Config:      multi_v7_defconfig
  Lab Name:    lab-collabora-dev
  Board:       bcm2836-rpi-2-b
  Date:        2018-08-24 19:55:02.326000

  Test cases:

    * rtcwake-freeze-10 : FAIL
    * rtcwake-freeze-9 : FAIL
    * rtcwake-freeze-8 : FAIL
    * rtcwake-freeze-7 : FAIL
    * rtcwake-freeze-6 : FAIL
    * rtcwake-freeze-5 : FAIL
    * rtcwake-freeze-4 : FAIL
    * rtcwake-freeze-3 : FAIL
    * rtcwake-freeze-2 : FAIL
    * rtcwake-freeze-1 : FAIL
    * rtcwake-mem-10 : FAIL
    * rtcwake-mem-9 : FAIL
    * rtcwake-mem-8 : FAIL
    * rtcwake-mem-7 : FAIL
    * rtcwake-mem-6 : FAIL
    * rtcwake-mem-5 : FAIL
    * rtcwake-mem-4 : FAIL
    * rtcwake-mem-3 : FAIL
    * rtcwake-mem-2 : FAIL
    * rtcwake-mem-1 : FAIL

sleep - 1 tests: 1  PASS, 0 FAIL, 0 SKIP

  Config:      multi_v7_defconfig
  Lab Name:    lab-collabora-dev
  Board:       tegra124-nyan-big
  Date:        2018-08-24 20:05:33.821000

  Test cases:

    * rtcwake-mem-1 : PASS

usb - 1 tests: 1  PASS, 0 FAIL, 0 SKIP

  Config:      multi_v7_defconfig
  Lab Name:    lab-collabora-dev
  Board:       rk3288-rock2-square
  Date:        2018-08-24 19:49:42.670000

  Test cases:

    * usb-presence : PASS

usb - 1 tests: 1  PASS, 0 FAIL, 0 SKIP

  Config:      multi_v7_defconfig
  Lab Name:    lab-collabora-dev
  Board:       imx6q-sabrelite
  Date:        2018-08-24 19:49:44.662000

  Test cases:

    * usb-presence : PASS

usb - 1 tests: 1  PASS, 0 FAIL, 0 SKIP

  Config:      defconfig
  Lab Name:    lab-collabora-dev
  Board:       r8a7796-m3ulcb
  Date:        2018-08-24 19:49:45.936000

  Test cases:

    * usb-presence : PASS

usb - 1 tests: 1  PASS, 0 FAIL, 0 SKIP

  Config:      multi_v7_defconfig
  Lab Name:    lab-collabora-dev
  Board:       rk3288-veyron-jaq
  Date:        2018-08-24 19:52:31.246000

  Test cases:

    * usb-presence : PASS

usb - 1 tests: 1  PASS, 0 FAIL, 0 SKIP

  Config:      multi_v7_defconfig
  Lab Name:    lab-collabora-dev
  Board:       bcm2836-rpi-2-b
  Date:        2018-08-24 19:57:33.915000

  Test cases:

    * usb-presence : PASS

usb - 1 tests: 1  PASS, 0 FAIL, 0 SKIP

  Config:      multi_v7_defconfig
  Lab Name:    lab-collabora-dev
  Board:       exynos5800-peach-pi
  Date:        2018-08-24 19:57:39.825000

  Test cases:

    * usb-presence : PASS

v4l2 - 1 tests: 0  PASS, 1 FAIL, 0 SKIP

  Config:      multi_v7_defconfig
  Lab Name:    lab-collabora-dev
  Board:       rk3288-veyron-jaq
  Date:        2018-08-24 19:51:07.712000

  Test cases:

    * v4l2-compliance : FAIL

----- End forwarded message -----
