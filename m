MIME-Version: 1.0
References: <CAFW5HqTm3ZF1m8uuP1vJ1mCXd-OZbQqBOfEsHc7B_VwbB2+i3g@mail.gmail.com>
In-Reply-To: <CAFW5HqTm3ZF1m8uuP1vJ1mCXd-OZbQqBOfEsHc7B_VwbB2+i3g@mail.gmail.com>
From: "Milosz Wasilewski" <milosz.wasilewski@linaro.org>
Date: Mon, 19 Oct 2020 09:07:58 +0100
Message-ID: <CAJrz+7K+dyGZCMO8016bVMusUHin5_p-Q0961DRLPU11fsksJg@mail.gmail.com>
Subject: Re: LAVA : relays and PDU's info for dragonboard-845 DUT in India
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, koti koti <kotisoftwaretest@gmail.com>
Cc: "lava-users@lists.lavasoftware.org" <lava-users@lists.lavasoftware.org>

On Fri, 16 Oct 2020 at 16:22, koti koti <kotisoftwaretest@gmail.com> wrote:
>
> Hi,
>
> I have connected  my Dragonboard-845 DUT to Lava Dispatcher (Dispatcher is
> "raspberry pi 4" SBC)
>
> Now I need to set up "Remote Power Control" and  "Set target into Program
> mode" .
>
> Please can someone let me know the required hardware list  like  "Remote
> PDU (Remote Power Distribution)" and  "Relays"  units purchase URL's in
> India for below requirement.
>
> 1. Power ON/Power OFF/reboot  the target from Lava Dispatcher.  ( Hope this
> functionality may be fully filled by the PDU. Can some let me know low cost
> PDU's URLs with 2 outlets)
> 2.  set target into Programing mode ( to flash the images)   (Is this
> functionality can be done by any relays? if yes, Please can someone let me
> know the available relays URL's in India)

you need to erase 'boot' partition. This way firmware always starts in
fastboot mode.

milosz

>
> Note:
> 1. I have found a couple of Relays URL's (
> https://www.robot-electronics.co.uk/products/relay-modules/ethernet-relay/eth008-8-x-16a-ethernet-relay.html)
> .
> * But these are not available in India.*
>
> Regards,
> Koti
>
>
> 
>
>
