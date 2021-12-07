MIME-Version: 1.0
References: <20211207150927.3042197-1-arnd@kernel.org> <20211207150927.3042197-3-arnd@kernel.org>
 <Ya9+jqIPJ8y0/Q4s@casper.infradead.org>
In-Reply-To: <Ya9+jqIPJ8y0/Q4s@casper.infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 7 Dec 2021 18:07:11 +0100
Message-ID: <CAK8P3a3UFFP0HP+WmHFuQbBTGK8K5YLE+mYc8mspiU7G--BqJg@mail.gmail.com>
Subject: Re: [RFC 2/3] headers: introduce linux/struct_types.h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, kernelci@groups.io, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev

On Tue, Dec 7, 2021 at 4:32 PM Matthew Wilcox <willy@infradead.org> wrote:

> >  #define __SWAITQUEUE_INITIALIZER(name) {                             \
> >       .task           =3D current,                                     =
 \
> >       .task_list      =3D LIST_HEAD_INIT((name).task_list),            =
 \
>
> swait.h doesn't need to include <linux/struct_types.h> ?

I should probably add it for consistency, also in some other places.
At the moment it works without that because the new header is pulled
in through linux/spinlock.h.

> > -
> >  #define XARRAY_INIT(name, flags) {                           \
> >       .xa_lock =3D __SPIN_LOCK_UNLOCKED(name.xa_lock),          \
> >       .xa_flags =3D flags,                                      \
>
> I think this is going to break:
>
> (cd tools/testing/radix-tree; make)

I've tried addressing this now, but I first ran into a different problem
that exists in linux-next but not in mainline as of today:

cc -I. -I../../include -g -Og -Wall -D_LGPL_SOURCE -fsanitize=3Daddress
-fsanitize=3Dundefined   -c -o main.o main.c
In file included from ./linux/xarray.h:2,
                 from ./linux/../../../../include/linux/radix-tree.h:21,
                 from ./linux/radix-tree.h:5,
                 from main.c:10:
./linux/../../../../include/linux/xarray.h: In function =E2=80=98xas_find_c=
hunk=E2=80=99:
./linux/../../../../include/linux/xarray.h:1669:9: warning: implicit
declaration of function =E2=80=98find_next_bit=E2=80=99
[-Wimplicit-function-declaration]
 1669 |  return find_next_bit(addr, XA_CHUNK_SIZE, offset);
      |         ^~~~~~~~~~~~~
cc -I. -I../../include -g -Og -Wall -D_LGPL_SOURCE -fsanitize=3Daddress
-fsanitize=3Dundefined   -c -o xarray.o xarray.c
In file included from ./linux/xarray.h:2,
                 from ./linux/../../../../include/linux/radix-tree.h:21,
                 from ./linux/radix-tree.h:5,
                 from test.h:4,
                 from xarray.c:8:
./linux/../../../../include/linux/xarray.h: In function =E2=80=98xas_find_c=
hunk=E2=80=99:
./linux/../../../../include/linux/xarray.h:1669:9: warning: implicit
declaration of function =E2=80=98find_next_bit=E2=80=99
[-Wimplicit-function-declaration]
 1669 |  return find_next_bit(addr, XA_CHUNK_SIZE, offset);
      |         ^~~~~~~~~~~~~
In file included from ../../include/linux/bitmap.h:7,
                 from ../../../lib/xarray.c:9,
                 from xarray.c:16:
../../include/linux/find.h: At top level:
../../include/linux/find.h:31:15: error: conflicting types for =E2=80=98fin=
d_next_bit=E2=80=99
   31 | unsigned long find_next_bit(const unsigned long *addr,
unsigned long size,
      |               ^~~~~~~~~~~~~
In file included from ./linux/xarray.h:2,
                 from ./linux/../../../../include/linux/radix-tree.h:21,
                 from ./linux/radix-tree.h:5,
                 from test.h:4,
                 from xarray.c:8:
./linux/../../../../include/linux/xarray.h:1669:9: note: previous
implicit declaration of =E2=80=98find_next_bit=E2=80=99 was here
 1669 |  return find_next_bit(addr, XA_CHUNK_SIZE, offset);
      |         ^~~~~~~~~~~~~
make: *** [<builtin>: xarray.o] Error 1

It's clearly broken after Yury's recent bitops.h cleanup, but I can't
quite find my way
through the maze of tools/testing headers to fix it.

        Arnd
