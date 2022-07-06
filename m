Message-ID: <6bbe39f5-a8e7-0b42-1ce9-6d32bbc33096@collabora.com>
Date: Wed, 6 Jul 2022 17:59:58 +0100
MIME-Version: 1.0
Subject: Re: next/master build: 205 builds: 8 failed, 197 passed, 21 errors, 52 warnings (next-20220706)
References: <62c5b563.1c69fb81.1240a.62b2@mx.google.com>
 <CAKwvOdnusz+AjYzkW4pyHraJ1_exhwAz9bscMkRiqjiXRj+66g@mail.gmail.com>
 <YsW9la1mD0CneH4b@dev-arch.thelio-3990X>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
In-Reply-To: <YsW9la1mD0CneH4b@dev-arch.thelio-3990X>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, "kernelci@groups.io" <kernelci@groups.io>

On 06/07/2022 17:51, Nathan Chancellor wrote:
>> ^ interesting, these look new to me, must be from the new CrOS configs.
> No, they come from the ARCH=arm allmodconfig with GCC 10. I am in the
> process of bisecting the exact patch that caused these but it is likely
> commit 85f4bc0c333c ("drm/amd/display: Add SubVP required code").

Ah OK.  We should enable KernelCI automated bisections with
builds too actually since it's not entirely trivial to do by hand
and in particular with linux-next.

Guillaume
