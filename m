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
 <50b8bfe1-d13f-290d-2653-ade756eaa712@collabora.com>
 <224f5b41-6f5d-ad10-33cc-1191cd56b692@microchip.com>
 <4194befd-a140-5425-dd98-99f503afeb6f@microchip.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <f67eb664-fce4-60d4-b654-03b6b9e2ded5@collabora.com>
Date: Mon, 22 Feb 2021 10:44:51 +0000
MIME-Version: 1.0
In-Reply-To: <4194befd-a140-5425-dd98-99f503afeb6f@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Santiago.Esteban@microchip.com
Cc: kernelci@groups.io

On 27/01/2021 12:11, Santiago.Esteban@microchip.com wrote:
> On 11/12/20 19:40, Santiago Esteban - M44029 wrote:
>> On 7/12/20 10:08, Guillaume Tucker wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know=
 the content is safe
>>>
>>> On 04/12/2020 11:46, Santiago.Esteban@microchip.com wrote:
>>>> On 3/12/20 15:01, Guillaume Tucker wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you kn=
ow the content is safe
>>>>>
>>>>> On 26/11/2020 10:57, Santiago.Esteban@microchip.com wrote:
>>>>>> On 26/11/20 10:17, Guillaume Tucker wrote:
>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you =
know the content is safe
>>>>>>>
>>>>>>> On 26/11/2020 07:30, Santiago.Esteban@microchip.com wrote:
>>>>>>>> On 25/11/20 15:09, Guillaume Tucker wrote:
>>>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless yo=
u know the content is safe
>>>>>>>>>
>>>>>>>>> On 12/11/2020 11:46, Santiago.Esteban via info via groups.io wro=
te:
>>>>>>>>>> On 12/11/20 9:49, Jan L=C3=BCbbe wrote:
>>>>>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless =
you know the content is safe
>>>>>>>>>>>
>>>>>>>>>>> Hi Santi,
>>>>>>>>>>>
>>>>>>>>>>> On Wed, 2020-11-11 at 18:05 +0000, Santiago.Esteban via info v=
ia groups.io wrote:
>>>>>>>>>>>> Hi KernelCI,
>>>>>>>>>>>>
>>>>>>>>>>>> A few months back I contacted you about adding a new lab to K=
ernelCI
>>>>>>>>>>>> infrastructure. It took us longer than I wished, but now we f=
inally
>>>>>>>>>>>> have been able to connect our farm to an internal KernelCI de=
ployment
>>>>>>>>>>>> (using docker).
>>>>>>>>>>>>
>>>>>>>>>>>> As I explained before, our farm holds 4 boards with different=
 SoCs
>>>>>>>>>>>> from Microchip (and Atmel): Sam9x60ek, Sama5d2_xplained,
>>>>>>>>>>>> Sama5d3_xplained and Sama5d4_xplained. All of then with mainl=
ine
>>>>>>>>>>>> support.
>>>>>>>>>>>>
>>>>>>>>>>>> Our setup, does not uses Lava and it relies on Labgrid to per=
form the
>>>>>>>>>>>> tests. We use "kci_data" tool to publish test results on Kern=
elCI.
>>>>>>>>>>> That's very interesting. :) Do you have published the interfac=
e code
>>>>>>>>>>> somewhere? I've been trying to find some time to do that mysel=
f, but it
>>>>>>>>>>> seems you've beaten me to it. ;)
>>>>>>>>>>>
>>>>>>>>>>> Regards
>>>>>>>>>>> Jan
>>>>>>>>>> Hi Jan,
>>>>>>>>>>
>>>>>>>>>> No, I haven't publish it, till now. I've never though it would =
be useful
>>>>>>>>>> to anybody but me  ;)
>>>>>>>>>>
>>>>>>>>>> I have a python script that is tailored (too much) to our syste=
ms. It
>>>>>>>>>> performs some actions that depend on our infrastructure and how=
 I've
