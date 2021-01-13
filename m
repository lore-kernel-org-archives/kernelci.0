Return-Path: <dan.rue@linaro.org>
Date: Wed, 13 Jan 2021 10:28:45 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Re: tuxbuilds in kcidb?
Message-ID: <20210113162845.xugh6v5p6talrm7h@jug>
References: <20210113001320.qreaohq2hzzmlxxu@jug>
 <0fd95437-74c4-1ab0-d53e-41fd6fe4f759@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0fd95437-74c4-1ab0-d53e-41fd6fe4f759@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@groups.io

On Wed, Jan 13, 2021 at 01:00:11PM +0200, Nikolai Kondrashov wrote:
> Hi Dan,
> 
> On 1/13/21 2:13 AM, Dan Rue wrote:
> > Hi Nikolai,
> >
> > I took a look at the schema and came up with something like the
> > following:
> >
> >      {
> >          "builds": [
> >              {
> >                  "architecture": "arm64",
> >                  "compiler": "clang-10",
> >                  "config_name": "defconfig",
> >                  "config_url": "https://builds.tuxbuild.com/1myooFaScyEWNS87IO8HSMCu46d/config",
> >                  "id": "tuxsuite:1myooFaScyEWNS87IO8HSMCu46d",
> >                  "log_url": "https://builds.tuxbuild.com/1myooFaScyEWNS87IO8HSMCu46d/build.log",
> >                  "origin": "tuxsuite",
> >                  "revision_id": "e609571b5ffa3528bf85292de1ceaddac342bc1c",
> >                  "valid": true
> >              }
> >          ],
> >          "revisions": [
> >              {
> >                  "git_commit_hash": "e609571b5ffa3528bf85292de1ceaddac342bc1c",
> >                  "git_commit_name": "v5.11-rc3-32-ge609571b5ffa",
> >                  "git_repository_url": "https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline",
> >                  "id": "e609571b5ffa3528bf85292de1ceaddac342bc1c",
> >                  "origin": "tuxsuite"
> >              }
> >          ],
> >          "version": {
> >              "major": 3,
> >              "minor": 0
> >          }
> >      }
> >
> 
> The above looks good to go.
> Only it would be good to add `"valid": true` to revisions (non-patched
> revisions are always valid).

Done.

> 
> Just one question: is "tuxsuite" a (to-be) generally-known name of the
> system which will be sending this? E.g. would you use this name at a
> conference?

TuxSuite (https://tuxsuite.com) is the umbrella brand for all of the
tools and services that we're building. I started with using "tuxbuild"
as the origin but we're working on a high-volume/highly-reliable testing
service (tuxtest), at which time we'd have to have two terms. So, I
think tuxsuite is the way to go here.

> 
> Just want to make sure it stays (relatively) stable and is recognizable.
> 
> > I'm not sure how to represent the result of the build (pass/fail) - I
> > used "valid".
> 
> Yes, that's the right field for now.
> 
> I'm thinking about replacing it with "PASS"/"FAIL" "status", to match tests
> after all, but not sure about that yet.

So if a build passes, i'll set it to True. Otherwise, False.

Note that sometimes users do somewhat foul things (i'm looking at you,
ClangBuiltLinux), which cause builds to fail through no fault of the
source tree. Things like setting various binutils to llvm variants, or
building configs which don't pass with llvm. In other words, these
aren't necessarily curated expected-to-pass builds in all cases. But I
plan to just start with the production LKFT builds, which are expected
to pass in pretty much all cases.

> 
> > I'm not sure how to represent config - in this build's
> > case, the config was built from the following config target and
> > fragments:
> >
> >      "kconfig": [
> >          "defconfig",
> >          "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/lkft.config",
> >          "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/lkft-crypto.config",
> >          "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/distro-overrides.config",
> >          "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/systemd.config",
> >          "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/virtio.config",
> >          "CONFIG_ARM64_MODULE_PLTS=y"
> >      ],
> 
> The schema accepts a URL for a single monolithic config file so far. This
> might be inconvenient for some setups, but is more universal. You can specify
> it using "config_url", and also specify a human-targeted and descriptive
> "config_name". And you seem to be using them just fine in your sample :)
> 
> If you want to provide the above details, put them into the build's "misc"
> object, and if there's demand for it, we can work on formalizing it.

I'll pass config_url, but I'm wondering about config_name. It's not
right to say "defconfig". I could say "defconfig+6" but that also is
really ambiguous, since each additional item can be many config items.

It needs similar treatment to what you're doing to id for describing
patches, I guess (with sha256 of the contents)?

I've toyed with an idea for a sort of "git describe", but for kconfig,
which I hesitate to suggest, but it looks like this:

    y2618-m598-n4097-s536f9fa1d577

Where it's the number of y's in a config, followed by the number of m's,
followed by n's, followed by a truncated sha256 hash (beginning with
"s").

Implementation is as follows:

    #!/bin/sh

    Y_COUNT=$(grep -c "=y$" $1)
    N_COUNT=$(grep -c "is not set$" $1)
    M_COUNT=$(grep -c "=m$" $1)
    SHA=$(sha256sum $1 | cut -c-12)

    echo "y${Y_COUNT}-m${M_COUNT}-n${N_COUNT}-s${SHA}"

To give you an idea of what it looks like, an allmodconfig looks
something like:

    y3954-m7392-n116-sb650e98ffff6

allnoconfig:

    y310-m0-n487-s5b1396a578cd

allyesconfig:

    y11548-m55-n123-s82f7c03fd5be

defconfig:

    y2363-m555-n3979-s4dc1ccbc556a

tinyconfig:

    y308-m0-n483-sdef367a531eb

etc.

> 
> > There were some other fields I wasn't sure about, and I'm not sure how
> > specific some, like compiler, should be ("clang-10" vs "Debian clang
> > version 10.0.1-8+b1").
> 
> The schema doesn't specify this so far, but most reports seem to be using the
> latter. E.g.:
> 
>     https://staging.kernelci.org:3000/d/build/build?orgId=1&var-dataset=kernelci04&var-id=kernelci:staging.kernelci.org:5ffe77964e2859804da07580

Ok, I'll use the full string (the output of `gcc --version` or `clang
--version`)

> 
> Regarding other fields, we can figure them out as we move forward. Your sample
> is certainly good enough to start submitting.
> 
> Would you like to get credentials and submission parameters to start sending
> your data to our "playground" setup, either manually or automatically?
> I can send them to you right away.

Sure, please send them over.

Nice work on all of this Nick - it's really fun to see what this has
become.

Thanks,
Dan

> 
> The data will appear on this dashboard:
> 
>     https://staging.kernelci.org:3000/d/home/home?orgId=1&refresh=30m&var-origin=All&var-git_repository_url=All&var-dataset=playground_kernelci04
> 
> and you will be able to experiment freely without worrying about breaking
> anything.
> 
> Once you feel you got it all set, I can flip the switch on permissions, you
> change a single string in submission parameters, and then you will be
> sending data to our "production".
> 
> Excited to be getting tuxbuild on board!
> Nick
> 
