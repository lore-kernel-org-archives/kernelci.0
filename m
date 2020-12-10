Subject: Re: help: how to contribute to the community
References: <a34a999c78584e0e9953360bbd5797f8@G08CNEXMBPEKD05.g08.fujitsu.local>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <ec96708e-12d5-ff21-1f21-dfd2262927dc@collabora.com>
Date: Thu, 10 Dec 2020 10:12:41 +0000
MIME-Version: 1.0
In-Reply-To: <a34a999c78584e0e9953360bbd5797f8@G08CNEXMBPEKD05.g08.fujitsu.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, wangmy@cn.fujitsu.com

On 08/12/2020 07:43, Wang Mingyu wrote:
> Hi, all
>=20
> I am currently using this tool.=20
> Although I am still new, I still want to contribute to the community.=20
> Is there anything I can do=EF=BC=9F
> For example, bug fix, or simple new plan to kernelci.

Thank you for your interest, there are plenty of things that
first-time contributors can do in KernelCI.  One would be to
enable i386 builds with Clang, as per this GitHub issue:

  https://github.com/kernelci/kernelci-core/issues/517

At the moment, kernelci.org builds linux-next with Clang on arm,
arm64, x86_64 and riscv architectures.  Of all the other
architectures that aren't built yet, i386 should be the easiest
one to add.  Doing this does not require any service to be
installed locally, all you need is Docker and the kernelci-core
repository.  The work to do is basically:

* run kci_build in KernelCI Docker images with the clang-11 and
  clang-10 toolchains to build kernels for i386

* report or fix any build issues, this might just work but it
  needs to be verified with both clang versions

* edit build-configs.yaml to add i386 to the list of
  architectures built with clang-11 and clang-10 if it also
  works

* verify that the list of builds for linux-next includes i386
  defconfig with clang using "kci_build list_kernel_configs"

* send a pull request in GitHub with the change, this will then
  get tested on staging.kernelci.org and reviewed

If it works as expected on staging.kernelci.org and once the PR
review is complete, this will then get merged and deployed in
production for kernelci.org.

Does that sound like something you would be interested to do?

Thanks,
Guillaume
