Subject: Re: Microchip KernelCi contributions
References: <3c193c7e-c13d-5740-8d11-4dca5be528ef@microchip.com>
 <7hr1to4iad.fsf@baylibre.com>
 <72733295-b2b4-aaa1-5e8f-023df9f158e1@microchip.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <30b02ca2-4770-2dca-0bd7-a729735156ec@collabora.com>
Date: Mon, 20 Jul 2020 16:14:51 +0100
MIME-Version: 1.0
In-Reply-To: <72733295-b2b4-aaa1-5e8f-023df9f158e1@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, santiago.esteban@microchip.com, khilman@baylibre.com

On 20/07/2020 13:11, santiago.esteban via groups.io wrote:
> Hi Kevin,
>=20
> I'm sorry for my late reply, but was on hollidays...
>=20
> On 6/7/20 20:20, Kevin Hilman wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
>>
>> Hi Santiago,
>>
>> <Santiago.Esteban@microchip.com> writes:
>>
>>> I'm Santiago Esteban, SW Engineer at Microchip. I'm  leading the effor=
t
>>> for continuous integration of our Linux developments. We are setting u=
p
>>> the  infrastructure for CI in a  board farm containing several boards.
>>> We would like to contribute to the KernelCI effort with build and test
>>> data. Hopefully, as our knowledge increases we will be able to help  i=
n
>>> some other ways.
>>>
>>>
>>> How should I prodeed?
>> How is your lab currently setup?  Are you using LAVA? If not, can you
>> tell us a bit more about how your lab is setup?  What kind of hardware
>> you're testing?
>=20
> Unfortunately, we are not using LAVA, we are using a corporate Jenkins=
=20
> server, a local development KernelCI server and Labgrid (from=20
> Pengutronix) for testing the boards on the farm.
>=20
> Right now, we are testing 3 different ARM Cortex-A5 SOCs (SAMA5D3,=20
> SAMA5D4, SAMA5D2) and ARM9 device (SAM9X60), all SoCs and test boards=20
> are mainlined. We are in the process of mainlining support for 2 new=20
> devices/boards.
>=20
>>
>> If using LAVA, getting integrated into KernelCI is pretty straight
>> forward.
>>
>> Some pre-requisites:
>>
>> - boards can boot an upstream Linux kernel using an upstream defconfig,
>>    (minimum: boot to a serial-console shell using a ramdisk)
>> - LAVA device-types for your boards are submitted upstream to the LAVA
>>    project
>>
>>  From there, with a basic LAVA setup/working, we just add your lab to o=
ur
>> list of labs[1] and then add your device-types in your lab to our list
>> of devices[2].
>>
>> For kernelci.org to be able to submit jobs to your LAVA lab, you'll nee=
d
>> to create a `kernel-ci` user, setup an auth token and share that token
>> with us.  Any boards that the kernel-ci LAVA user has access to,
>> kernelci.org will have access to.
>>
>> Hope that helps get you started,
>>
>> Kevin
>>
>> [1] https://github.com/kernelci/kernelci-core/blob/master/lab-configs.y=
aml
>> [2] https://github.com/kernelci/kernelci-core/blob/master/test-configs.=
yaml
>>
> As we are not using LAVA, we are using a local KCI docker setup. We are=
=20
> able to perform builds for a selected set of repos/branches (simplified=
=20
> version of lab-configs.yaml), test the outputs using Labgrid, and=20
> publish the test results in the local KCI application.
>=20
> Right now it is a simple boot test, but I'm working on a full baseline=
=20
> test and later, in the future, add more functional tests.
>=20
> I guess that in this case, I would need from you to create a lab, let's=
=20
> say=C2=A0 "lab-microchip" and share the token with us (maybe starting wi=
th a=20
> staging repository), so I can push our test results.

It seems like you're already automating jobs from Jenkins, so one
option would be to add Labgrid support to let KernelCI do that as
well if you want to test KernelCI builds directly.  That should
also help with running bisections.  Do you have a public-facing
web API for Labgrid that KernelCI could use to trigger jobs?

Presumably you're already sending test results to your local
kernelci-backend instance.  So another option is to keep all that
in place but also submit your results to the production
api.kernelci.org instance (or api.staging.kernelci.org initially
to try things out).  The new kci_data tool which is being
developed now should help with that.

Then of course you can also set up a LAVA lab but that would seem
overkill if you already have a working test system, unless you're
planning to stop using Labgrid and migrate to LAVA anyway.

Thanks,
Guillaume
