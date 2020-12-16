Subject: Re: mainline/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
References: <5fd9e160.1c69fb81.82005.494c@mx.google.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <b384af7b-a4e6-d7a7-3687-ceedc5b42fdf@collabora.com>
Date: Wed, 16 Dec 2020 10:44:45 +0000
MIME-Version: 1.0
In-Reply-To: <5fd9e160.1c69fb81.82005.494c@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci-results@groups.io, "kernelci@groups.io" <kernelci@groups.io>

This one has already been fixed, there are a couple of patches
from Marc pending to be merged which can be found on linux-next:

2b6cb81b95d1 drm/meson: dw-hdmi: Enable the iahb clock early enough
1dfeea904550 drm/meson: dw-hdmi: Disable clocks on driver teardown

So the regression should go away as soon as the drm-misc-next
branch gets pulled into mainline.

The original issue was reported by a bisection, and it then got
resolved.  If we were tracking the resolution we could detect
that this is already fixed and just mention where the fixes are.
Something to add to the list of bisection improvements.

Guillaume

On 16/12/2020 10:28, KernelCI bot wrote:
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> 
> mainline/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
> 
> Summary:
>   Start:      3db1a3fa9880 Merge tag 'staging-5.11-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
>   Plain log:  https://storage.kernelci.org/mainline/master/v5.10-6984-g3db1a3fa98808/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.txt
>   HTML log:   https://storage.kernelci.org/mainline/master/v5.10-6984-g3db1a3fa98808/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.html
>   Result:     b33340e33acd drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the TOP registers
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       mainline
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>   Branch:     master
>   Target:     meson-gxbb-p200
>   CPU arch:   arm64
>   Lab:        lab-baylibre
>   Compiler:   gcc-8
>   Config:     defconfig+CONFIG_CPU_BIG_ENDIAN=y
>   Test case:  baseline.dmesg.emerg
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit b33340e33acdfe5ca6a5aa1244709575ae1e0432
> Author: Marc Zyngier <maz@kernel.org>
> Date:   Mon Nov 16 20:07:44 2020 +0000
> 
>     drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the TOP registers
>     
>     Removing the meson-dw-hdmi module and re-inserting it results in a hang
>     as the driver writes to HDMITX_TOP_SW_RESET. Similar effects can be seen
>     when booting with mainline u-boot and using the u-boot provided DT (which
>     is highly desirable).
>     
>     The reason for the hang seem to be that the clocks are not always
>     enabled by the time we enter meson_dw_hdmi_init(). Moving this call
>     *after* dw_hdmi_probe() ensures that the clocks are enabled.
>     
>     Fixes: 1374b8375c2e ("drm/meson: dw_hdmi: add resume/suspend hooks")
>     Signed-off-by: Marc Zyngier <maz@kernel.org>
>     Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>     Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20201116200744.495826-5-maz@kernel.org
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 68826cf9993f..7f8eea494147 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -1073,8 +1073,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  
>  	DRM_DEBUG_DRIVER("encoder initialized\n");
>  
> -	meson_dw_hdmi_init(meson_dw_hdmi);
> -
>  	/* Bridge / Connector */
>  
>  	dw_plat_data->priv_data = meson_dw_hdmi;
> @@ -1097,6 +1095,8 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	if (IS_ERR(meson_dw_hdmi->hdmi))
>  		return PTR_ERR(meson_dw_hdmi->hdmi);
>  
> +	meson_dw_hdmi_init(meson_dw_hdmi);
> +
>  	next_bridge = of_drm_find_bridge(pdev->dev.of_node);
>  	if (next_bridge)
>  		drm_bridge_attach(encoder, next_bridge,
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [2c85ebc57b3e1817b6ce1a6b703928e113a90442] Linux 5.10
> git bisect good 2c85ebc57b3e1817b6ce1a6b703928e113a90442
> # bad: [3db1a3fa98808aa90f95ec3e0fa2fc7abf28f5c9] Merge tag 'staging-5.11-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
> git bisect bad 3db1a3fa98808aa90f95ec3e0fa2fc7abf28f5c9
> # bad: [ac73e3dc8acd0a3be292755db30388c3580f5674] Merge branch 'akpm' (patches from Andrew)
> git bisect bad ac73e3dc8acd0a3be292755db30388c3580f5674
> # bad: [b10733527bfd864605c33ab2e9a886eec317ec39] Merge tag 'amd-drm-next-5.11-2020-12-09' of git://people.freedesktop.org/~agd5f/linux into drm-next
> git bisect bad b10733527bfd864605c33ab2e9a886eec317ec39
> # good: [9713158cb2a918c3f6f5522eed23cdeb61f22e75] drm/amdgpu: Add and use seperate reg headers for dcn302
> git bisect good 9713158cb2a918c3f6f5522eed23cdeb61f22e75
> # good: [300186795254f848900de2f1485b8b31dda3dbc0] drm/amdgpu: fix size calculation with stolen vga memory
> git bisect good 300186795254f848900de2f1485b8b31dda3dbc0
> # bad: [22f8c80566c4a29a0d8b5ebf24aa1fd1679b39e5] Merge tag 'drm-misc-next-2020-11-18' of ssh://git.freedesktop.org/git/drm/drm-misc into drm-next
> git bisect bad 22f8c80566c4a29a0d8b5ebf24aa1fd1679b39e5
> # good: [a1ac250a82a5e97db71f14101ff7468291a6aaef] fbcon: Avoid using FNTCHARCNT() and hard-coded built-in font charcount
> git bisect good a1ac250a82a5e97db71f14101ff7468291a6aaef
> # good: [0049b688459b846f819b6e51c24cd0781fcfde41] drm/i915/gem: Allow backends to override pread implementation
> git bisect good 0049b688459b846f819b6e51c24cd0781fcfde41
> # bad: [52769ba1301ffe1accc4ab6cc23e66091dbc54c6] drm/pl111/pl111_debugfs: Make local function 'pl111_debugfs_regs()' static
> git bisect bad 52769ba1301ffe1accc4ab6cc23e66091dbc54c6
> # bad: [7467389bdafb77357090512d42a452bea31d53b5] drm/panel: Add ABT Y030XX067A 3.0" 320x480 panel
> git bisect bad 7467389bdafb77357090512d42a452bea31d53b5
> # good: [723ae803218da993143387bf966042eccefac077] drm/omap: dmm_tiler: fix return error code in omap_dmm_probe()
> git bisect good 723ae803218da993143387bf966042eccefac077
> # bad: [b33340e33acdfe5ca6a5aa1244709575ae1e0432] drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the TOP registers
> git bisect bad b33340e33acdfe5ca6a5aa1244709575ae1e0432
> # good: [e78ad18ba3658fbc8c63629e034b68d8e51acbf1] drm/meson: Unbind all connectors on module removal
> git bisect good e78ad18ba3658fbc8c63629e034b68d8e51acbf1
> # good: [0405f94a1ae0586ca237aec0e859f1b796d6325d] drm/meson: dw-hdmi: Register a callback to disable the regulator
> git bisect good 0405f94a1ae0586ca237aec0e859f1b796d6325d
> # first bad commit: [b33340e33acdfe5ca6a5aa1244709575ae1e0432] drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the TOP registers
> -------------------------------------------------------------------------------
> 
> 
> 
> 
> 

