Subject: Re: KCIDB contribuition #KCIDB
References: <a91111f8-158d-f811-5309-feb6571d3412@microchip.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <5d6fbc94-bdfd-9822-3bb0-0502751294b0@redhat.com>
Date: Mon, 22 Feb 2021 11:41:20 +0200
MIME-Version: 1.0
In-Reply-To: <a91111f8-158d-f811-5309-feb6571d3412@microchip.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, santiago.esteban@microchip.com, Guillaume Tucker <guillaume.tucker@collabora.com>

Hello Santiago,

On 2/22/21 10:02 AM, Santiago.Esteban via info via groups.io wrote:
> Good morning KernelCI, Nikolai,
> 
> As I mention here before, I work at Microchip, and we are building a
> test farm based on Labgrid which currently, allow us to test Linux
> kernels in several ARM SoC devices (Cortex-A5, ARM9 variants). We would
> like to contribute to KernelCI effort with our builds/tests but support
> for non Lava external labs is not available yet.
> 
> Therefore, It seems that KCIDB is the place for us. We would like to
> start contributing our builds/tests to this project.
> 
> As part of our current efforts, we have build a local instance of the
> KernelCI infrastructure. I've already asked Nicolai @DevConf, but here,
> at a wider audience, Are there any tool that allows to submmit
> "standard" KernelCI formatted data into the KCIDB database?

I suppose if you already drive everything with an instance of KernelCI
infrastructure, you can just use the KCIDB interface code that was merged
there. However, I think Guillaume would be able to help you better here.

Guillaume, do you think that would work?

> Best regards,
> 
> Santiago Esteban
> 
> ps. Nikolai, I liked a lot your presentation @DevConf, it helped me to
> understand some aspect of KernelCI  and KCIDB to me.

Ah, glad to hear that, thanks :)

Nick

