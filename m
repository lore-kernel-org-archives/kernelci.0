Subject: Re: mainline/master boot: 179 boots: 6 failed, 171 passed with 2 offline (v4.19-rc1-124-g58c3f14f86c9)
References: <5b87bef3.1c69fb81.8410c.cbd7@mx.google.com>
 <CAH+k93Fvrvau-O6zfNF4ckpATHGxT+MwSqn9ftcZOOPAQerjAA@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <ffe7a1fe-5eb2-416a-f0fc-de100c1f62e0@collabora.com>
Date: Mon, 3 Sep 2018 08:52:32 +0100
MIME-Version: 1.0
In-Reply-To: <CAH+k93Fvrvau-O6zfNF4ckpATHGxT+MwSqn9ftcZOOPAQerjAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Matt Hart <matthew.hart@linaro.org>, Matt Hart <matthew.hart@linaro.org>
Cc: kernelci@groups.io

On 30/08/18 15:11, Matt Hart wrote:
> Hey Guillaume,
>=20
> Lots of Collabora lab failures with
>=20
> ConfigurationError: The LAVA instance is not configured correctly. Plea=
se
> report this error to LAVA admins.
>=20
> https://storage.kernelci.org/mainline/master/v4.19-rc1-124-g58c3f14f86c=
9/arm64/defconfig/lab-collabora/boot-r8a7796-m3ulcb.html

(bringing this topic to the mailing list)

The issue here was that some LAVA dispatchers got upgraded to
2018.7 automatically (by mistake) while the master was still
running 2018.5.  There have been some major changes in the device
types in between these two releases, causing the configuration
errors as reported by LAVA.

Thanks Matt for reporting this and pointing out that the job
status should have been "UNKNOWN" rather than "FAIL".

> Seems like we should make ConfigurationError an unknown result in the
> backend, wouldnt have shown these up?

I see what you mean, we're currently only filtering out jobs with
the error_type set to "Infrastructure".  I guess we could
add "Configuration" there, or make the ConfigurationError result
in "Infrastructure" error_type in the callback data.

Is there a list of all the possible values for error_type
somewhere in the LAVA doc?

Guillaume

