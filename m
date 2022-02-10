Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 2/2] Documentation: dev-tools: fix KTAP specification build warnings
References: <20220210023519.3221051-1-frowand.list@gmail.com>
 <20220210023519.3221051-3-frowand.list@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <d09b0054-b96f-3d3f-5b33-853994723c3a@linuxfoundation.org>
Date: Thu, 10 Feb 2022 10:25:36 -0700
MIME-Version: 1.0
In-Reply-To: <20220210023519.3221051-3-frowand.list@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: frowand.list@gmail.com, Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>, Kees Cook <keescook@chromium.org>, Rae Moar <rmoar@google.com>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>

On 2/9/22 7:35 PM, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> Convert "Major differences between TAP and KTAP" from a bullet list
> to a table.  The bullet list was being formatted as a single
> paragraph.
> 
> Add missing required argument in code-block directives.
> 
> ---
> 
> Table conversion suggested by Shuah.
> 
> Patch 2/2 not previously reviewed, so Reviewed-by tags not provided.
> 
> Changes since version 3
>    - Add this commit (patch 2/2) to the series
> 
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
>   Documentation/dev-tools/ktap.rst | 33 +++++++++++++++++---------------
>   1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
> index dfb3f10a8b2d..5ee735c6687f 100644
> --- a/Documentation/dev-tools/ktap.rst
> +++ b/Documentation/dev-tools/ktap.rst
> @@ -68,7 +68,7 @@ Test case result lines
>   Test case result lines indicate the final status of a test.
>   They are required and must have the format:
>   
> -.. code-block::
> +.. code-block:: none
>   
>   	<result> <number> [<description>][ # [<directive>] [<diagnostic data>]]
>   
> @@ -117,32 +117,32 @@ separator.
>   
>   Example result lines include:
>   
> -.. code-block::
> +.. code-block:: none
>   
>   	ok 1 test_case_name
>   
>   The test "test_case_name" passed.
>   
> -.. code-block::
> +.. code-block:: none
>   
>   	not ok 1 test_case_name
>   
>   The test "test_case_name" failed.
>   
> -.. code-block::
> +.. code-block:: none
>   
>   	ok 1 test # SKIP necessary dependency unavailable
>   
>   The test "test" was SKIPPED with the diagnostic message "necessary dependency
>   unavailable".
>   
> -.. code-block::
> +.. code-block:: none
>   
>   	not ok 1 test # TIMEOUT 30 seconds
>   
>   The test "test" timed out, with diagnostic data "30 seconds".
>   
> -.. code-block::
> +.. code-block:: none
>   
>   	ok 5 check return code # rcode=0
>   
> @@ -202,7 +202,7 @@ allowed to be either indented or not indented.
>   
>   An example of a test with two nested subtests:
>   
> -.. code-block::
> +.. code-block:: none
>   
>   	KTAP version 1
>   	1..1
> @@ -215,7 +215,7 @@ An example of a test with two nested subtests:
>   
>   An example format with multiple levels of nested testing:
>   
> -.. code-block::
> +.. code-block:: none
>   
>   	KTAP version 1
>   	1..2
> @@ -234,12 +234,15 @@ An example format with multiple levels of nested testing:
>   Major differences between TAP and KTAP
>   --------------------------------------
>   
> -Note the major differences between the TAP and KTAP specification:
> -- yaml and json are not recommended in KTAP diagnostic messages
> -- TODO directive not recognized in KTAP
> -- KTAP allows for an arbitrary number of tests to be nested
> -- TAP includes "Unknown lines" in the category of "Anything else"
> -- TAP says "Unknown lines" are "incorrect"; KTAP allows "Unknown lines"
> +==================================================   =========  ===============
> +Feature                                              TAP        KTAP
> +==================================================   =========  ===============
> +yaml and json in diagnosic message                   ok         not recommended
> +TODO directive                                       ok         not recognized
> +allows an arbitrary number of tests to be nested     no         yes
> +"Unknown lines" are in category of "Anything else"   yes        no
> +"Unknown lines" are                                  incorrect  allowed
> +==================================================   =========  ===============
>   
>   The TAP14 specification does permit nested tests, but instead of using another
>   nested version line, uses a line of the form
> @@ -247,7 +250,7 @@ nested version line, uses a line of the form
>   
>   Example KTAP output
>   --------------------
> -.. code-block::
> +.. code-block:: none
>   
>   	KTAP version 1
>   	1..1
> 

Table looks good. Thanks for adding it. The two patches could be
collapsed into one perhaps? Either way:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
