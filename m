MIME-Version: 1.0
References: <20211129165803.470795-1-nathan@kernel.org> <202112011140.DA93B3E@keescook>
In-Reply-To: <202112011140.DA93B3E@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 2 Dec 2021 17:26:21 +0900
Message-ID: <CAK7LNASW2F3SxgR6ydMaW7-ZumsxDv2QQTDqVxqJA1JWN3r4FA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] Bump minimum supported version of LLVM to 11.0.0
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Tom Stellard <tstellar@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Naresh Kamboju <naresh.kamboju@linaro.org>, Jakub Kicinski <kuba@kernel.org>, cki-project@redhat.com, kernelci@groups.io, llvm@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Dec 2, 2021 at 4:41 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Nov 29, 2021 at 09:57:57AM -0700, Nathan Chancellor wrote:
> > This patch series raises the minimum supported version of LLVM to
> > 11.0.0.
> >
> > Patch #1 outlines the issue, goes over the potential impact of the
> > change, and does the actual bump. Subsequent patches clean up the
> > various checks that are always true after the bump.
> >
> > I have marked this revision as RFC to give various parties the option to
> > comment on this bump before it is done, namely KernelCI and Linaro's
> > LKFT, who are still testing clang-10. I have added some other folks to
> > CC that I know are testing with clang to see if this impacts them in any
> > way (as I would like to impact as few people as possible) but as far as
> > I am aware, most other CIs and developers are testing closer to tip of
> > tree. If that is not true, scream so that we can see what can be done
> > about that. If I missed anyone who is actively testing with clang,
> > please key them in and I will make sure to include them in future
> > revisions (if any are needed).
> >
> > It probably makes sense for this series to live in -mm.
>
> Sounds good to me. Thanks!
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook


Only positive feedback so far.

All applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
