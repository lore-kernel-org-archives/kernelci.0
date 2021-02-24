Subject: Re: KCIDB contribuition #KCIDB
References: <a91111f8-158d-f811-5309-feb6571d3412@microchip.com>
 <5d6fbc94-bdfd-9822-3bb0-0502751294b0@redhat.com>
 <a64c7a34-8c61-a0bd-0969-6304a3cbe3da@collabora.com>
 <dfbd079c-d8a1-c238-18be-f179483a5856@redhat.com>
 <ef0f014c-f01a-6a7b-c636-44fdf54d9800@microchip.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <d287ecc9-af55-dffc-db72-1ce21c2b4dda@redhat.com>
Date: Wed, 24 Feb 2021 11:51:01 +0200
MIME-Version: 1.0
In-Reply-To: <ef0f014c-f01a-6a7b-c636-44fdf54d9800@microchip.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, santiago.esteban@microchip.com, guillaume.tucker@collabora.com

On 2/24/21 11:42 AM, Santiago.Esteban via info via groups.io wrote:
> On 22/2/21 11:31, Nikolai Kondrashov wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> the content is safe
>>
>> On 2/22/21 12:25 PM, Guillaume Tucker wrote:
>>> On 22/02/2021 09:41, Nikolai Kondrashov wrote:
>>>> I suppose if you already drive everything with an instance of KernelCI
>>>> infrastructure, you can just use the KCIDB interface code that was
>>>> merged
>>>> there. However, I think Guillaume would be able to help you better
>>>> here.
>>>>
>>>> Guillaume, do you think that would work?
>>>
>>> The production instance of kernelci.org is not submitting data to
>>> KCIDB yet because of the overhead related to opening BigQuery
>>> connections.  Until the work to use the streaming interface with
>>> a persistent connection is implemented, and potentially a more
>>> longer-term implementation is in place (i.e. not doing it in
>>> kernelci-backend), I would not recommend doing that.
>>
>> Yeah, the current implementation would be bogged down by the amount of
>> results KernelCI production is producing. However, Santiago, how many
>> builds/tests do you see produced per day? Perhaps it's worth a try
>> to see how that's handled, and maybe it's not too bad? Meanwhile
>> Michal could perhaps finish the rework needed for faster streaming?
>>
>> Nick
>>
> Our CI right now focus on daily builds of  linux-next and linux-mainline
> repositories with only two targets (sama5_defconf, at91_dt_defconf): 4
> builds tested in 7 boards (and two compilers) = 56 results daily.
> 
> I guess, not a lot, considering the amount of data that bigger CI's
> farms produce.

Yeah, that's not much, and you could probably manage with the current
KCIDB-submission code in kernelci. However, if you're going to have your
lab connected anyway soon, the setup effort might not be worth it.

Nick

