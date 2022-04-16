Return-Path: <keescook@chromium.org>
Date: Sat, 16 Apr 2022 14:13:25 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 2/2] selftests/lkdtm: add config
Message-ID: <202204161407.D6D3202FD@keescook>
References: <20220217205620.2512094-1-usama.anjum@collabora.com>
 <20220217205620.2512094-2-usama.anjum@collabora.com>
 <202203091123.33E89F5@keescook>
 <76529762-1a36-142d-0aa9-beb5fa2bb27b@collabora.com>
 <aaeaefb7-3655-2863-46ae-162bf5ab761c@collabora.com>
 <a9c74cc2-491e-678a-8965-86fa6a6002dc@collabora.com>
MIME-Version: 1.0
In-Reply-To: <a9c74cc2-491e-678a-8965-86fa6a6002dc@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@collabora.com, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 04, 2022 at 12:50:01PM +0500, Muhammad Usama Anjum wrote:
> Hi Kees,
> 
> Any thoughts?
> 
> On 3/15/22 4:55 PM, Muhammad Usama Anjum wrote:
> > On 3/10/22 10:22 PM, Muhammad Usama Anjum wrote:
> >> On 3/10/22 12:23 AM, Kees Cook wrote:
> >>> On Fri, Feb 18, 2022 at 01:56:20AM +0500, Muhammad Usama Anjum wrote:
> >>>> Add config option which is needed for SLAB_LINEAR_OVERFLOW test. It
> >>>> needs KASAN enabled.
> >>>
> >>> I'd prefer this use the SLAB_DEBUG options -- KASAN is very heavy.
> >> I'll test it out and update in the next patch version.
> >> I've tested by removing KASAN and adding the following config:
> > CONFIG_SLAB=y
> > CONFIG_DEBUG_SLAB=y

I recommend slub instead:

CONFIG_SLUB=y
CONFIG_SLUB_DEBUG=y

and one more, see below...

> > 
> > The result of SLAB_LINEAR_OVERFLOW test doesn't remain deterministic in
> > this config. The task never crashes and hence stack trace never appears.
> > When executed several times we get "Slab corruption" logs and after some
> > more tries whole kernel crashes. I've not used DEBUG_SLAB before and not
> > sure if this is the expected behavior. If we aren't sure, we can keep
> > KASAN turned on instead.

I think you need to enable the actual kmem debugging with a boot param
("slub_debug=ZF"), or with CONFIG_SLUB_DEBUG_ON=y.

-- 
Kees Cook
