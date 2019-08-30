Subject: Re: net-next/master boot bisection: v5.3-rc6-1308-g3f1071ec39f7 on meson-gxm-khadas-vim2
References: <5d68f8be.1c69fb81.f86b5.9a77@mx.google.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <469aa850-4dda-7320-4d15-971b900c1ae7@collabora.com>
Date: Fri, 30 Aug 2019 12:32:12 +0100
MIME-Version: 1.0
In-Reply-To: <5d68f8be.1c69fb81.f86b5.9a77@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Corentin Labbe <clabbe@baylibre.com>, tomeu.vizoso@collabora.com, mgalka@collabora.com, broonie@kernel.org, matthew.hart@linaro.org, khilman@baylibre.com, enric.balletbo@collabora.com
Cc: kernelci@groups.io

On 30/08/2019 11:21, kernelci.org bot wrote:
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
> net-next/master boot bisection: v5.3-rc6-1308-g3f1071ec39f7 on meson-gxm-khadas-vim2
> 
> Summary:
>   Start:      3f1071ec39f7 net: spider_net: Use struct_size() helper
>   Details:    https://kernelci.org/boot/id/5d68aba759b514bb3af1223c
>   Plain log:  https://storage.kernelci.org//net-next/master/v5.3-rc6-1308-g3f1071ec39f7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-8/lab-baylibre/boot-meson-gxm-khadas-vim2.txt
>   HTML log:   https://storage.kernelci.org//net-next/master/v5.3-rc6-1308-g3f1071ec39f7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-8/lab-baylibre/boot-meson-gxm-khadas-vim2.html

The HTML log shows that the login prompt never appeared with this
failed boot test.  The # characters seen in the log were sent by
the test system to check if the terminal was responding, but it
looks like it was frozen with no apparent errors.  See the end of
the log:

04:48:43.791420  <6>[   15.162283] Bluetooth: HCI socket layer initialized
04:48:43.792869  <6>[   15.162288] Bluetooth: L2CAP socket layer initialized
04:50:39.878549  ShellCommand command timed out.: Sending # in case of corruption. Connection timeout 00:04:20, retry in 00:02:10
04:50:39.983053  #
04:51:05.982997  ShellCommand command timed out.: Sending # in case of corruption. Connection timeout 00:04:20, retry in 00:00:26
04:51:06.088343  #
04:51:32.099056  ShellCommand command timed out.: Sending # in case of corruption. Connection timeout 00:04:20, retry in 00:00:26
04:51:32.203916  #
04:51:58.214414  ShellCommand command timed out.: Sending # in case of corruption. Connection timeout 00:04:20, retry in 00:00:26
04:51:58.319344  #
04:52:24.329858  ShellCommand command timed out.: Sending # in case of corruption. Connection timeout 00:04:20, retry in 00:00:26
04:52:24.434910  #
04:52:49.395084  uboot-retry failed: 1 of 1 attempts. 'auto-login-action timed out after 261 seconds'
04:52:49.402591  uboot-action failed: 1 of 1 attempts. 'auto-login-action timed out after 261 seconds'
04:52:54.767285  JobError: Your job cannot terminate cleanly.

>   Result:     1eba383f4e36 net/mlx5: Add lag_tx_port_affinity capability bit
> 
> Checks:
>   revert:     FAIL
>   verify:     PASS

The "revert: FAIL" check means that reverting this patch to check
that the issue would go away didn't work.  So the bisection
result is a bit less reliable than if it did.

The "verify: PASS" check however means that the revision found
below was boot tested 3 times in a row and showed consistent
failures.

Since all the checks didn't pass, the email report was only sent
to the KernelCI fixed list and not to the dynamic recipients as
per this line of code in push-bisection-results.py:

    if all(check == 'PASS' for check in checks_dict(args).values()):
        add_git_recipients(kdir, 'refs/bisect/bad', to, cc)

It's rather likely that there's some random intermittent issue
with this board, or with the infrastructure if it happens with
other kernels too (I don't know about that).

Hope this helps interpreting the report.

Thanks,
Guillaume

> Parameters:
>   Tree:       net-next
>   URL:        git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
>   Branch:     master
>   Target:     meson-gxm-khadas-vim2
>   CPU arch:   arm64
>   Lab:        lab-baylibre
>   Compiler:   gcc-8
>   Config:     defconfig+CONFIG_CPU_BIG_ENDIAN=y
>   Test suite: boot
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit 1eba383f4e36637ba859cb82b40e198c415db802
> Author: Maxim Mikityanskiy <maximmi@mellanox.com>
> Date:   Thu Aug 15 19:46:16 2019 +0000
> 
>     net/mlx5: Add lag_tx_port_affinity capability bit
>     
>     Add the lag_tx_port_affinity HCA capability bit that indicates that
>     setting port affinity of TISes is supported.
>     
>     Signed-off-by: Maxim Mikityanskiy <maximmi@mellanox.com>
>     Reviewed-by: Tariq Toukan <tariqt@mellanox.com>
>     Signed-off-by: Saeed Mahameed <saeedm@mellanox.com>
> 
> diff --git a/include/linux/mlx5/mlx5_ifc.h b/include/linux/mlx5/mlx5_ifc.h
> index 2837fe4d8901..1e55cf73e88c 100644
> --- a/include/linux/mlx5/mlx5_ifc.h
> +++ b/include/linux/mlx5/mlx5_ifc.h
> @@ -1249,7 +1249,9 @@ struct mlx5_ifc_cmd_hca_cap_bits {
>  	u8         reserved_at_263[0x8];
>  	u8         log_bf_reg_size[0x5];
>  
> -	u8         reserved_at_270[0xb];
> +	u8         reserved_at_270[0x8];
> +	u8         lag_tx_port_affinity[0x1];
> +	u8         reserved_at_279[0x2];
>  	u8         lag_master[0x1];
>  	u8         num_lag_ports[0x4];
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [42aa15cf05c0a47cc5807c21c7ff471b80cad371] net: dsa: mv88e6xxx: fix freeing unused SERDES IRQ
> git bisect good 42aa15cf05c0a47cc5807c21c7ff471b80cad371
> # bad: [3f1071ec39f79ad1e288d2f8e5cbe5697ced695b] net: spider_net: Use struct_size() helper
> git bisect bad 3f1071ec39f79ad1e288d2f8e5cbe5697ced695b
> # bad: [3c14562663c603bc523b6619a2b19a411e1cdc8e] net/mlx5e: Expose new function for TIS destroy loop
> git bisect bad 3c14562663c603bc523b6619a2b19a411e1cdc8e
> # good: [30b10e89f2ae2c7b7b32548e04f57ab7eb030dfb] net/mlx5: Add support for VNIC_ENV internal rq counter
> git bisect good 30b10e89f2ae2c7b7b32548e04f57ab7eb030dfb
> # bad: [e6806e9a63a759e445383915bb9d2ec85a90aebf] net/mlx5: Create bypass and loopback flow steering namespaces for RDMA RX
> git bisect bad e6806e9a63a759e445383915bb9d2ec85a90aebf
> # bad: [1eba383f4e36637ba859cb82b40e198c415db802] net/mlx5: Add lag_tx_port_affinity capability bit
> git bisect bad 1eba383f4e36637ba859cb82b40e198c415db802
> # good: [caa1854735449d7afac6781679621fb9142fe810] net/mlx5: Expose IP-in-IP capability bit
> git bisect good caa1854735449d7afac6781679621fb9142fe810
> # first bad commit: [1eba383f4e36637ba859cb82b40e198c415db802] net/mlx5: Add lag_tx_port_affinity capability bit
> -------------------------------------------------------------------------------
