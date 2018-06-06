Subject: Re: [kernelci] debian rootfs for ramdisk and NFS
References: <7hy3fumguh.fsf@baylibre.com>
From: "Tomeu Vizoso" <tomeu.vizoso@collabora.com>
Message-ID: <7290e3de-b7a6-1ed1-98f0-798d4ac28bc4@collabora.com>
Date: Wed, 6 Jun 2018 10:11:54 +0200
MIME-Version: 1.0
In-Reply-To: <7hy3fumguh.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: matthew.hart@linaro.org

On 06/04/2018 10:33 PM, Kevin Hilman wrote:
> Hi Ana,
> 
> In testing the debian rootfs images for NFS, Matt Hart and I both
> noticed that the full.rootfs.tar.xz images don't work for NFS because
> the systemd network init causes a (re)init of networking while actively
> using an NFSroot.  This causes things to grind to a halt.
> 
> So the first question is whether anyone knows if systemd can be made
> pursuaded to not try to reconfigure networking.
> 
> Ideally, we'd like a single rootfs image to be either a ramdisk, where
> it might need to (re)configure networking and an NFSroot where it
> definitely should not reconfigure networking.
> 
> It would be a shame to have to have different images for ramdisk vs. NFS
> just for network init.
> 
> Ideas?

Just as a data point, the debos scripts should be very close to what I 
was using when I tried NFS for running test suites. So I think it should 
be doable, but I don't know why it's happening.

Regards,

Tomeu