>>>>>>>>>> implemented the labgrid tests (for example, I grab the results =
from a
>>>>>>>>>> pytest  json report). At the end, it creates a "tmeta_<board>.j=
son" file
>>>>>>>>>> (equivalent to the "bmeta.json") that is later published with "=
kci_data"
>>>>>>>>>> tool.
>>>>>>>>>>
>>>>>>>>>> It could be used as an inspiration to make a more generic
>>>>>>>>>> "kci_labgrid_test" tool if there are interest, but, all kernelc=
i
>>>>>>>>>> important stuff, still needs to be validated ;)
>>>>>>>>> There is already a plugin mechanism behind kci_test to have
>>>>>>>>> specific implementations for generating the test job description
>>>>>>>>> data and submitting it to a remote lab.  At the moment, only LAV=
A
>>>>>>>>> has an implementation but it sounds like Labgrid would be a neat
>>>>>>>>> addition.  The main challenge I guess, is that there isn't any
>>>>>>>>> built-in API for Labgrid to receive job descriptions and run
>>>>>>>>> them.
>>>>>>>> Hi Guillaume,
>>>>>>>>
>>>>>>>> Labgrid does not perform any task related to build. It focuses on
>>>>>>>> testing in real hardware. The build stage is performed somewhere =
else.
>>>>>>>> It is a different approach than KernelCI and LAVA. In our case, w=
e
>>>>>>>> trigger the builds in Jenkins and also Jenkins executes the Labgr=
id
>>>>>>>> pytest scripts. It would be great to be able to push KCI jobs int=
o a
>>>>>>>> generic Jenkins server. But, for me, the most difficult part woul=
d be
>>>>>>>> convince IT department to allow a communication from a external s=
ource
>>>>>>>> into the corporate network. I already know the answer....
>>>>>>> Absolutely, that's the same as with LAVA.  The idea is that the
>>>>>>> same builds from kernelci.org can be used in any lab, they're
>>>>>>> just plain kernel builds.  What we could work on is to make it
>>>>>>> easier for labs like yours and in particular when using Labgrid
>>>>>>> to receive some data when there's a new test to run.  That would
>>>>>>> include the URLs to get the kernel image, modules, dtb,
>>>>>>> user-space, commands to run the tests etc...
>>>>>>>
>>>>>>>>> One way to address this issue is to provide notifications with
>>>>>>>>> jobs to run, and a lab using Labgrid would subscribe to it.  As
>>>>>>>>> we're planning to refactor kernelci-backend and also come up wit=
h
>>>>>>>>> a more generic pipeline mechanis than Jenkins, we should be able
>>>>>>>>> to have this kind of notification system in place anyway in orde=
r
>>>>>>>>> to corrdinate the different components of the pipeline in a
>>>>>>>>> modular way.  It would be great to use some Labgrid labs as part
>>>>>>>>> of this exercise.  If you're interested, we can discuss that whe=
n
>>>>>>>>> we have some clear ideas about the main part of work.
>>>>>>>> A publish/subscribe approach will work perfectly to overcome the
>>>>>>>> corporate IT hurdles. Of course, I 'm interested. Please let me k=
now how
>>>>>>>> can I be part of this.
>>>>>>> Great.  There is a roadmap item on GitHub about this:
>>>>>>>
>>>>>>>       https://github.com/kernelci/kernelci-core/issues/315
>>>>>>>
>>>>>>> We've only just started, with a very basic kci_data
>>>>>>> implementation.  This should be broken down into a series of
>>>>>>> tasks such as: cleaning up the kernelci-backend API for receiving
>>>>>>> results, providing a subscription mechanism and having a
>>>>>>> real-world reference system to test it (e.g. a Labgrid lab).  We
>>>>>>> probably should schedule a meeting to go through that in January.
>>>>>>>
>>>>>>>>>> I have attached it to this email the script and (more important=
) an
>>>>>>>>>> example of the output it produces.
>>>>>>>>> Thanks!  It's great to see that it doesn't really take much code
>>>>>>>>> to get some KernelCI jobs to run in Labgrid.
>>>>>>>> Labgrid only cares about  3 things: image to test, board in the f=
arm to
>>>>>>>> use and test to pass. Most of the code is to create a json output=
 test
