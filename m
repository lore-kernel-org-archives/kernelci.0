MIME-Version: 1.0
References: <CAKwvOd=VBORyjtbqijM8FGAQUV6r6qy3ADQRGrxnKHY_ke=iPw@mail.gmail.com>
 <20190619185714.GY5316@sirena.org.uk> <CAKwvOd=9U9Z2w8R_GnAKf438f+fXUZ5zCnvsmJGSKnjv+L4g2A@mail.gmail.com>
 <20190620113016.GB5316@sirena.org.uk> <CAH+k93GiHtJxFTFgUca2=RPqZDseQq-1377ey9u7Zj5e7gnEYw@mail.gmail.com>
In-Reply-To: <CAH+k93GiHtJxFTFgUca2=RPqZDseQq-1377ey9u7Zj5e7gnEYw@mail.gmail.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Tue, 25 Jun 2019 12:45:58 -0700
Message-ID: <CAKwvOdkqEBHy1rY+fHKDdf3g5tT8feZ5=pevYNYxGdx7qtpp6Q@mail.gmail.com>
Subject: Re: kernel tree support matrix for Clang
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Matt Hart <matthew.hart@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, kernelci@groups.io, Dan Rue <dan.rue@linaro.org>, Anmar Oueja <anmar.oueja@linaro.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Todd Kjos <tkjos@google.com>, Sandeep Patil <sspatil@google.com>, Alistair Delva <adelva@google.com>, Stephen Hines <srhines@google.com>

On Tue, Jun 25, 2019 at 6:55 AM Matt Hart <matthew.hart@linaro.org> wrote:
>
> Hi all,
>
> Was there an agreement on what trees/branches to consider adding to kernelci?
> If there are any that are expected to be noisy or fail I can try them
> out on staging first.

Hi Matt,
I just filed:
- https://github.com/kernelci/kernelci-core/issues/103: [clang]
additional trees/branches
- https://github.com/kernelci/kernelci-core/issues/104: [clang] enable lld
- https://github.com/kernelci/kernelci-core/issues/105: [clang]
additional arches

I think those would greatly expand coverage for the important cases.

Probably worthwhile to test each on staging, but I expect defconfigs
to be much cleaner (I'm worried about allyesconfig builds on stable
trees).
-- 
Thanks,
~Nick Desaulniers
