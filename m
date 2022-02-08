Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 1/1] Documentation: dev-tools: clarify KTAP specification wording
References: <20220208164623.3151777-1-frowand.list@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <86c4c8ce-468d-8922-3ada-7960f1924ba8@linuxfoundation.org>
Date: Tue, 8 Feb 2022 10:11:03 -0700
MIME-Version: 1.0
In-Reply-To: <20220208164623.3151777-1-frowand.list@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: frowand.list@gmail.com, Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>, Kees Cook <keescook@chromium.org>, Rae Moar <rmoar@google.com>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>

On 2/8/22 9:46 AM, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> Add the spec version to the title line.
> 
> Explain likely source of "Unknown lines".
> 
> "Unknown lines" in nested tests are optionally indented.
> 
> Add "Unknown lines" items to differences between TAP & KTAP list
> 
> Reviewed-by: Tim Bird <Tim.Bird@sony.com>
> Reviewed-by: David Gow <davidgow@google.com>
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
> 
> Changes since version 2
>    - Add missing quote after word: incorrect
>    - Add Reviewed-by tags
> 
> Changes since version 1
>    - Explain likely source of "Unknown lines"
>    - "Unknown line" in nested tests are optionally indented
>    - Add "Unknown lines" items to differences between TAP & KTAP list
> 
>   Documentation/dev-tools/ktap.rst | 24 ++++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
> index 878530cb9c27..dfb3f10a8b2d 100644
> --- a/Documentation/dev-tools/ktap.rst
> +++ b/Documentation/dev-tools/ktap.rst
> @@ -1,8 +1,8 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> -========================================
> -The Kernel Test Anything Protocol (KTAP)
> -========================================
> +===================================================
> +The Kernel Test Anything Protocol (KTAP), version 1
> +===================================================
>   
>   TAP, or the Test Anything Protocol is a format for specifying test results used
>   by a number of projects. It's website and specification are found at this `link
> @@ -174,6 +174,13 @@ There may be lines within KTAP output that do not follow the format of one of
>   the four formats for lines described above. This is allowed, however, they will
>   not influence the status of the tests.
>   
> +This is an important difference from TAP.  Kernel tests may print messages
> +to the system console or a log file.  Both of these destinations may contain
> +messages either from unrelated kernel or userspace activity, or kernel
> +messages from non-test code that is invoked by the test.  The kernel code
> +invoked by the test likely is not aware that a test is in progress and
> +thus can not print the message as a diagnostic message.
> +
>   Nested tests
>   ------------
>   
> @@ -186,10 +193,13 @@ starting with another KTAP version line and test plan, and end with the overall
>   result. If one of the subtests fail, for example, the parent test should also
>   fail.
>   
> -Additionally, all result lines in a subtest should be indented. One level of
> +Additionally, all lines in a subtest should be indented. One level of
>   indentation is two spaces: "  ". The indentation should begin at the version
>   line and should end before the parent test's result line.
>   
> +"Unknown lines" are not considered to be lines in a subtest and thus are
> +allowed to be either indented or not indented.
> +
>   An example of a test with two nested subtests:
>   
>   .. code-block::
> @@ -225,9 +235,11 @@ Major differences between TAP and KTAP
>   --------------------------------------
>   
>   Note the major differences between the TAP and KTAP specification:
> -- yaml and json are not recommended in diagnostic messages
> -- TODO directive not recognized
> +- yaml and json are not recommended in KTAP diagnostic messages
> +- TODO directive not recognized in KTAP
>   - KTAP allows for an arbitrary number of tests to be nested> +- TAP includes "Unknown lines" in the category of "Anything else"
> +- TAP says "Unknown lines" are "incorrect"; KTAP allows "Unknown lines"
>   

If we can put the data in a table - makes it lot easier to read

>   The TAP14 specification does permit nested tests, but instead of using another
>   nested version line, uses a line of the form
> 

Looks good otherwise. Thanks for clearly outlining the differences.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
