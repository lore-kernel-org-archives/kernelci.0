Subject: Re: KCIDB contribuition #KCIDB
References: <a91111f8-158d-f811-5309-feb6571d3412@microchip.com>
 <5d6fbc94-bdfd-9822-3bb0-0502751294b0@redhat.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <a64c7a34-8c61-a0bd-0969-6304a3cbe3da@collabora.com>
Date: Mon, 22 Feb 2021 10:25:25 +0000
MIME-Version: 1.0
In-Reply-To: <5d6fbc94-bdfd-9822-3bb0-0502751294b0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, kernelci@groups.io, santiago.esteban@microchip.com

On 22/02/2021 09:41, Nikolai Kondrashov wrote:
> Hello Santiago,
> 
> On 2/22/21 10:02 AM, Santiago.Esteban via info via groups.io wrote:
>> Good morning KernelCI, Nikolai,
>>
>> As I mention here before, I work at Microchip, and we are building a
>> test farm based on Labgrid which currently, allow us to test Linux
>> kernels in several ARM SoC devices (Cortex-A5, ARM9 variants). We would
>> like to contribute to KernelCI effort with our builds/tests but support
>> for non Lava external labs is not available yet.
>>
>> Therefore, It seems that KCIDB is the place for us. We would like to
>> start contributing our builds/tests to this project.
>>
>> As part of our current efforts, we have build a local instance of the
>> KernelCI infrastructure. I've already asked Nicolai @DevConf, but here,
>> at a wider audience, Are there any tool that allows to submmit
>> "standard" KernelCI formatted data into the KCIDB database?
> 
> I suppose if you already drive everything with an instance of KernelCI
> infrastructure, you can just use the KCIDB interface code that was merged
> there. However, I think Guillaume would be able to help you better here.
> 
> Guillaume, do you think that would work?

The production instance of kernelci.org is not submitting data to
KCIDB yet because of the overhead related to opening BigQuery
connections.  Until the work to use the streaming interface with
a persistent connection is implemented, and potentially a more
longer-term implementation is in place (i.e. not doing it in
kernelci-backend), I would not recommend doing that.

However, if you are available to help it would be great to speed
up the work with redesigning kernelci-backend.  It should have
happened about a year ago but there have been many distractions
on the way slowing things down.  It's becoming the main sticking
point now, so it will soon be receiving the attention it
deserves.

One thing I don't quite get, is that if you already have an
instance of KernelCI driving your test lab, why not have your
test lab connected to the kernelci.org instance in the same way?
Having Labgrid properly supported by KernelCI is still on the
roadmap, in fact it's related to the redesign of
kernelci-backend.  

Having your own CI pipeline is mostly useful if you want to build
your own kernels or run tests in a private environment.  All the
current KCIDB contributions are coming from preexisting CI
systems which do just that (distro kernels, private test labs).
But if you want to use the builds from kernelci.org and do what
all the other labs on kernelci.org already do, then using KCIDB
directly doesn't seem like the logical choice to me (and results
going to kernelci.org will also end up in KCIDB).

Best wishes,
Guillaume
