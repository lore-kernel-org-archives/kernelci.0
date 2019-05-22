MIME-Version: 1.0
References: <AM6PR04MB4104B8BD556E17089924693BAB000@AM6PR04MB4104.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB4104B8BD556E17089924693BAB000@AM6PR04MB4104.eurprd04.prod.outlook.com>
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Wed, 22 May 2019 15:01:27 +0100
Message-ID: <CAH+k93FTdkqyh3N8Q4kUx0cZa5mtHmZzeTPP44NXnckNQNqr1Q@mail.gmail.com>
Subject: Re: Would like to participate in build/boot test
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, suram@nxp.com

On Wed, 22 May 2019 at 09:57, Suram Suram <suram@nxp.com> wrote:
>
> Hi,
> We would like to create setup for  build/ boot tests in our lab.

Hi!

Do you have automated hardware in a lab for boot testing, using
something like LAVA?

> I would like to discuss with you on the same.
> Our interest is to setup a lab that primarily builds the upstream kernel with our patches and see that we are not breaking the build/ boot.

The kernelci.org project produces its own builds of many kernel trees,
and then sends them to volunteer labs to be boot tested.
What kernel tree are you trying to test? Is it available publicly?
Rather than setting up your own builds, maybe your kernel tree could
be added to kernelci.org. The benefit of this is that your kernel tree
will be boot tested in many different labs, on lots of hardware.
Build capacity is limited, so a donation of some build servers may be
requested on a tree with frequent commits.

>
> Is there any forum to discuss on the same?

Your email has been automatically forwarded to the kernelci mailing
list (kernelci@groups.io) which is a good place to discuss your plans.

>
> Regards
> Suram
> 
