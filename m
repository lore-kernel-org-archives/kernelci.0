Date: Tue, 7 Dec 2021 15:21:24 +0000
From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC 1/3] headers: add more types to linux/types.h
Message-ID: <Ya979Hh0V2CdhNSU@casper.infradead.org>
References: <20211207150927.3042197-1-arnd@kernel.org>
 <20211207150927.3042197-2-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211207150927.3042197-2-arnd@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, kernelci@groups.io, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev

On Tue, Dec 07, 2021 at 04:09:25PM +0100, Arnd Bergmann wrote:
> +struct list_lru {
> +	struct list_lru_node	*node;
> +#ifdef CONFIG_MEMCG_KMEM
> +	struct list_head	list;
> +	int			shrinker_id;
> +	bool			memcg_aware;
> +#endif
> +};

This is the only one that gives me qualms.  While there are other
CONFIG options mentioned in types.h they're properties of the platform,
eg CONFIG_HAVE_UID16, CONFIG_64BIT, CONFIG_ARCH_DMA_ADDR_T_64BIT, etc.
I dislike it that changing this CONFIG option is going to result in
rebuilding the _entire_ kernel.  CONFIG_MEMCG_KMEM just isn't that
central to how everything works.
