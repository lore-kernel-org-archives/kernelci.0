Subject: Re: help: how to contribute to the community
References: <a34a999c78584e0e9953360bbd5797f8@G08CNEXMBPEKD05.g08.fujitsu.local>
 <ec96708e-12d5-ff21-1f21-dfd2262927dc@collabora.com>
 <c2e6b26abf2446e98e8e162b5015fa29@G08CNEXMBPEKD05.g08.fujitsu.local>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <ffaf7e62-294e-17fb-25e5-d8a5ce8ef9e5@collabora.com>
Date: Mon, 25 Jan 2021 23:21:54 +0000
MIME-Version: 1.0
In-Reply-To: <c2e6b26abf2446e98e8e162b5015fa29@G08CNEXMBPEKD05.g08.fujitsu.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, wangmy@cn.fujitsu.com

Hello,

On 06/01/2021 01:05, Wang Mingyu wrote:
> Hi Guillaume,
>=20
> I've already added i386 to the list of architectures built with clang-11=
 and clang-10.
> Please confirm if there is any problem.

Sorry for the delay in replying, and thank you for your
contributions.  The PR to enable i386 Clang builds looks fine,
I'm doing a couple of builds to verify it's working as expected
with the current Clang Docker containers and the default build
options.  I'll put a comment on the PR.

> In addition, pull request 545 has not been confirmed. If there are any p=
roblems, please let me know

There was a small issue with how the PR was created, the origin
repo appeared to be "unknown" rather than your fork.  Then the PR
got closed by accident when renaming the "master" branch
to "main", I think it's because of the unknown repository.  In
any case, thanks for reporting the issue as the code wasn't easy
to use.  I've now refactored it with a simpler implementation
using methods in the LAVA class:

  https://github.com/kernelci/kernelci-core/pull/590


On a different topic, have you considered sending test results
from a Fujitsu test lab?  You could set up a LAVA instance to
have tests scheduled on your platforms by kernelci.org, or if you
have an existing automated test system for the upstream kernel
you may send the results directly to KCIDB (or do both).

Best regards,
Guillaume

> If there is anything else I can do, please let me know. Thank you
>=20
> Best regards
> Wang Mingyu
>=20
>> -----Original Message-----
>> From: Guillaume Tucker <guillaume.tucker@collabora.com>
>> Sent: Thursday, December 10, 2020 6:13 PM
>> To: kernelci@groups.io; Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wang=
my@cn.fujitsu.com>
>> Subject: Re: help: how to contribute to the community
>>
>> On 08/12/2020 07:43, Wang Mingyu wrote:
>>> Hi, all
>>>
>>> I am currently using this tool.
>>> Although I am still new, I still want to contribute to the community.
>>> Is there anything I can do=EF=BC=9F
>>> For example, bug fix, or simple new plan to kernelci.
>>
>> Thank you for your interest, there are plenty of things that first-time
>> contributors can do in KernelCI.  One would be to enable i386 builds wi=
th
>> Clang, as per this GitHub issue:
>>
>>   https://github.com/kernelci/kernelci-core/issues/517
>>
>> At the moment, kernelci.org builds linux-next with Clang on arm, arm64,
>> x86_64 and riscv architectures.  Of all the other architectures that ar=
en't
>> built yet, i386 should be the easiest one to add.  Doing this does not =
require
>> any service to be installed locally, all you need is Docker and the ker=
nelci-core
>> repository.  The work to do is basically:
>>
>> * run kci_build in KernelCI Docker images with the clang-11 and
>>   clang-10 toolchains to build kernels for i386
>>
>> * report or fix any build issues, this might just work but it
>>   needs to be verified with both clang versions
>>
>> * edit build-configs.yaml to add i386 to the list of
>>   architectures built with clang-11 and clang-10 if it also
>>   works
>>
>> * verify that the list of builds for linux-next includes i386
>>   defconfig with clang using "kci_build list_kernel_configs"
>>
>> * send a pull request in GitHub with the change, this will then
>>   get tested on staging.kernelci.org and reviewed
>>
>> If it works as expected on staging.kernelci.org and once the PR review =
is
>> complete, this will then get merged and deployed in production for
>> kernelci.org.
>>
>> Does that sound like something you would be interested to do?
>>
>> Thanks,
>> Guillaume
>>
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20

