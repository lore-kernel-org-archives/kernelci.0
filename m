MIME-Version: 1.0
References: <20211207150927.3042197-1-arnd@kernel.org> <20211207150927.3042197-2-arnd@kernel.org>
 <Ya979Hh0V2CdhNSU@casper.infradead.org>
In-Reply-To: <Ya979Hh0V2CdhNSU@casper.infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 7 Dec 2021 16:44:47 +0100
Message-ID: <CAK8P3a2gsdbiQoH_82Nm97DeENzJMUZn99m0LHE4Rt-0pd2d6w@mail.gmail.com>
Subject: Re: [RFC 1/3] headers: add more types to linux/types.h
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, kernelci@groups.io, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev

On Tue, Dec 7, 2021 at 4:21 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Dec 07, 2021 at 04:09:25PM +0100, Arnd Bergmann wrote:
> > +struct list_lru {
> > +     struct list_lru_node    *node;
> > +#ifdef CONFIG_MEMCG_KMEM
> > +     struct list_head        list;
> > +     int                     shrinker_id;
> > +     bool                    memcg_aware;
> > +#endif
> > +};
>
> This is the only one that gives me qualms.  While there are other
> CONFIG options mentioned in types.h they're properties of the platform,
> eg CONFIG_HAVE_UID16, CONFIG_64BIT, CONFIG_ARCH_DMA_ADDR_T_64BIT, etc.
> I dislike it that changing this CONFIG option is going to result in
> rebuilding the _entire_ kernel.  CONFIG_MEMCG_KMEM just isn't that
> central to how everything works.

I included this one because 'struct list_lru' is used in 'struct
super_block', which I move
into 'linux/fs_types.h' in the third patch. It is otherwise not used a
lot though, and
'struct super_block' is rarely much outside of file system code. If we
leave super_block
in fs.h or in a separate header, it should be fine.

        Arnd
