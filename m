Return-Path: <keescook@chromium.org>
Date: Sat, 16 Apr 2022 14:06:43 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 1/2] selftests/lkdtm: add config and turn off CFI_FORWARD_PROTO
Message-ID: <202204161400.B2267D6@keescook>
References: <20220217205620.2512094-1-usama.anjum@collabora.com>
 <202203091122.A51B31230A@keescook>
 <62c11336-cac1-8501-19fe-980ebfa050e9@collabora.com>
 <8049e2a9-a478-4c6a-afcd-3aa4434a0590@collabora.com>
MIME-Version: 1.0
In-Reply-To: <8049e2a9-a478-4c6a-afcd-3aa4434a0590@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, kernel@collabora.com, kernelci@groups.io, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org

On Thu, Apr 14, 2022 at 04:31:42PM +0500, Muhammad Usama Anjum wrote:
> Any thoughts?
> 
> On 3/10/22 10:21 PM, Muhammad Usama Anjum wrote:
> > On 3/10/22 12:22 AM, Kees Cook wrote:
> >> On Fri, Feb 18, 2022 at 01:56:19AM +0500, Muhammad Usama Anjum wrote:
> >>> Add config options which are needed for LKDTM sub-tests.
> >>> STACKLEAK_ERASING test needs GCC_PLUGIN_STACKLEAK config.
> >>> READ_AFTER_FREE and READ_BUDDY_AFTER_FREE tests need
> >>> INIT_ON_FREE_DEFAULT_ON config.
> >>>
> >>> CFI_FORWARD_PROTO always fails as there is no active CFI system of some
> >>> kind. Turn it off for now by default until proper support.
> >>
> >> Building under LTO Clang on arm64, this is available. What's the right
> >> way to add a CONFIG that isn't always available?
> >>
> >> -Kees
> > Yeah, as you had mentioned
> > (https://github.com/kernelci/kernelci-project/issues/84#issuecomment-1042015431):
> > 
> > CFI_FORWARD_PROTO is going to fail unless there is an active CFI system
> > in place of some kind. Right now this depends on arm64+Clang. In the
> > future, this will be arch-agnostic+Clang, but for the moment, it should
> > be safe to exclude this test.
> > 
> > In this patch, I'm turning off CFI_FORWARD_PROTO by default here. We can
> > re-enable it when it becomes arch agnostic. CFI_FORWARD_PROTO cannot be
> > turned off by using a config. Please let me know your thoughts otherwise.

I don't like the idea of disabling the test because this means it won't
have any output in CI systems to examine at all. I'd much rather have
tests that are expecting to fail to report XFAIL from the kernel
instead. (See things like lkdtm_UNSET_SMEP.)

-- 
Kees Cook
