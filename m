Return-Path: <frowand.list@gmail.com>
Subject: Re: KernelCI Community Survey
References: <4e70209b-e637-abdf-d72a-7cb978956f9d@collabora.com>
 <d03548cc-86ee-4922-7819-9a22acc055ee@collabora.com>
 <c19726e0-0483-c718-2d33-e7ac9c88cb19@collabora.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <f464f853-246b-2eac-03be-91385e5457e3@gmail.com>
Date: Mon, 13 Jul 2020 12:49:30 -0500
MIME-Version: 1.0
In-Reply-To: <c19726e0-0483-c718-2d33-e7ac9c88cb19@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>, kernelci@groups.io, automated-testing@lists.yoctoproject.org, kernel-build-reports@lists.linaro.org, workflows@vger.kernel.org

On 2020-07-09 17:32, Guillaume Tucker wrote:
> On 11/06/2020 11:11, Guillaume Tucker wrote:
>> + workflows
>>
>> On 02/06/2020 22:22, Guillaume Tucker wrote:
>>> As the KernelCI project keeps growing, we need to know a bit
>>> better what the Linux kernel community needs in terms of
>>> automated testing.  We would really appreciate if you could
>>> please spare one minute to fill this survey form:
>>
>> Sending out a big Thank You for all the replies we have received
>> already, your input is proving to be highly valuable.  We thought
>> it would also be relevant to share this on the workflows mailing
>> list and reach a slightly broader audience while the survey is
>> still open.
>>
>>>   https://forms.gle/Y5iuyLXgQr2y3SrF6
>>
>> Please feel free to fill the form if you haven't done so already
>> and share the link above with others you think might be
>> interested.
> 
> Thanks again everyone who has responded to the survey.  Here's
> the detailed report which also includes a spreadsheet with the
> full results (minus any personal information):
> 
>   https://foundation.kernelci.org/blog/2020/07/09/kernelci-community-survey-report/
> 
> Please also note that we've decided to re-open the form until the
> end of August, in case some of you missed the opportunity to
> respond before.  The link is the same as in my previous email:
> 
>   https://forms.gle/Y5iuyLXgQr2y3SrF6
> 
> Best wishes,
> Guillaume
> 


Some feedback from my experience answering the survey today.

Question "Would a web-based dashboard fit well within your workflow?"
had two answers.  The answers to choose from made assumptions about
why one would choose "yes" or "no".  The second answer is "No thanks,
I only want to work with emails and command line tools."  The second
answer does not allow me say that I have a preference for emails
and command line tools, but I find a web based interface to also
provide value.

It would be better to split the original question into two questions:
  (1) web-based dashboard useful? (yes/no)
  (2) emails and command line tools useful? (yes/no)
And it would probably be even better to split (2) into (2) emails,
and (3) command line tools.

I wanted to answer yes to each of them, but if only one was available
then I had a preference, which is what my answer was based on.

Then the question "Would you want to be able to access an API with
raw test data?" again put intent into the "no" answer.  The answers
should have been
  (1) yes
  (2) no

If you wanted to explore further, a second question would be:
"Do I want to design my own CI tools that access the raw test
data via an API?".
