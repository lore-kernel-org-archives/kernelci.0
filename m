Subject: Re: [kernelci] debian rootfs for ramdisk and NFS
References: <7hy3fumguh.fsf@baylibre.com>
 <7290e3de-b7a6-1ed1-98f0-798d4ac28bc4@collabora.com>
 <CAH+k93HeZ0U8yBfrPj7ASys0JKw8uybR_o4K+tX+hZ7dadDaQw@mail.gmail.com>
From: "Ana Guerrero Lopez" <ana.guerrero@collabora.com>
Message-ID: <ca0c9c24-4413-bd2b-c047-e8a069566abc@collabora.com>
Date: Wed, 6 Jun 2018 21:18:30 +0200
MIME-Version: 1.0
In-Reply-To: <CAH+k93HeZ0U8yBfrPj7ASys0JKw8uybR_o4K+tX+hZ7dadDaQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-ID: <kernelci.groups.io>
To: kernelci@groups.io



On 06/06/18 10:14, Matt Hart wrote:
> On 6 June 2018 at 09:11, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>> On 06/04/2018 10:33 PM, Kevin Hilman wrote:
>>> Hi Ana,
>>>
>>> In testing the debian rootfs images for NFS, Matt Hart and I both
>>> noticed that the full.rootfs.tar.xz images don't work for NFS because
>>> the systemd network init causes a (re)init of networking while actively
>>> using an NFSroot.  This causes things to grind to a halt.
>>>
>>> So the first question is whether anyone knows if systemd can be made
>>> pursuaded to not try to reconfigure networking.
>>>
>>> Ideally, we'd like a single rootfs image to be either a ramdisk, where
>>> it might need to (re)configure networking and an NFSroot where it
>>> definitely should not reconfigure networking.
>>>
>>> It would be a shame to have to have different images for ramdisk vs. NFS
>>> just for network init.
>>>
>>> Ideas?
>>
>> Just as a data point, the debos scripts should be very close to what I was
>> using when I tried NFS for running test suites. So I think it should be
>> doable, but I don't know why it's happening.
> Looks like this overlay is forcing a DHCP on all interfaces that begin with 'e'
> https://github.com/kernelci/kernelci-build/blob/master/jenkins/debian/debos/overlays/networkd/etc/systemd/network/wired.network
>

I just committed: https://github.com/kernelci/kernelci-build-staging/pull/34
I'm building the Debian rootfs builder job with this right now in 
staging, could you
please test with the resulting images and tell if it works?

Ana
