Return-Path: <frowand.list@gmail.com>
From: frowand.list@gmail.com
Subject: [RFC PATCH 0/2] Documentation: dev-tools: begin KTAP spec v2 process
Date: Wed, 16 Mar 2022 15:26:20 -0500
Message-Id: <20220316202622.324866-1-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

An August 2021 RFC patch [1] to create the KTAP Specification resulted in
some discussion of possible items to add to the specification.
The conversation ended without completing the document.

Progress resumed with a December 2021 RFC patch [2] to add a KTAP
Specification file (Version 1) to the Linux kernel.  Many of the
suggestions from the August 2021 discussion were not included in
Version 1.  This patch series is intended to revisit some of the
suggestions from the August 2021 discussion.

Patch 1 changes the Specification version to "2-rc" to indicate
that following patches are not yet accepted into a final version 2.

Patch 2 is an example of a simple change to the Specification.  The
change does not change the content of the Specification, but updates
a formatting directive as suggested by the Documentation maintainer.

I intend to take some specific suggestions from the August 2021
discussion to create stand-alone RFC patches to the Specification
instead of adding them as additional patches in this series.  The
intent is to focus discussion on a single area of the Specification
in each patch email thread.

[1] https://lore.kernel.org/r/CA+GJov6tdjvY9x12JsJT14qn6c7NViJxqaJk+r-K1YJzPggFDQ@mail.gmail.com
[2] https://lore.kernel.org/r/20211207190251.18426-1-davidgow@google.com

Frank Rowand (2):
  Documentation: dev-tools: KTAP spec change version to 2-rc
  Documentation: dev-tools: use literal block instead of code-block

 Documentation/dev-tools/ktap.rst | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

-- 
Frank Rowand <frank.rowand@sony.com>

