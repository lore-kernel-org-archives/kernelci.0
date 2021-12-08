MIME-Version: 1.0
References: <20211207150927.3042197-1-arnd@kernel.org> <20211207150927.3042197-4-arnd@kernel.org>
 <20211208100514.7egjy5hraziu4pme@wittgenstein>
In-Reply-To: <20211208100514.7egjy5hraziu4pme@wittgenstein>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 8 Dec 2021 11:10:26 +0100
Message-ID: <CAK8P3a1zD=FY39vqWAjZH2yYYtvQMzFOCRayXuDae4H6sCWs1w@mail.gmail.com>
Subject: Re: [RFC 3/3] headers: repurpose linux/fs_types.h
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, kernelci@groups.io, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev

On Wed, Dec 8, 2021 at 11:05 AM Christian Brauner
<christian.brauner@ubuntu.com> wrote:
>
> On Tue, Dec 07, 2021 at 04:09:27PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > linux/fs_types.h traditionally describes the types of file systems we
> > deal with, but the file name could also be interpreted to refer to
> > data types used for interacting with file systems, similar to
> > linux/spinlock_types.h or linux/mm_types.h.
> >
> > Splitting out the data type definitions from the generic header helps
> > avoid excessive indirect include hierarchies, so steal this file
> > name and repurpose it to contain the definitions for file, inode,
> > address_space, super_block, file_lock, quota and filename, along with
> > their respective callback operations, moving them out of linux/fs.h.
> >
> > The preprocessed linux/fs_types.h is now about 50KB, compared to
> > over 1MB for the traditional linux/fs.h, and can be included from
> > most other headers that currently rely on type definitions from
> > linux/fs.h.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
>
> I tried to apply the series to take a closer look but it fails to apply
> cleanup down to v5.15 and any release after that. What's the base I
> should use for this?

It is based on yesterday's linux-next plus additional patches I used
for testing. Sorry about the extra troubles, but this was the most
convenient way for me, as it lets me find build regressions in random
configs more easily when I have a base tree that builds randconfig
warning-free.

The patches are at the top of my randconfig tree [1] at the moment,
so you can try out that tree, or rebase the patches from there.

        Arnd

[1] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=randconfig-5.17-next
