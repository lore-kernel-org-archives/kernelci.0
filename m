MIME-Version: 1.0
References: <CANiq72k7zix1TiK0_Zr9nu9sG7SAQRt4GRE5y=_4Um6=djZmJw@mail.gmail.com>
 <e702e47e-1fee-2613-1909-194a72d21736@collabora.com>
In-Reply-To: <e702e47e-1fee-2613-1909-194a72d21736@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 15 Jan 2022 02:35:31 +0100
Message-ID: <CANiq72nh3RrQxnHv-evMQG0PHxv8yzMQufmqqqQ43Nqa-28wgA@mail.gmail.com>
Subject: Re: Build-testing Rust support
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io

Hi Guillaume,

On Thu, Jan 13, 2022 at 9:32 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Please feel free to reply and Cc kernelci@groups.io if you're OK
> with this, so we're all on the same page.

Cc'ing :)

> Yes, I don't see any major technical challenge with that.  All
> the KernelCI toolchains are managed in Docker images, so we could
> easily have some with Rust.
>
> We have Kubernetes clusters donated by Google and Microsoft with
> plenty of build resources, and I'm sure we could extend them if
> needed for Rust.  If we start with just linux-next and a couple
> of CPU architectures, it shouldn't really have any measurable
> impact on our current build throughput.

Sounds great! Even if it is only a couple architectures, it will be
helpful to start testing bigger / more realistic configs (currently we
only build+boot test a couple of very small, fixed kernel configs on
pre-merge in a GitHub CI).

> Then hopefully we'll also find a way to have enough people
> available to make it sustainable.  Ideally, I believe someone
> involved with Rust support in the kernel should be the primary
> maintainer for this.  We're already starting to see kernel
> maintainers and developers contribute to KernelCI and make
> it "their own" in a way.  We could always start small with just a
> few builds per kernel revision and then find ways to scale up.

Of course -- please let me know anything I can do to help. By
maintaining, do you mean e.g. preparing the Docker images, submitting
needed changes to the KernelCI config like the yml files, ...?

> The Docker images with the toolchains are typically updated once
> a week, in particular this means we always have the latest
> LLVM/Clang release from .deb packages.  We could do the same with
> Rust, to have the latest toolchain version updated at the same
> frequency.  Using binary packages would be better than building
> it from source though, but we could manage either way if needed.

Every week fits perfectly what we would need. While Debian does not
have the latest Rust compilers available (not even in Sid [2], as far
as I can see), installing the official Rust binaries should the easy
(or preparing a .deb out of them if needed, I guess). Compiling from
source is also fairly easy.

[2] https://packages.debian.org/sid/rustc

> Missing [1] link?

Oops, sorry: [1] https://packages.fedoraproject.org/pkgs/rust/rust/

> You knocked on the right door :)  Thanks for getting in touch.

Not at all -- thanks to you!

> This all sounds great, we knew we would have to support Rust at
> some point and it seems like that time has now come.  Having some
> help with getting the exact commands, compiler flags or any
> gotchas for each architecture would probably save us a lot of
> time.  Then integrating that in the KernelCI pipeline shouldn't
> be too difficult (famous last words).

Of course, please let me know anything I can do to help (see above as well).

On commands etc., I am more than happy to help setting everything up
(if you want to take a look on your own:
https://github.com/Rust-for-Linux/linux/blob/rust/Documentation/rust/quick-start.rst
covers the build requirements).

And, indeed, given the very small testing space we cover on our side
so far (and how experimental things are), I guess it is likely we hit
something, somewhere. :) But, well, that is part of the exercise -- to
discover anything that might be broken!

> We have weekly KernelCI meetings on Tuesdays at 17:00 UTC, maybe
> you could join one day to discuss this a bit further?  We can
> also use the mailing lists of course.

Sure, I would be glad to join!

Cheers,
Miguel
