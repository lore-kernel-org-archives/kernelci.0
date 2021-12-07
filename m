Return-Path: <torvalds@linuxfoundation.org>
MIME-Version: 1.0
References: <20211207150927.3042197-1-arnd@kernel.org> <20211207150927.3042197-3-arnd@kernel.org>
In-Reply-To: <20211207150927.3042197-3-arnd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Dec 2021 10:17:45 -0800
Message-ID: <CAHk-=wgwQg=5gZZ6ewusLHEAw-DQm7wWm7aoQt6TYO_xb0cBog@mail.gmail.com>
Subject: Re: [RFC 2/3] headers: introduce linux/struct_types.h
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, kernelci@groups.io, linux-fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev

On Tue, Dec 7, 2021 at 7:10 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Working towards a cleaner header structure, start by moving the most
> commonly embedded structures into a single header file that itself
> has only a minimum set of indirect includes. At this moment, this
> include structures for

Ugh. I liked your 1/3 patch, but I absolutely detest this one.

It makes no sense to me, and just makes that header file a completely
random collection of some random structure types.

And I absolutely hate how it splits out the definition of the struct
from basic core infrastructure (initializers etc random inline
functions) for said structures.

So no. NAK on this one. I think it's a disaster.

              Linus
