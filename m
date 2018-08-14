MIME-Version: 1.0
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Tue, 14 Aug 2018 20:21:09 +0100
Message-ID: <CAH+k93God7SdCeet-S=n4iUmLvyJr4+hORa=W852N_tKWFo8Qw@mail.gmail.com>
Subject: Compilers from.. debian?
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi all,

Does anyone have a strong opinion about where we get our compiler releases from?

Currently it's a mash up of Linaro for ARM(32/64), MIPS from unknown,
and X86 from whatever ubuntu is installed on the builder

As part of my work to start building with multiple compiler versions,
I've been creating Dockerfiles for the builders with different
compiler versions installed in them. As I've been doing this, it's
been really easy to just install the various compilers packages from
Debian. They also cover a lot of architectures we're hoping to add in
the future.

Anyone mind if we start using Debian toolchain releases in future?
I'm no toolchain expert, so I'm looking for some opinions.

Thanks!
