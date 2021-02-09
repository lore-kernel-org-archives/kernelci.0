Subject: Re: #KCIDB: Adding support for log excerpts #KCIDB
References: <7b699a23-cf7d-be05-8d36-f8fd33af8416@redhat.com>
 <20210209150601.GH8355@e120937-lin>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <1d5f2143-6dea-aa32-6812-3e99880ffe58@redhat.com>
Date: Tue, 9 Feb 2021 18:51:07 +0200
MIME-Version: 1.0
In-Reply-To: <20210209150601.GH8355@e120937-lin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, cristian.marussi@arm.com
Cc: Tim Bird <Tim.Bird@sony.com>, Dmitry Vyukov <dvyukov@google.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Alice Ferrazzi <alicef@gentoo.org>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>, Dan Rue <dan.rue@linaro.org>

Hi Cristian,

On 2/9/21 5:06 PM, Cristian Marussi wrote:
> On Tue, Feb 09, 2021 at 02:56:48PM +0200, Nikolai Kondrashov via groups.io wrote:
>> We'd like to introduce support for optional "log_excerpt" field for "checkouts"
>> ("revisions" previously) and "builds".
>>
>> Please don't hesitate to respond with any comments, objections, or
>> suggestions.
>>
>   Nice feature, is there any chance this could be optionally used also
>   with single tests, so that you can provide a snippet (even capped smaller
>   than 16kb in that case) of the failing testcase if available ?
>   ( not that I have at the moment on my side the backend ready to produce
>   such snippets ... so I'm not saying I'll just onto it immediately :D ..
>   but it was a possibility)

Yes, I was also thinking about that, and wanted to introduce that in another
message/PR just to keep things focused and less confusing.

I think this would also be useful to at least 0-Day, as they don't offer logs
for download at all, and do run some tests, IIRC.

Some tests can produce multiple output files, so we'd have to define such
"log_url"/"log_excerpt" fields as pointing to the "main" log and define *that*
somehow.

I'll add that to my queue for the next release, as it's easy to do.

Nick