>>>>>>>> result compatible with the "kci_data" tool.
>>>>>>> Exactly.
>>>>>>>
>>>>>>>>>> BR,
>>>>>>>>>>
>>>>>>>>>> Santi
>>>>>>>>>>
>>>>>>>>>>>> We would like to work with you to be able to publish these re=
sults.
>>>>>>>>>>>> Will it be possible to get a token for the staging database? =
I'm sure
>>>>>>>>>>>> that there are things that need to be polished on our json fi=
les.
>>>>>>>>> Absolutely, I'll send you a staging API token privately.  Also,
>>>>>>>>> are you on IRC?  That would help with discussing things and
>>>>>>>>> addressing any issues.
>>>>>>>> Great! I'm not ussually in IRC.... I'll be more available there (=
as
>>>>>>>> "sesteban"). I'm waiting the token!
>>>>>>> Sent!  Awaiting some data now :)
>>>>>> Hi Guillaume,
>>>>>>
>>>>>> I've this credential/token error when trying to push a kernel build=
:
>>>>>>
>>>>>>             requests.exceptions.HTTPError: 403 Client Error: Operat=
ion not
>>>>>> permitted: provided token is not         authorized for url:
>>>>>> https://api.staging.kernelci.org/upload
>>>>>>             Error: can not push kernel: ../builds/linux-mainline,
>>>>>> https://api.staging.kernelci.org/test, "my-token"
>>>>>>
>>>>>> Something misconfigured in the database?
>>>>> Yes, it looks like an oversight in the part of the code that adds
>>>>> lab tokens as it doesn't enable the permission to send results
>>>>> via the generic test API...  I've fixed that directly in the
>>>>> database and tried your token with kci_data, it works now.
>>>>>
>>>>> Also I've created this issue on GitHub to fix it properly:
>>>>>
>>>>>      https://github.com/kernelci/kernelci-backend/issues/268
>>>>>
>>>>>
>>>>> Let's hope this works for you, and please let us know how it goes
>>>>> with the Labgrid integration.
>>>> Hi,
>>>>
>>>> I think I had the same problem with my local instance of KernelCI. I =
had
>>>> to manually update the properties for the lab. At the time, I thought
>>>> that it was not a bug and that somehow LAVA could do it right.
>>>>
>>>> Unfortunatelly, the problem persists.
>>>>
>>>> Traceback (most recent call last):
>>>>      File "./kci_build", line 353, in <module>
>>>>        status =3D opts.command(configs, opts)
>>>>      File "./kci_build", line 316, in __call__
>>>>        args.install_path)
>>>>      File "/opt/mpuci-kernelci/kernelci-core/kernelci/build.py", line=
 890,
