Subject: Re: KCIDB engagement report #kcidb
References: <ef0cf85a-1bb3-c3eb-7193-da39d7d8152f@redhat.com>
 <1546612940.5670843.1611224261504.JavaMail.zimbra@irisa.fr>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <2299996f-26fe-1411-60fe-89a29f37753a@redhat.com>
Date: Thu, 21 Jan 2021 12:26:23 +0200
MIME-Version: 1.0
In-Reply-To: <1546612940.5670843.1611224261504.JavaMail.zimbra@irisa.fr>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, mathieu.acher@irisa.fr
Cc: automated-testing@yoctoproject.org

Hi Mathieu,

On 1/21/21 12:17 PM, Mathieu Acher wrote:
 > TuxML https://github.com/TuxML/tuxml has a plan to synchronize with KCIDB in the upcoming months.

Wonderful, would be happy to help you!
Don't hesitate to contact us on the maillist and on the freenode's #kernelci channel, anytime!

Nick

On 1/21/21 12:17 PM, Mathieu Acher wrote:
> Hi,
> 
> TuxML https://github.com/TuxML/tuxml has a plan to synchronize with KCIDB in the upcoming months.
> Our focus is on testing random configurations of the Linux kernel in the large.
> We have two use cases (at least):
>   * configuration bug prevention/prediction/fixing (when the kernel config. does not build)
>   * binary kernel size prediction (for whatever kernel version and compiler)
> 
> We have some data here: https://tuxmlweb.istic.univ-rennes1.fr/
> We plan to discuss this in february with KernelCI's team for further refining how we can integrate/interoperate.
> 
> Best,
> 
> --
> Dr. Mathieu ACHER, Associate Professor
> Univ Rennes, Inria, CNRS, IRISA, France (DiverSE team)
> http://www.mathieuacher.com/
> 
> ----- Mail original -----
>> De: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
>> À: "kernelci" <kernelci@groups.io>, automated-testing@yoctoproject.org
>> Envoyé: Jeudi 21 Janvier 2021 11:07:02
>> Objet: KCIDB engagement report
> 
>> Hi everyone,
>>
>> Below is the monthly report on KCIDB* engagement. It lists various CI systems
>> and their status of engagement with KCIDB, and once we get to that, will list
>> developer engagement.
>>
>> Lines with updates are marked with "!".
>>
>> The main news is that Gentoo GKernelCI have started sending their preliminary
>> data to our "playground" setup. Linaro have also started work on sending
>> tuxmake build results, but no reports have arrived yet.
>>
>>      KernelCI native
>>          Sending staging results.
>>          Transitioning to production results is at 50%
>>          (KCIDB support done, backend work started).
>>          https://staging.kernelci.org:3000/?var-origin=kernelci
>>
>>      Red Hat CKI
>>          Sending production results.
>>          https://staging.kernelci.org:3000/?var-origin=redhat
>>
>>      Google Syzbot
>>          Sending a subset of production results (failures only).
>>          https://staging.kernelci.org:3000/?var-origin=syzbot
>>
>>      ARM
>>          Sending production results to "production" KCIDB.
>>          Full commit hashes are currently not available, are spoofed, and don't
>>          match the ones reported by others. To be fixed soon.
>>          https://staging.kernelci.org:3000/?var-origin=arm
>>
>>      Sony Fuego
>>          Internal design in progress.
>>
>> !   Gentoo GKernelCI
>> !       Preliminary data (revisions and builds) have started flowing into
>> !       "playground" KCIDB. No timestamps yet.
>> !
>> https://staging.kernelci.org:3000/d/home/home?var-origin=gkernelci&var-dataset=playground_kernelci04
>>
>>      Intel 0day
>>          Initial conversation concluded, general interest expressed,
>>          no contact since.
>>
>> !   Linaro
>> !       Work has started on sending tuxmake build results
>> !       (a part of https://tuxsuite.com/). No reports have arrived yet.
>>
>> Please respond with corrections or suggestions of other CI systems to contact.
>>
>> Nick
>>
>> *KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
>>   Foundation's KernelCI project:
>>   https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/
>>
>>
>>
>>
> 
> 
> 
> 
> 

