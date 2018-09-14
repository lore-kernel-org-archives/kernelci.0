MIME-Version: 1.0
From: "Kevin Hilman" <khilman@baylibre.com>
Date: Fri, 14 Sep 2018 14:34:47 -0700
Message-ID: <CAOi56cWCGUTH_4p0K-tOCypE50gKmg8jk9=vowGhQFwNyJX-hA@mail.gmail.com>
Subject: kernelci-frontend: browser cache, and reloads
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Milo Casagrande <milo@foundries.io>
Cc: kernelci@groups.io

Hi Milo,

I don't know much about javascript, but having to rename files each
time we change code seems clunky to me.

This might be just as nasty of a hack, but couldn't we put some magic
string all the .js loads.  Locally we did and experiment by hacking
the minimized require.js with a magic string (I think this[1] is what
would be needed in original.)  Combined with [2], then just changing
the string in those 2 places would force a browser cache reload, no?

For someone that actually knows javascript, there's probably a better
way of doing that with a global variable or similar, but this hack
seems to work without having to change all the filenames.

Note that this is especially useful when changing any of the .js files
that are not (currently) versioned.

Any thoughts on this approach, or perhaps a better one?

Kevin

[1]
diff --git a/app/dashboard/static/js/lib/r.js b/app/dashboard/static/js/lib/r.js
index d4a2a8755722..240b9a7e0bb0 100644
--- a/app/dashboard/static/js/lib/r.js
+++ b/app/dashboard/static/js/lib/r.j
@@ -1920,7 +1920,7 @@ var requirejs, require, define, xpcUtil;

                     //Join the path parts together, then figure out
if baseUrl is needed.
                     url = syms.join('/');
-                    url += (ext || (/^data\:|^blob\:|\?/.test(url) ||
skipExt ? '' : '.js'));
+                    url += (ext || (/^data\:|^blob\:|\?/.test(url) ||
skipExt ? '' : '.js?2018-09-14'));
                     url = (url.charAt(0) === '/' ||
url.match(/^[\w\+\.\-]+:/) ? '' : config.baseUrl) + url;
                 }
[1]
diff --git a/app/dashboard/templates/base-all.html
b/app/dashboard/templates/base-all.html
index ba8e7d47fb1c..1ed2fc221812 100644
--- a/app/dashboard/templates/base-all.html
+++ b/app/dashboard/templates/base-all.html
@@ -30,5 +30,5 @@
 <input type="hidden" id="page-len" value="{{ page_len }}">
 {%- endblock %}{# content block #}
 {%- block scripts %}
-<script data-main="/static/js/{{ data_main }}"
src="/static/js/lib/require.js"></script>
+<script data-main="/static/js/{{ data_main }}"
src="/static/js/lib/require.js?2018-09-14"></script>
 {%- endblock %}
