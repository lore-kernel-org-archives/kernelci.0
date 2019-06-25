MIME-Version: 1.0
References: <CAKwvOd=VBORyjtbqijM8FGAQUV6r6qy3ADQRGrxnKHY_ke=iPw@mail.gmail.com>
 <20190619185714.GY5316@sirena.org.uk> <CAKwvOd=9U9Z2w8R_GnAKf438f+fXUZ5zCnvsmJGSKnjv+L4g2A@mail.gmail.com>
 <20190620113016.GB5316@sirena.org.uk>
In-Reply-To: <20190620113016.GB5316@sirena.org.uk>
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Tue, 25 Jun 2019 14:55:42 +0100
Message-ID: <CAH+k93GiHtJxFTFgUca2=RPqZDseQq-1377ey9u7Zj5e7gnEYw@mail.gmail.com>
Subject: Re: kernel tree support matrix for Clang
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, kernelci@groups.io, Dan Rue <dan.rue@linaro.org>, Anmar Oueja <anmar.oueja@linaro.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Todd Kjos <tkjos@google.com>, Sandeep Patil <sspatil@google.com>, Alistair Delva <adelva@google.com>, Stephen Hines <srhines@google.com>

Hi all,

Was there an agreement on what trees/branches to consider adding to kernelci?
If there are any that are expected to be noisy or fail I can try them
out on staging first.

On Thu, 20 Jun 2019 at 12:30, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jun 19, 2019 at 02:12:53PM -0700, Nick Desaulniers wrote:
> > On Wed, Jun 19, 2019 at 11:57 AM Mark Brown <broonie@kernel.org> wrote:
>
> > > The last time we talked about it the plan was to turn clang builds on
> > > for mainline just as soon as the last few patches for making that build
> > > land so that should be after the merge window.
>
> > Which merge window? 5.1 or 5.2?
>
> I can't remember off the top of my head; in any case v5.1 is released
> so the v5.2 merge window has passed if everything is in there.
