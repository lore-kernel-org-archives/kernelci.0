Subject: Re: [kernelci] proposal to build Debian images for every test suite (pull #24/kernelci-build-staging)
References: <99070f63-f2df-ae30-7885-a6e4ceb8c21a@collabora.com>
 <7h4ljjhxle.fsf@baylibre.com>
 <7087cdfb-5577-eec1-7d3d-9408db4d240f@collabora.com>
 <7h603wxqvn.fsf@baylibre.com>
 <4d04dcdb-dd9b-3c59-5391-378e4e4f28b9@collabora.com>
 <7hlgcr34ce.fsf@baylibre.com>
 <91a30108-36a6-e39d-2ac9-396b1115099d@collabora.com>
 <ff773c4b-a070-d2bc-e61b-5871b6ce89e0@collabora.com>
From: "Tomeu Vizoso" <tomeu.vizoso@collabora.com>
Message-ID: <8a84c393-915a-985c-3ad0-1733252c761e@collabora.com>
Date: Wed, 23 May 2018 10:21:19 +0200
MIME-Version: 1.0
In-Reply-To: <ff773c4b-a070-d2bc-e61b-5871b6ce89e0@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

On 05/16/2018 06:46 PM, Ana Guerrero Lopez wrote:
>=20
>=20
>=20
> On 11/05/18 07:23, Tomeu Vizoso wrote:
>  > On 05/10/2018 05:41 PM, Kevin Hilman wrote:
>  >> Tomeu Vizoso <tomeu.vizoso@collabora.com> writes:
>  >>
>  >>> On 05/10/2018 03:04 AM, Kevin Hilman wrote:
>  >>>> "Tomeu Vizoso" <tomeu.vizoso@collabora.com> writes:
>  >>>>
>  >>>>> Hi,
>  >>>>>
>  >>>>> below I give my opinion on a few comments, but it's Ana who is=20
> leading
>  >>>>> now this work.
>  >>>>>
>  >>>>> On 05/08/2018 01:09 AM, Kevin Hilman wrote:
>  >>>>>> "Ana Guerrero Lopez" <ana.guerrero@collabora.com> writes:
>  >>>>>
>  >>>>>> IMO, what I think would be very helpful at least for initial=20
> review and
>  >>>>>> discussion, is to see an initial PR that only has the "basic"=20
> build, and
>  >>>>>> ideally also generates a minimal, tiny ramdisk from the same bui=
ld
>  >>>>>> (e.g. with 'update-initramfs -c -k min' )
>  >>>>>>
>  >>>>>>> The pull requests includes three things: three jenkinsfiles,=20
> debos files
>  >>>>>>> and two Dockerfiles.
>  >>>>>>>
>  >>>>>>> The jenkinsfiles are the smallest possible since all the code=
=20
> creating
>  >>>>>>> the pipeline is in the shared library. There are two parts: one=
=
=20
> with the
>  >>>>>>> job name - that will be used by the resulting images, the
>  >>>>>>> destination
>  >>>>> arches
>  >>>>>>> and the run-time dependencies that need to be added to the imag=
e.
>  >>>>>>> There is also the debos file name but this should be removed if=
=
=20
> we always
>  >>>>>>> use the same debos configuration.
>  >>>>>>> The second part "build_test_suite" is for building the test=20
> suite code.
>  >>>>>>> This is on purpose a shell script that must create a cpio.gz=20
> tarball
>  >>>>>>> with the name rootfs-built-${NAME}-${ARCH}.cpio.gz
>  >>>>>>> The idea is to be able to add and modify quickly test suites=20
> without
>  >>>>>>> knowing too much about jenkins.
>  >>>>>>
>  >>>>>> I'm not sure about the "build_test_suite" approach.
>  >>>>>>
>  >>>>>> AFAICT, both the _igt and _v4l2 jobs are basically doing the sam=
e=20
> thing
>  >>>>>> as "basic", and then essentially installing a bunch more files o=
n=20
> top.
>  >>>>>
>  >>>>> The difference is only in the dependencies. Both test suites are =
in
>  >>>>> the fat side and have several dependencies that otherwise aren't
>  >>>>> needed. That said, a basic image that contains all of them might=
=20
> still
>  >>>>> not be too big.
>  >>>>
>  >>>> IMO, it's better to go for a single, shared base image with
>  >>>> dependencies.=C2=A0 Building a new rootfs for every test suite sou=
nds=20
> like a
>  >>>> scalability problem to me.
>  >>>
>  >>> Well, only the fatter test suites would need their own rootfs. So f=
ar
>  >>> only IGT and V4L2 have a fair amount of dependencies. But still we
>  >>> could probably build a single image for both that isn't too big to =
be
>  >>> used as a ramdisk.
>  >>
>  >> OK, I think we should start with that.
>  >
>  > What do you think about that, Ana?
>=20
> I'm fine having a single image with these two test suites, if eventually
> this not convenient we can always change it. However, now we have more
> or less agreed on a job creating the "basic" images, how do you envisage
> we should be creating the images with the test suites?
>=20
> My proposal is installing the build and run dependencies via extra_packa=
ges
> in the Jenkinsfile and then building the test suite directly against the
> new created image with script run by debos directly. This will avoid
> the merge step, although the strip/crush might need a bit of work
> for making sure the resulting ramdisk is still small.
> The advantage is adding/modifying the test suites doesn't require a lot
> of knowledge of jenkins or even debos.

Sounds good to me, assuming that making sure that build dependencies=20
aren't in the final image isn't cumbersome to those adding more images.

Thanks,

Tomeu

> [...]
>  >> But I agree, for scalability, secondary storage is a major PITA.
>  >> However, maybe for a subset of devices that we want to test that way=
, we
>  >> should make it easy.
>  >>
>  >> So, what about this: From a single base debian image, we create
>  >>
>  >> 1) minimal (~2M) initramfs
>  >>
>  >> This should have pivot capabilities, and this is what Ana is doing t=
oday
>  >> with 'update-initramfs -c -k min'
>  >>
>  >> 2) small "basic" ramdisk
>  >>
>  >> This is the base image *after* the strip/crush steps.=C2=A0 Basicall=
y, the
>  >> "basic" that Ana is building today.
>  >>
>  >> 3) full rootfs for secondary storage (e.g. MMC, NFS, NBD)
>  >>
>  >> The base image without all the strip/crush removed, so it still has =
the
>  >> ability to install packages etc.
>  >>
>  >> This should be available in a few formats: .cpio.gz, .tar.xz, .ext4.=
xz
>  >>
>  >> This would also be the pivot destination when using an initramfs.
>  >
>  > Sounds good!
>=20
> Yup. I added the images listed in 3). So right now we have for every arc=
h:
> 1) minimal initramfs: initrd.cpio.gz
> 2) small basic ramdisk:=C2=A0 rootfs.cpio.gz
> 3) full rootfs in several formats:=C2=A0 full.rootfs.cpio.gz ,
> full.rootfs.tar.xz=C2=A0 and=C2=A0 rootfs.ext4.xz
>=20
> Cheers,
> Ana
>=20
>=20
>=20
>=20
>=20
>=20
