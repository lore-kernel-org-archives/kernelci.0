MIME-Version: 1.0
References: <163425193558.1688384.15520943968787313145@swboyd.mtv.corp.google.com>
 <20211015120559.3515645-1-martin.blumenstingl@googlemail.com> <04a58d50-634b-fa20-95b4-eb6831f77e85@collabora.com>
In-Reply-To: <04a58d50-634b-fa20-95b4-eb6831f77e85@collabora.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 1 Nov 2021 21:58:38 +0100
Message-ID: <CAFBinCAEt9_EfLYWZEzTBK6iN97+Wacho7pNd2LYDPX3+goMzg@mail.gmail.com>
Subject: Re: [PATCH] clk: composite: Also consider .determine_rate for rate + mux composites
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: sboyd@kernel.org, heiko@sntech.de, knaerzche@gmail.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "kernelci@groups.io" <kernelci@groups.io>, Collabora Kernel ML <kernel@collabora.com>, Chen-Yu Tsai <wens@csie.org>

Hi Guillaume,

On Mon, Nov 1, 2021 at 9:19 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Hi Martin,
>
> Please see the bisection report below about a boot failure on
> rk3328-rock64.
>
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org but this one
> looks valid.
>
> Some more details can be found here:
>
>   https://linux.kernelci.org/test/case/id/617f11f5c157b666fb3358e6/
>
> Here's what appears to be the cause of the problem:
>
> [    0.033465] CPU: CPUs started in inconsistent modes
> [    0.033557] Unexpected kernel BRK exception at EL1
> [    0.034432] Internal error: BRK handler: f2000800 [#1] PREEMPT SMP
>
> There doesn't appear to be any other platform in KernelCI showing
> the same issue.
That's a strange error for the changes from my patch.
At first glance I don't see any relation to clk-composite code:
- the call trace doesn't have any references to CCF or rockchip clock drivers
- clk-rk3328.c uses drivers/clk/rockchip/clk-cpu.c to register the CPU
clock which does not use clk-composite

Chen-Yu has tested this patch (plus [0]) on RK3399 and didn't observe
any problems.
So maybe this is a RK3328 specific issue?
Anyways, I am interested in fixing this issue because reverting is
becoming more and more complex (since I think we're at eight commits
which would need to be reverted in total).

> Please let us know if you need help debugging the issue or if you
> have a fix to try.
Could you please try [0] which is the second patch in the series which
finally made it upstream.
This second patch is not in 5.15 because I believed that it's only
something to make the code in clk-composite.c more future-proof. It's
not a condition that I am aware of.

I don't have any Rockchip boards myself.
So I am thankful for any help I can get.


Best regards,
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=6594988fd625ff0d9a8f90f1788e16185358a3e6
