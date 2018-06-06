MIME-Version: 1.0
In-Reply-To: <7290e3de-b7a6-1ed1-98f0-798d4ac28bc4@collabora.com>
References: <7hy3fumguh.fsf@baylibre.com> <7290e3de-b7a6-1ed1-98f0-798d4ac28bc4@collabora.com>
From: matthew.hart@linaro.org
Date: Wed, 6 Jun 2018 09:14:12 +0100
Message-ID: <CAH+k93HeZ0U8yBfrPj7ASys0JKw8uybR_o4K+tX+hZ7dadDaQw@mail.gmail.com>
Subject: Re: [kernelci] debian rootfs for ramdisk and NFS
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: kernelci@groups.io

On 6 June 2018 at 09:11, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
> On 06/04/2018 10:33 PM, Kevin Hilman wrote:
>>
>> Hi Ana,
>>
>> In testing the debian rootfs images for NFS, Matt Hart and I both
>> noticed that the full.rootfs.tar.xz images don't work for NFS because
>> the systemd network init causes a (re)init of networking while actively
>> using an NFSroot.  This causes things to grind to a halt.
>>
>> So the first question is whether anyone knows if systemd can be made
>> pursuaded to not try to reconfigure networking.
>>
>> Ideally, we'd like a single rootfs image to be either a ramdisk, where
>> it might need to (re)configure networking and an NFSroot where it
>> definitely should not reconfigure networking.
>>
>> It would be a shame to have to have different images for ramdisk vs. NFS
>> just for network init.
>>
>> Ideas?
>
>
> Just as a data point, the debos scripts should be very close to what I was
> using when I tried NFS for running test suites. So I think it should be
> doable, but I don't know why it's happening.

Looks like this overlay is forcing a DHCP on all interfaces that begin with 'e'
https://github.com/kernelci/kernelci-build/blob/master/jenkins/debian/debos/overlays/networkd/etc/systemd/network/wired.network


>
> Regards,
>
> Tomeu
