Return-Path: <frowand.list@gmail.com>
Subject: Re: KernelCI Community Survey
From: Frank Rowand <frowand.list@gmail.com>
References: <4e70209b-e637-abdf-d72a-7cb978956f9d@collabora.com>
 <d03548cc-86ee-4922-7819-9a22acc055ee@collabora.com>
 <c19726e0-0483-c718-2d33-e7ac9c88cb19@collabora.com>
 <f464f853-246b-2eac-03be-91385e5457e3@gmail.com>
Message-ID: <48ebf569-3113-2497-04be-54de5318b8ea@gmail.com>
Date: Mon, 13 Jul 2020 13:13:47 -0500
MIME-Version: 1.0
In-Reply-To: <f464f853-246b-2eac-03be-91385e5457e3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>, kernelci@groups.io, automated-testing@lists.yoctoproject.org, kernel-build-reports@lists.linaro.org, workflows@vger.kernel.org

On 2020-07-13 12:49, Frank Rowand wrote:
> On 2020-07-09 17:32, Guillaume Tucker wrote:
>> On 11/06/2020 11:11, Guillaume Tucker wrote:
>>> + workflows
>>>
>>> On 02/06/2020 22:22, Guillaume Tucker wrote:
>>>> As the KernelCI project keeps growing, we need to know a bit
>>>> better what the Linux kernel community needs in terms of
>>>> automated testing.  We would really appreciate if you could
>>>> please spare one minute to fill this survey form:
>>>
>>> Sending out a big Thank You for all the replies we have received
>>> already, your input is proving to be highly valuable.  We thought
>>> it would also be relevant to share this on the workflows mailing
>>> list and reach a slightly broader audience while the survey is
>>> still open.
>>>
>>>>   https://forms.gle/Y5iuyLXgQr2y3SrF6
>>>
>>> Please feel free to fill the form if you haven't done so already
>>> and share the link above with others you think might be
>>> interested.
>>
>> Thanks again everyone who has responded to the survey.  Here's
>> the detailed report which also includes a spreadsheet with the
>> full results (minus any personal information):
>>
>>   https://foundation.kernelci.org/blog/2020/07/09/kernelci-community-survey-report/
>>
>> Please also note that we've decided to re-open the form until the
>> end of August, in case some of you missed the opportunity to
>> respond before.  The link is the same as in my previous email:
>>
>>   https://forms.gle/Y5iuyLXgQr2y3SrF6
>>
>> Best wishes,
>> Guillaume
>>
> 
> 
> Some feedback from my experience answering the survey today.

I did not want to influence my survey answers by reading the report
before answering.

Now that I have read the report, some feedback on the report.

For "Response Time", the report mentions that bisections "sometimes
take a few hours to complete", and also mentioned "having quick
results is also needed for some use-cases".  One possible way to
provide quick results _and_ perform a longer bisect would be to
send a preliminary "error detected" report email, with the email
noting that the bisection has not been completed yet, and that a
fuller error report will be provided once the bisection completes.

The quick warning would both make me more cautious about accepting
a patch too quickly and encourage me to look more carefully at the
patch if I had already reviewed it and not found any issues.

The report seems to report "Automated Testing" differently than I
interpreted the question.  I answered "no" to whether I use any
CI test system because I don't directly interact with the automated
CI test systems (I just receive error messages when my patches
have an error, and also see error reports for other people's
patches when those emails are to a mail list).  However, I do my
own automated testing when I receive patches.  So my answer was
not properly accounted for in the first sentence of the "Automated
Testing" section of the report that says "It seems that maintainers
are doing more automated testing and find more bugs than developers."
(I answered the survey as a maintainer.  It probably would be useful
to answer the survey once for each of my roles - so once as a developer
and once as a maintainer.)

Another comment on the second paragraph of "Automated Testing", one
issue mentioned is that "if issues that regularly take that time to
get discovered it's more likely to be due to the lack of early test
coverage ...".  In my experience, bugs found after a delay are often
due to running the tests on different boards, different architectures,
with different configurations, etc.  I'm not sure if that is what was
meant by "coverage" in the sentence I quoted.

-Frank

> 
> Question "Would a web-based dashboard fit well within your workflow?"
> had two answers.  The answers to choose from made assumptions about
> why one would choose "yes" or "no".  The second answer is "No thanks,
> I only want to work with emails and command line tools."  The second
> answer does not allow me say that I have a preference for emails
> and command line tools, but I find a web based interface to also
> provide value.
> 
> It would be better to split the original question into two questions:
>   (1) web-based dashboard useful? (yes/no)
>   (2) emails and command line tools useful? (yes/no)
> And it would probably be even better to split (2) into (2) emails,
> and (3) command line tools.
> 
> I wanted to answer yes to each of them, but if only one was available
> then I had a preference, which is what my answer was based on.
> 
> Then the question "Would you want to be able to access an API with
> raw test data?" again put intent into the "no" answer.  The answers
> should have been
>   (1) yes
>   (2) no
> 
> If you wanted to explore further, a second question would be:
> "Do I want to design my own CI tools that access the raw test
> data via an API?".
> 

