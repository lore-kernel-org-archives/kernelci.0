Message-ID: <28ee7ff8-5b21-9154-74e9-efd59da4a498@collabora.com>
Date: Mon, 4 Apr 2022 20:44:41 +0100
MIME-Version: 1.0
Subject: Re: next/master bisection: baseline.login on asus-C523NA-A20057-coral
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
References: <623c13ec.1c69fb81.8cbdb.5a7a@mx.google.com>
 <Yjyv03JsetIsTJxN@sirena.org.uk>
 <4e9fca2f-0af1-3684-6c97-4c35befd5019@redhat.com>
 <Yjzua8Wye/3DHBKx@sirena.org.uk>
 <f8e96f8a-c19c-6acd-2f54-688924f491e8@redhat.com>
 <28699579-8384-ff3b-5662-fb56d8ced766@collabora.com>
In-Reply-To: <28699579-8384-ff3b-5662-fb56d8ced766@collabora.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-pci@vger.kernel.org, "kernelci@groups.io" <kernelci@groups.io>, "kernelci-results@groups.io" <kernelci-results@groups.io>

+kernelci

On 29/03/2022 19:44, Guillaume Tucker wrote:
> On 28/03/2022 13:54, Hans de Goede wrote:
>> Hi,
>>
>> On 3/24/22 23:19, Mark Brown wrote:
>>> On Thu, Mar 24, 2022 at 09:34:30PM +0100, Hans de Goede wrote:
>>>
>>>> Mark, if one of use writes a test patch, can you get that Asus machine to boot a
>>>> kernel build from next + the test patch ?
>>>
>>> I can't directly unfortunately as the board is in Collabora's lab but
>>> Guillaume (who's already CCed) ought to be able to, and I can generally
>>> prod and try to get that done.
>>
>> Ok, Guillaume, can you try a kernel with commit 5949965ec9340cfc0e65f7d8a576b660b26e2535
>> ("x86/PCI: Preserve host bridge windows completely covered by E820") + the 
>> attached patch added on top a try on the asus-C523NA-A20057-coral machine please
>> and see if that makes it boot again ?
> 
> Sorry I've been busy with a conference.  Sure, will put that
> through KernelCI tomorrow and let you know the outcome.

Well the issue seems to have been fixed on mainline, unless it's
intermittent.  In any case, next-20220404 is booting fine:

  https://linux.kernelci.org/test/plan/id/624aed811a5acd09adae071e/

Last time it was seen to fail was next-20220330:

  https://linux.kernelci.org/test/plan/id/62442f68e30d6f89a4ae06b7/


Ironically, the KernelCI staging linux-next job with the patches
mentioned in your previous email applied is now failing:

  https://staging.kernelci.org/test/plan/id/624b2d3b923f532dc305f4c7/

The kernel branch being used is:

  https://github.com/kernelci/linux/commits/staging-next


I haven't checked the logs or investigated any further, this is
just a quick summary based on the boot test results.

Please let us know if we should drop these patches or try
anything else.  I'll be on holiday for the rest of the week but
others can pick things up if needed.

Thanks,
Guillaume
