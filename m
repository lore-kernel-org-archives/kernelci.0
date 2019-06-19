MIME-Version: 1.0
References: <CAKwvOd=VBORyjtbqijM8FGAQUV6r6qy3ADQRGrxnKHY_ke=iPw@mail.gmail.com>
 <20190619185714.GY5316@sirena.org.uk>
In-Reply-To: <20190619185714.GY5316@sirena.org.uk>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Wed, 19 Jun 2019 14:12:53 -0700
Message-ID: <CAKwvOd=9U9Z2w8R_GnAKf438f+fXUZ5zCnvsmJGSKnjv+L4g2A@mail.gmail.com>
Subject: Re: kernel tree support matrix for Clang
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@groups.io, Matt Hart <matthew.hart@linaro.org>, Dan Rue <dan.rue@linaro.org>, Anmar Oueja <anmar.oueja@linaro.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Todd Kjos <tkjos@google.com>, Sandeep Patil <sspatil@google.com>, Alistair Delva <adelva@google.com>, Stephen Hines <srhines@google.com>

On Wed, Jun 19, 2019 at 11:57 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jun 19, 2019 at 11:04:34AM -0700, Nick Desaulniers via Groups.Io wrote:
>
> > and
> > limits our coverage to basically defconfigs.
>
> These appear to mostly be defconfig builds?

Yes, there are some hacks with scripts/config to enable a few more
things (kselftests), but allyesconfig blows through our allotted 50
minutes on the free tier 2 core boxes.

> > Today KernelCI is covering builds of linux-next with Clang, which is a
> > great first step.  I think the above list of trees & branches listed
> > above for the reasons above are good next steps for KernelCI coverage.
>
> > What do you all think?
>
> The last time we talked about it the plan was to turn clang builds on
> for mainline just as soon as the last few patches for making that build
> land so that should be after the merge window.

Which merge window? 5.1 or 5.2?

> For the stables I did see in at least v4.4 what looked like new
> warnings, I'm guessing Greg would take fixes for them but it's probably
> better to do do that before enabling anything.

GKH has been accepting patches for enabling Clang support.  Nathan
Chancellor, Matthias Kaehlcke, and I have been sending backports for
Clang support.
-- 
Thanks,
~Nick Desaulniers
