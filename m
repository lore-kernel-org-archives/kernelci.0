Message-ID: <ccf0ae0dbd5cce956631a7e4572ca84e0abd45e1.camel@pengutronix.de>
Subject: Re: Contribute to Kernel-CI with a new Lab
From: "Jan Luebbe" <jlu@pengutronix.de>
Date: Thu, 12 Nov 2020 09:49:37 +0100
In-Reply-To: <f3a51005-7e51-e9b0-7a07-c5a268ab00ce@microchip.com>
References: <f3a51005-7e51-e9b0-7a07-c5a268ab00ce@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, santiago.esteban@microchip.com, info@kernelci.org

Hi Santi,

On Wed, 2020-11-11 at 18:05 +0000, Santiago.Esteban via info via groups.io wrote:
> Hi KernelCI,
> 
> A few months back I contacted you about adding a new lab to KernelCI
> infrastructure. It took us longer than I wished, but now we finally
> have been able to connect our farm to an internal KernelCI deployment
> (using docker).
> 
> As I explained before, our farm holds 4 boards with different SoCs
> from Microchip (and Atmel): Sam9x60ek, Sama5d2_xplained,
> Sama5d3_xplained and Sama5d4_xplained. All of then with mainline
> support.
> 
> Our setup, does not uses Lava and it relies on Labgrid to perform the
> tests. We use "kci_data" tool to publish test results on KernelCI.

That's very interesting. :) Do you have published the interface code
somewhere? I've been trying to find some time to do that myself, but it
seems you've beaten me to it. ;)

Regards
Jan

> We would like to work with you to be able to publish these results.
> Will it be possible to get a token for the staging database? I'm sure
> that there are things that need to be polished on our json files.


