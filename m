Subject: Re: [Automated-testing] KCIDB engagement report
References: <ef0cf85a-1bb3-c3eb-7193-da39d7d8152f@redhat.com>
 <cde7e97bceec089445cda3c31d6ff9ed9d3f2e08.camel@linuxfoundation.org>
 <c0995fe0-508b-1115-c584-6bf7e5ee317d@redhat.com>
 <51992e6d2f8ada0349aa9432759409d6076aa34a.camel@linuxfoundation.org>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <d27808f6-9b9b-164a-6adc-b782e03f26e5@redhat.com>
Date: Tue, 26 Jan 2021 17:19:25 +0200
MIME-Version: 1.0
In-Reply-To: <51992e6d2f8ada0349aa9432759409d6076aa34a.camel@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, kernelci@groups.io, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi Richard,

On 1/26/21 5:10 PM, Richard Purdie wrote:
 > Thanks, that is all good info. The biggest issue right now is we don't
 > record the kernel version information anywhere that our test results
 > processing is going to be able to find it. That isn't too hard to fix
 > but there are a few systems involved.
 >
 > I'm not sure when or who will have the time to make this happen but I
 > do like the idea and don't want it to get lost. I put an entry into our
 > bug/feature tracker:
 >
 > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14196

Great! Don't hesitate to write if you'd like to discuss something, and feel free to
join either one of the monthly "Automated Testing" conference calls,
or a weekly KernelCI call, if you'd like a quick high-bandwidth chat :)

Nick

On 1/26/21 5:10 PM, Richard Purdie wrote:
> On Thu, 2021-01-21 at 14:46 +0200, Nikolai Kondrashov wrote:
>> Hi Richard,
>>
>> On 1/21/21 1:01 PM, Richard Purdie wrote:
>>   > On Thu, 2021-01-21 at 12:07 +0200, Nikolai Kondrashov wrote:
>>   >> Please respond with corrections or suggestions of other CI systems to contact.
>>   >
>>   > I noticed Yocto Project isn't mentioned here but we do a lot of builds
>>   > of complete systems for multiple architectures and we include kernels
>>   > in those. We probably have two kernel versions under testing in any
>>   > given project release series.
>>   >
>>   > Would it be useful to get data from us? If so, what kind of data?
>>
>> Absolutely! Thanks for reaching out :)
>>
>>   > We're generally building linux-yocto from:
>>   > https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/
>>   > which is derived from upstream kernel releases as their baseline.
>>   >
>>   > Testing wise, we build them, then usually boot them under qemu with a
>>   > variety of userspaces. We also run ltp, some lsb and the tests from a
>>   > variety of projects like lttng.
>>   >
>>   > An example output report we use is:
>>   >
>>   > https://autobuilder.yocto.io/pub/non-release/20210120-9/testresults/testresult-report.txt
>>   >
>>   > So far I'd assumed you were interested in bleeding edge kernel CI but
>>   > if there is interest around general kernel testing of older kernels, we
>>   > do have a lot of data. There are some details we don't currently log
>>   > (e.g. which kernel version in in a given test target) but we can change
>>   > that if we need it.
>>
>> Wow, that's a lot of tests, very cool!
>>
>> We would definitely welcome reports for older kernel versions as well.
>> Any data helping track down issues is welcome.
>>
>> We could use build/test results, and logs.
>>
>> It would help if you could separate the upstream commit your branches are
>> based on and the patches you apply on top, and identify them separately.
>> However, it's OK if you can't, only mention the base version (e.g. using "git
>> describe"), and otherwise refer to your own repo and commits directly.
>>
>> In any case, that would be good enough for the start. We're still in research
>> stage (and will be for a while), trying to bring the data from various sources
>> together and do something with it.
>>
>> Our strategy is get the data first, organize later :)
>>
>> We would be glad to have you on board and sending whatever data you have.
>>
>> Please take a look at our Submission HOWTO for an overview of how things work:
>>
>>       https://github.com/kernelci/kcidb/blob/main/SUBMISSION_HOWTO.md
>>
>> If you'd like to try it out, I can send you credentials and parameters for
>> submitting to our "playground" instance. You can submit data there (either
>> manually or automatically) and experiment freely without worrying about
>> breaking anything. The data will appear on this dashboard (GKernelCI is
>> currently submitting there):
>>
>>       https://staging.kernelci.org:3000/d/home/home?var-dataset=playground_kernelci04
>>
>> Once you're confident with how things work, it would only take a permission
>> tweak on my side and one parameter change on your side to switch to
>> production.
>>
>> Don't hesitate to ping us on the maillist,
>> or on the freenode's #kernelci channel!
> 
> Thanks, that is all good info. The biggest issue right now is we don't
> record the kernel version information anywhere that our test results
> processing is going to be able to find it. That isn't too hard to fix
> but there are a few systems involved.
> 
> I'm not sure when or who will have the time to make this happen but I
> do like the idea and don't want it to get lost. I put an entry into our
> bug/feature tracker:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14196
> 
> Cheers,
> 
> Richard
> 

