MIME-Version: 1.0
References: <CANiq72k7zix1TiK0_Zr9nu9sG7SAQRt4GRE5y=_4Um6=djZmJw@mail.gmail.com>
 <e702e47e-1fee-2613-1909-194a72d21736@collabora.com> <CANiq72nh3RrQxnHv-evMQG0PHxv8yzMQufmqqqQ43Nqa-28wgA@mail.gmail.com>
 <b40bf5ba-c18c-61b3-a00c-556487d7b5d2@collabora.com>
In-Reply-To: <b40bf5ba-c18c-61b3-a00c-556487d7b5d2@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Nov 2022 11:28:38 +0100
Message-ID: <CANiq72=sTnkVT-e_D4NfUMp=pux=EdLPsFUO=6UeZPiW5KnCkw@mail.gmail.com>
Subject: Re: Build-testing Rust support
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Collabora Kernel ML <kernel@collabora.com>, "kernelci@groups.io" <kernelci@groups.io>

On Mon, Nov 7, 2022 at 8:20 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> FYI there's now an open PR on GitHub:
>
>   https://github.com/kernelci/kernelci-core/pull/1468

Thanks for this!

> Would you or other maintainers involved with Rust in the kernel
> be available to help and keep this working in the long term?  I
> suspect the build commands and toolchains will occasionally need

Happy to help. The build commands should stay roughly the same,
although as you say it may require small changes at some point (e.g. I
saw you are also testing the `rust` branch, which may go away at some
point).

> to be updated.  Also someone needs to look into the results to
> make the whole thing worthwhile.

Are the reports sent by email similar to the kernel test robot? Or is
it a "pull" approach where we look into the dashboard?

Cheers,
Miguel
