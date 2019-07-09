MIME-Version: 1.0
References: <CAP245DXSaoGJ4STssCqa-Fr3eGE7Qu=BGGyNFgZnz+z0gAVXNw@mail.gmail.com>
 <CAH1_8nCuBHuGxgdPWWr0xLTXujeLv+S1obbdqqOJPZ45UZf8fg@mail.gmail.com>
In-Reply-To: <CAH1_8nCuBHuGxgdPWWr0xLTXujeLv+S1obbdqqOJPZ45UZf8fg@mail.gmail.com>
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Tue, 9 Jul 2019 16:39:05 +0530
Message-ID: <CAP245DWZs+4MuSm4SEQLC==sk4F0K8NBMM-f_jc5pe9F8iszpA@mail.gmail.com>
Subject: Re: New experimental branch for Linaro Qualcomm Landing Team
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: kernelci@groups.io, info <info@kernelci.org>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>

On Tue, Jul 9, 2019 at 4:27 PM Guillaume Tucker
<guillaume.tucker@gmail.com> wrote:
>
>
> On Tue, Jul 9, 2019 at 11:52 AM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>>
>> Hi,
>>
>> I'd like to request a new branch to be tracked by kernelci.org to
>> allow more experimental patches that could use much wider testing
>> across boards and architectures.
>>
>> We currently use our 'integration' branch[1] for this but that causes
>> disruption for people who depend on this branch to keep working.
>>
>> This experimental branch shouldn't see too many updates and would
>> likely only be used to get better testing for experimental series.
>> Would you be ok to pick up such a branch[2] into kernelci?
>
>
> The links you've provided don't seem to work, the page says
> "No repositories found".

Curious. Either I missed a space between the URL and branch name or
gmail seems to have combined them in the link. Try
https://git.linaro.org/landing-teams/working/qualcomm/kernel.git

> Generally speaking I would say it's fine, as long as these aren't
> downstream branches but experimental patches that are based on
> current mainline and intended to be merged upstream.

No, these will certainly be mainline-based branches.

Regards,
Amit
