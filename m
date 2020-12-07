Subject: Re: Contribute to Kernel-CI with a new Lab
References: <f3a51005-7e51-e9b0-7a07-c5a268ab00ce@microchip.com>
 <ccf0ae0dbd5cce956631a7e4572ca84e0abd45e1.camel@pengutronix.de>
 <b722c06a-057d-c1bb-1013-682d4282bbd7@microchip.com>
 <90ad5257-0690-913a-1a04-d299f6830305@collabora.com>
 <b0990fe6-22c7-15e9-8f88-8751b72b6205@microchip.com>
 <28bb83a2-7b3d-418f-4183-1ed514eb00c1@collabora.com>
 <3ca1ef75-d191-4fdd-6a25-0e375103092f@microchip.com>
 <6455d2b7-126b-ce28-ab2a-af8d920bda79@collabora.com>
 <71a5d2a8-101d-ddba-d28c-c0ccad33a914@microchip.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <50b8bfe1-d13f-290d-2653-ade756eaa712@collabora.com>
Date: Mon, 7 Dec 2020 09:08:36 +0000
MIME-Version: 1.0
In-Reply-To: <71a5d2a8-101d-ddba-d28c-c0ccad33a914@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Santiago.Esteban@microchip.com, jlu@pengutronix.de
Cc: kernelci@groups.io, ticotimo@gmail.com

On 04/12/2020 11:46, Santiago.Esteban@microchip.com wrote:
> On 3/12/20 15:01, Guillaume Tucker wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
>>
>> On 26/11/2020 10:57, Santiago.Esteban@microchip.com wrote:
>>> On 26/11/20 10:17, Guillaume Tucker wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you kno=
w the content is safe
>>>>
>>>> On 26/11/2020 07:30, Santiago.Esteban@microchip.com wrote:
>>>>> On 25/11/20 15:09, Guillaume Tucker wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you k=
now the content is safe
>>>>>>
>>>>>> On 12/11/2020 11:46, Santiago.Esteban via info via groups.io wrote:
>>>>>>> On 12/11/20 9:49, Jan L=C3=BCbbe wrote:
>>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you=
 know the content is safe
>>>>>>>>
>>>>>>>> Hi Santi,
>>>>>>>>
>>>>>>>> On Wed, 2020-11-11 at 18:05 +0000, Santiago.Esteban via info via =
groups.io wrote:
>>>>>>>>> Hi KernelCI,
>>>>>>>>>
>>>>>>>>> A few months back I contacted you about adding a new lab to Kern=
elCI
>>>>>>>>> infrastructure. It took us longer than I wished, but now we fina=
lly
>>>>>>>>> have been able to connect our farm to an internal KernelCI deplo=
yment
>>>>>>>>> (using docker).
>>>>>>>>>
>>>>>>>>> As I explained before, our farm holds 4 boards with different So=
Cs
>>>>>>>>> from Microchip (and Atmel): Sam9x60ek, Sama5d2_xplained,
>>>>>>>>> Sama5d3_xplained and Sama5d4_xplained. All of then with mainline
>>>>>>>>> support.
>>>>>>>>>
>>>>>>>>> Our setup, does not uses Lava and it relies on Labgrid to perfor=
m the
>>>>>>>>> tests. We use "kci_data" tool to publish test results on KernelC=
I.
>>>>>>>> That's very interesting. :) Do you have published the interface c=
ode
>>>>>>>> somewhere? I've been trying to find some time to do that myself, =
but it
>>>>>>>> seems you've beaten me to it. ;)
>>>>>>>>
>>>>>>>> Regards
>>>>>>>> Jan
>>>>>>> Hi Jan,
>>>>>>>
>>>>>>> No, I haven't publish it, till now. I've never though it would be =
useful
>>>>>>> to anybody but me  ;)
>>>>>>>
>>>>>>> I have a python script that is tailored (too much) to our systems.=
 It
>>>>>>> performs some actions that depend on our infrastructure and how I'=
ve
>>>>>>> implemented the labgrid tests (for example, I grab the results fro=
m a
>>>>>>> pytest  json report). At the end, it creates a "tmeta_<board>.json=
" file
>>>>>>> (equivalent to the "bmeta.json") that is later published with "kci=
_data"
>>>>>>> tool.
>>>>>>>
>>>>>>> It could be used as an inspiration to make a more generic
>>>>>>> "kci_labgrid_test" tool if there are interest, but, all kernelci
>>>>>>> important stuff, still needs to be validated ;)
>>>>>> There is already a plugin mechanism behind kci_test to have
>>>>>> specific implementations for generating the test job description
>>>>>> data and submitting it to a remote lab.  At the moment, only LAVA
>>>>>> has an implementation but it sounds like Labgrid would be a neat
>>>>>> addition.  The main challenge I guess, is that there isn't any
>>>>>> built-in API for Labgrid to receive job descriptions and run
>>>>>> them.
>>>>> Hi Guillaume,
>>>>>
>>>>> Labgrid does not perform any task related to build. It focuses on
>>>>> testing in real hardware. The build stage is performed somewhere els=
e.
>>>>> It is a different approach than KernelCI and LAVA. In our case, we
>>>>> trigger the builds in Jenkins and also Jenkins executes the Labgrid
>>>>> pytest scripts. It would be great to be able to push KCI jobs into a
>>>>> generic Jenkins server. But, for me, the most difficult part would b=
e
>>>>> convince IT department to allow a communication from a external sour=
ce
>>>>> into the corporate network. I already know the answer....
>>>> Absolutely, that's the same as with LAVA.  The idea is that the
>>>> same builds from kernelci.org can be used in any lab, they're
>>>> just plain kernel builds.  What we could work on is to make it
>>>> easier for labs like yours and in particular when using Labgrid
>>>> to receive some data when there's a new test to run.  That would
>>>> include the URLs to get the kernel image, modules, dtb,
>>>> user-space, commands to run the tests etc...
>>>>
>>>>>> One way to address this issue is to provide notifications with
>>>>>> jobs to run, and a lab using Labgrid would subscribe to it.  As
>>>>>> we're planning to refactor kernelci-backend and also come up with
>>>>>> a more generic pipeline mechanis than Jenkins, we should be able
>>>>>> to have this kind of notification system in place anyway in order
>>>>>> to corrdinate the different components of the pipeline in a
>>>>>> modular way.  It would be great to use some Labgrid labs as part
>>>>>> of this exercise.  If you're interested, we can discuss that when
>>>>>> we have some clear ideas about the main part of work.
>>>>> A publish/subscribe approach will work perfectly to overcome the
>>>>> corporate IT hurdles. Of course, I 'm interested. Please let me know=
 how