> On 30 August 2018 at 10:54, kernelci.org bot <bot@kernelci.org> wrote:
>=20
>> *mainline/master boot: 179 boots: 6 failed, 171 passed with 2 offline
>> (v4.19-rc1-124-g58c3f14f86c9)*
>> Full Boot Summary: https://kernelci.org/boot/all/
>> job/mainline/branch/master/kernel/v4.19-rc1-124-g58c3f14f86c9/
>> Full Build Summary: https://kernelci.org/build/
>> mainline/branch/master/kernel/v4.19-rc1-124-g58c3f14f86c9/
>> Tree: mainline
>> Branch: master
>> Git Describe: v4.19-rc1-124-g58c3f14f86c9
>> Git Commit: 58c3f14f86c98e4030b03e6ab929fa3190565d4f
>> Git URL: http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git
>> <https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D58c3f14f86c98e4030b03e6ab929fa3190565d4f>
>> Tested: 65 unique boards, 24 SoC families, 21 builds out of 199
>> *Boot Regressions Detected:*
>> arm:
>> multi_v7_defconfig:
>> imx6q-sabrelite:
>> lab-collabora <https://kernelci.org/boot/id/5b878d4f59b514bef896ba8d/>=
: new
>> failure
>> <https://kernelci.org/boot/all/job/mainline/branch/master/kernel/v4.19=
-rc1-124-g58c3f14f86c9/#regressions> (last
>> pass: v4.19-rc1-120-gff69279a44e9
>> <https://kernelci.org/boot/id/5b87642d59b514862696ba8d/>)
>> multi_v7_defconfig+CONFIG_SMP=3Dn:
>> bcm2836-rpi-2-b:
>> lab-collabora <https://kernelci.org/boot/id/5b878d4c59b514bb8c96ba8f/>=
: new
>> failure
>> <https://kernelci.org/boot/all/job/mainline/branch/master/kernel/v4.19=
-rc1-124-g58c3f14f86c9/#regressions> (last
>> pass: v4.19-rc1-120-gff69279a44e9
>> <https://kernelci.org/boot/id/5b8765cb59b514868296bab9/>)
>> rk3288-rock2-square:
>> lab-collabora <https://kernelci.org/boot/id/5b878d5259b514bf0896ba8d/>=
: new
>> failure
>> <https://kernelci.org/boot/all/job/mainline/branch/master/kernel/v4.19=
-rc1-124-g58c3f14f86c9/#regressions> (last
>> pass: v4.19-rc1-120-gff69279a44e9
>> <https://kernelci.org/boot/id/5b87642059b51484f896baa2/>)
>> rk3288-veyron-jaq:
>> lab-collabora <https://kernelci.org/boot/id/5b878d5359b514bb7596ba97/>=
: new
>> failure
>> <https://kernelci.org/boot/all/job/mainline/branch/master/kernel/v4.19=
-rc1-124-g58c3f14f86c9/#regressions> (last
>> pass: v4.19-rc1-120-gff69279a44e9
>> <https://kernelci.org/boot/id/5b8765e559b51484f896bac6/>)
>> tegra124-nyan-big:
>> lab-collabora <https://kernelci.org/boot/id/5b878d5459b514bf1a96ba8d/>=
: new
>> failure
>> <https://kernelci.org/boot/all/job/mainline/branch/master/kernel/v4.19=
-rc1-124-g58c3f14f86c9/#regressions> (last
>> pass: v4.19-rc1-120-gff69279a44e9
>> <https://kernelci.org/boot/id/5b87697759b514975196ba9b/>)
>> arm64:
>> defconfig:
>> r8a7796-m3ulcb:
>> lab-collabora <https://kernelci.org/boot/id/5b878d5559b514bf2096ba8d/>=
: new
>> failure
>> <https://kernelci.org/boot/all/job/mainline/branch/master/kernel/v4.19=
-rc1-124-g58c3f14f86c9/#regressions> (last
>> pass: v4.19-rc1-120-gff69279a44e9
>> <https://kernelci.org/boot/id/5b87644459b514868396ba8e/>)
>> *Boot Failures Detected:*
>> arm:
>> multi_v7_defconfig+CONFIG_SMP=3Dn:
>> bcm2836-rpi-2-b
>> <https://kernelci.org/boot/bcm2836-rpi-2-b/job/mainline/branch/master/=
kernel/v4.19-rc1-124-g58c3f14f86c9/defconfig/multi_v7_defconfig+CONFIG_SM=
P=3Dn/>:
>> 1 failed lab
>> rk3288-rock2-square
>> <https://kernelci.org/boot/rk3288-rock2-square/job/mainline/branch/mas=
ter/kernel/v4.19-rc1-124-g58c3f14f86c9/defconfig/multi_v7_defconfig+CONFI=
G_SMP=3Dn/>:
>> 1 failed lab
>> rk3288-veyron-jaq
>> <https://kernelci.org/boot/rk3288-veyron-jaq/job/mainline/branch/maste=
r/kernel/v4.19-rc1-124-g58c3f14f86c9/defconfig/multi_v7_defconfig+CONFIG_=
SMP=3Dn/>:
>> 1 failed lab
>> tegra124-nyan-big
>> <https://kernelci.org/boot/tegra124-nyan-big/job/mainline/branch/maste=
r/kernel/v4.19-rc1-124-g58c3f14f86c9/defconfig/multi_v7_defconfig+CONFIG_=
SMP=3Dn/>:
>> 1 failed lab
>> multi_v7_defconfig:
>> imx6q-sabrelite
>> <https://kernelci.org/boot/imx6q-sabrelite/job/mainline/branch/master/=
kernel/v4.19-rc1-124-g58c3f14f86c9/defconfig/multi_v7_defconfig/>:
>> 1 failed lab
>> arm64:
>> defconfig:
>> r8a7796-m3ulcb
>> <https://kernelci.org/boot/r8a7796-m3ulcb/job/mainline/branch/master/k=
ernel/v4.19-rc1-124-g58c3f14f86c9/defconfig/defconfig/>:
>> 1 failed lab
>> *Offline Platforms:*
>> arm64:
>> defconfig:
>> bcm2837-rpi-3-b
>> <https://kernelci.org/boot/bcm2837-rpi-3-b/job/mainline/branch/master/=
kernel/v4.19-rc1-124-g58c3f14f86c9/defconfig/defconfig/>:
>> 1 offline lab
>> defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
>> bcm2837-rpi-3-b
>> <https://kernelci.org/boot/bcm2837-rpi-3-b/job/mainline/branch/master/=
kernel/v4.19-rc1-124-g58c3f14f86c9/defconfig/defconfig+CONFIG_RANDOMIZE_B=
ASE=3Dy/>:
>> 1 offline lab
>>
>> =E2=94=80
>> For more info write to <info@kernelci.org>
>>
>> _______________________________________________
>> Kernel-build-reports mailing list
>> Kernel-build-reports@lists.linaro.org
>> https://lists.linaro.org/mailman/listinfo/kernel-build-reports
>>
>>
>=20