>>>> in push_kernel
>>>>        upload_files(api, token, upload_path, artifacts)
>>>>      File "/opt/mpuci-kernelci/kernelci-core/kernelci/storage.py", li=
ne
>>>> 44, in upload_files
>>>>        resp.raise_for_status()requests.exceptions.HTTPError: 403 Clie=
nt
>>>> Error: Operation not permitted: provided token is not authorized for
>>>> url: https://api.staging.kernelci.org/upload
>>>>            Error: can not push kernel: ../builds/linux-mainline,
>>>> https://api.staging.kernelci.org/test, "my token"
>>>>
>>>> If you tested the token locally and it works, it might be a problem
>>>> related to the IP address allowed to push data in the lab...
>>> The token works, but it's a "lab" token with permissions to
>>> submit test results.  It's not for submitting kernel builds,
>>> which is what you're trying to do here.
>>>
>>> Can you try using builds from storage.kernelci.org?  They come
>>> with a bmeta.json file to get the kernel revision and all related
>>> meta-data you need when submitting the test results for a given
>>> kernel build.
>>>
>>> If you want to test some kernel revisions not currently built on
>>> kernelci.org you can open a GitHub issue to request it:
>>>
>>>     https://github.com/kernelci/kernelci-core/issues/new?assignees=3D&=
labels=3D&template=3Dnew-kernel-branch.md&title=3DAdd+branch+BRANCH+from+TR=
EE
>>>
>>> Thanks,
>>> Guillaume
>> Hi Guillaume,
>>
>> I have finally push some results in the staging database. I'm sorry tha=
t
>> took me so long, but we just had a bank holiday here in Spain :)
>>
>> https://staging.kernelci.org/soc/at91/job/mainline/kernel/v5.10-rc7-10-=
ga68a0262abda/plan/baseline/
>>
>> At first glance looks ok, but if you click on the "Full results"
>> (https://staging.kernelci.org/test/plan/id/5fd21e6c81bee0f1bf417ce4/)
>> the page is broken... Well,=C2=A0 the results received from the databas=
e are
>> not complete. I checked the javascript in view-tests-plan-id.2020.10.js
>> and I found that=C2=A0 there are missing fields like "build_id". It see=
ms
>> that not all the build information are available to all=C2=A0 "defconfi=
gs" at
>> the staging database. The /test/plan/id page works fine in my local
>> kernelci deployment.
>>
>> I chose the build manually, because the token that you provide cannot
>> access the https://api.staging.kernelci.org/build information.
>>
>> While the issue #315 is solved, could we find a easy way to publish
>> results?I could poll the backend to check for new builds, do the tests,
>> and finally publish them.

Yes that is what other non-LAVA labs already do.  It's strange
your token doesn't let you read the build data, I'll check the
permissions associated with it.  What is the query you're using?

>> As how to solve #315 for good, I would suggest using Autobahn
>> (https://autobahn.readthedocs.io/en/latest/). Labgrid is build around i=
t
>> and works like a charm. I'm no expert, maybe Pengutronix people can
>> share their experience and recommend this path or another.

OK thanks for sharing this.  I've started to look at CloudEvents:

  https://cloudevents.io/

I guess it would be good to list all the existing potential
solutions and compare to choose what works best for the KernelCI
use-case.

>> Best regards,
>>
>> Santi
>>
>> p.s I have attached the json file that I have pushed into the staging
>> database using kci_data, in case you need to look at it.
>=20
> Hi Guillaume,

Sorry for the delay in replying, we've been going through a lot
of things with KernelCI lately to grow our team of maintainers.
Hopefully communication should become smoother now :)

> About pushing data into staging... Could you add some kernel builds with=
=
=20
> "sama5_defconfig" and "at91_dt_defconfig" configurations for=20
> mainline/master(or any other tree/branch )? I have not found those=20
> configurations in the staging database, I would like to test this=20
> thoroughly.

We can have them built once on staging, but we're not going to
enable them all the time because staging builds have to remain
limited to the bare minimum.  You can however get those builds
from production:

* sama5_defconfig https://kernelci.org/build/id/60331b14c9b222ae1aaddd1a/
* at91_dt_defconfig https://kernelci.org/build/id/60331a4b0b58f1585faddcb6=
/

You can download the build artifacts and the meta-data from there
and should be able to run some tests with these builds.  Would
that work for you?

> In a (kind of) different topic, what is the status of Generic Lab=20
> Support #315? Are there any plans to implement this soon? I could=20
> dedicate time to push forward this task, but definitively, I would need=
=20
> some steering to avoid wasting both my time and your time.

As mentioned in my earlier email about KCIDB, we've been trying
to fix the blocking issues with submitting data from
kernelci-bakend to KCIDB.  This should get resolved in a week or
two hopefully, then kernelci-backend will need to go through some
redesign.  With the code and experience we have, I think it will
be a rather straightforward development "sprint" but it might
take a couple of months of maturing to get that working really
well and enable it in production.  We should have a dedicated
meeting to discuss that in greater detail in the coming weeks.

Best wishes,
Guillaume