>>>>> can I be part of this.
>>>> Great.  There is a roadmap item on GitHub about this:
>>>>
>>>>     https://github.com/kernelci/kernelci-core/issues/315
>>>>
>>>> We've only just started, with a very basic kci_data
>>>> implementation.  This should be broken down into a series of
>>>> tasks such as: cleaning up the kernelci-backend API for receiving
>>>> results, providing a subscription mechanism and having a
>>>> real-world reference system to test it (e.g. a Labgrid lab).  We
>>>> probably should schedule a meeting to go through that in January.
>>>>
>>>>>>> I have attached it to this email the script and (more important) a=
n
>>>>>>> example of the output it produces.
>>>>>> Thanks!  It's great to see that it doesn't really take much code
>>>>>> to get some KernelCI jobs to run in Labgrid.
>>>>> Labgrid only cares about  3 things: image to test, board in the farm=
 to
>>>>> use and test to pass. Most of the code is to create a json output te=
st
>>>>> result compatible with the "kci_data" tool.
>>>> Exactly.
>>>>
>>>>>>> BR,
>>>>>>>
>>>>>>> Santi
>>>>>>>
>>>>>>>>> We would like to work with you to be able to publish these resul=
ts.
>>>>>>>>> Will it be possible to get a token for the staging database? I'm=
 sure
>>>>>>>>> that there are things that need to be polished on our json files=
.
>>>>>> Absolutely, I'll send you a staging API token privately.  Also,
>>>>>> are you on IRC?  That would help with discussing things and
>>>>>> addressing any issues.
>>>>> Great! I'm not ussually in IRC.... I'll be more available there (as
>>>>> "sesteban"). I'm waiting the token!
>>>> Sent!  Awaiting some data now :)
>>> Hi Guillaume,
>>>
>>> I've this credential/token error when trying to push a kernel build:
>>>
>>>           requests.exceptions.HTTPError: 403 Client Error: Operation n=
ot
>>> permitted: provided token is not         authorized for url:
>>> https://api.staging.kernelci.org/upload
>>>           Error: can not push kernel: ../builds/linux-mainline,
>>> https://api.staging.kernelci.org/test, "my-token"
>>>
>>> Something misconfigured in the database?
>> Yes, it looks like an oversight in the part of the code that adds
>> lab tokens as it doesn't enable the permission to send results
>> via the generic test API...  I've fixed that directly in the
>> database and tried your token with kci_data, it works now.
>>
>> Also I've created this issue on GitHub to fix it properly:
>>
>>    https://github.com/kernelci/kernelci-backend/issues/268
>>
>>
>> Let's hope this works for you, and please let us know how it goes
>> with the Labgrid integration.
>=20
> Hi,
>=20
> I think I had the same problem with my local instance of KernelCI. I had=
=
=20
> to manually update the properties for the lab. At the time, I thought=20
> that it was not a bug and that somehow LAVA could do it right.
>=20
> Unfortunatelly, the problem persists.
>=20
> Traceback (most recent call last):
>  =C2=A0 File "./kci_build", line 353, in <module>
>  =C2=A0=C2=A0=C2=A0 status =3D opts.command(configs, opts)
>  =C2=A0 File "./kci_build", line 316, in __call__
>  =C2=A0=C2=A0=C2=A0 args.install_path)
>  =C2=A0 File "/opt/mpuci-kernelci/kernelci-core/kernelci/build.py", line=
 890,=20
> in push_kernel
>  =C2=A0=C2=A0=C2=A0 upload_files(api, token, upload_path, artifacts)
>  =C2=A0 File "/opt/mpuci-kernelci/kernelci-core/kernelci/storage.py", li=
ne=20
> 44, in upload_files
>  =C2=A0=C2=A0=C2=A0 resp.raise_for_status()requests.exceptions.HTTPError=
: 403 Client=20
> Error: Operation not permitted: provided token is not authorized for=20
> url: https://api.staging.kernelci.org/upload
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Error: can not push kernel: =
../builds/linux-mainline,=20
> https://api.staging.kernelci.org/test, "my token"
>=20
> If you tested the token locally and it works, it might be a problem=20
> related to the IP address allowed to push data in the lab...

The token works, but it's a "lab" token with permissions to
submit test results.  It's not for submitting kernel builds,
which is what you're trying to do here.

Can you try using builds from storage.kernelci.org?  They come
with a bmeta.json file to get the kernel revision and all related
meta-data you need when submitting the test results for a given
kernel build.

If you want to test some kernel revisions not currently built on
kernelci.org you can open a GitHub issue to request it:

  https://github.com/kernelci/kernelci-core/issues/new?assignees=3D&labels=
=
=3D&template=3Dnew-kernel-branch.md&title=3DAdd+branch+BRANCH+from+TREE

Thanks,
Guillaume
