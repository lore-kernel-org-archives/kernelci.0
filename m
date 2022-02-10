Return-Path: <frowand.list@gmail.com>
From: frowand.list@gmail.com
Subject: [PATCH v4 0/2] Documentation: dev-tools: clarify KTAP specification wording
Date: Wed,  9 Feb 2022 20:35:17 -0600
Message-Id: <20220210023519.3221051-1-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Rae Moar <rmoar@google.com>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Clarify ambiguous wording in KTAP specification version 1.

Fix build warnings.

Changes since version 3
  - Add Reviewed-by: Shuah Khan
  - Add patch 2/2 to fix build warnings

Frank Rowand (2):
  Documentation: dev-tools: clarify KTAP specification wording
  Documentation: dev-tools: fix KTAP specification build warnings

 Documentation/dev-tools/ktap.rst | 49 +++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 17 deletions(-)

-- 
Frank Rowand <frank.rowand@sony.com>

