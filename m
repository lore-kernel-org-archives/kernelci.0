Return-Path: <frowand.list@gmail.com>
From: frowand.list@gmail.com
Subject: [PATCH v2 0/2] begin KTAP spec v2 process
Date: Wed,  4 May 2022 17:51:50 -0500
Message-Id: <20220504225152.1451440-1-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Frank Rowand <frowand.list@gmail.com>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

The process to create version 2 of the KTAP Specification is documented
in email discussions.  I am attempting to capture this information at

   https://elinux.org/Test_Results_Format_Notes#KTAP_version_2

I am already not following the suggested process, which says:
"...please try to follow this principal of one major topic per email
thread."  I think that is ok in this case because the two patches
are related and (hopefully) not controversial.

Changes since patch version 1:
   - drop patch 1/2.  Jonathan Corbet has already applied this patch
     into version 1 of the Specification
   - rename patch 2/2 to patch 1/2, with updated patch comment
   - add new patch 2/2

Frank Rowand (2):
  ktap_v2: change version to 2-rc in KTAP specification
  ktap_v2: change "version 1" to "version 2" in examples

 Documentation/dev-tools/ktap.rst | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

-- 
Frank Rowand <frank.rowand@sony.com>

