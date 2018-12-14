Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] Multiple compiler support in the backend
In-Reply-To: <20181214181910.GF6467@sirena.org.uk>
References: <CAH+k93Fy4sFGYMPVBuOcXwh4_ANt2qdCLMSCRzEjeEihJ1_Ekw@mail.gmail.com> <CAH1_8nAj1h9ooiAOdmSWdP9TAGA_QnYx_-2UM2YrXV+4ACqh5w@mail.gmail.com> <20181214181910.GF6467@sirena.org.uk>
Date: Fri, 14 Dec 2018 10:48:24 -0800
Message-ID: <7h5zvwndvr.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, broonie@kernel.org, kernelci@groups.io, guillaume.tucker@gmail.com
Cc: Matt Hart <matthew.hart@linaro.org>

"Mark Brown" <broonie@kernel.org> writes:

> On Fri, Dec 14, 2018 at 03:01:04PM +0000, Guillaume Tucker wrote:
>
>> Potentially, we could have different flavours of the same
>> compiler version from different build environments.  Say, maybe
>> Linaro's GCC 8 will be different from Debian's etc...  Will the
>> build environment be shown in the email reports, or will there
>> still just be the compiler version as we do now?
>
> At least for GCC based toolchains the convention is for vendors to
> modify the version number of the compiler to indicate that they've added
> stuff - for example, on my desktop right now GCC reports that it is "gcc
> (Debian 8.2.0-6) 8.2.0", the Linaro toolchains do the same as do other
> binary toolchains I've looked at in the past.  That's probably enough I
> think?
>
> Sadly the clang-7 packages for Debian don't seem to have anything like
> that but my locally built copies of clang-8 have the git hash and repo
> URL for everything in the build.

The debian packages for recent clang builds I'm using are from
apt.llvm.org, and they seem to provide pretty detailed versioning:

   $ clang --version |head -1
   clang version 8.0.0-svn345496-1~exp1+0~20181029105533.852~1.gbpf10f36 (trunk)

Kevin
