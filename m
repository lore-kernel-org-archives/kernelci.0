MIME-Version: 1.0
References: <CAP245DXSaoGJ4STssCqa-Fr3eGE7Qu=BGGyNFgZnz+z0gAVXNw@mail.gmail.com>
 <CAH1_8nCuBHuGxgdPWWr0xLTXujeLv+S1obbdqqOJPZ45UZf8fg@mail.gmail.com>
 <CAP245DWZs+4MuSm4SEQLC==sk4F0K8NBMM-f_jc5pe9F8iszpA@mail.gmail.com>
 <CAH1_8nBoT9b3ZjZY=REestht6Z1W5hhA4YwOOvTGr-a19tA3cw@mail.gmail.com>
 <CAP245DWdaDFRX70YyZjtkPYhvWnRdYOHvFLT9HGDkYBJCgwRhg@mail.gmail.com> <CAH1_8nAjzQEBVTdQfO2ocHx8NN=oKffKGLyT5BdovSGnrM8evA@mail.gmail.com>
In-Reply-To: <CAH1_8nAjzQEBVTdQfO2ocHx8NN=oKffKGLyT5BdovSGnrM8evA@mail.gmail.com>
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Wed, 10 Jul 2019 17:01:26 +0530
Message-ID: <CAP245DUB_o=FzV5JMbYhqCngkcE05_aurenwQ4UFROw9N=sRyg@mail.gmail.com>
Subject: Re: New experimental branch for Linaro Qualcomm Landing Team
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: kernelci@groups.io, info <info@kernelci.org>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>

On Wed, Jul 10, 2019 at 4:25 PM Guillaume Tucker
<guillaume.tucker@gmail.com> wrote:
>
>
> On Tue, Jul 9, 2019 at 2:24 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>>
>> On Tue, Jul 9, 2019 at 6:32 PM Guillaume Tucker
>> <guillaume.tucker@gmail.com> wrote:
>> >
>> > On Tue, Jul 9, 2019 at 12:09 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>> >>
>> >> On Tue, Jul 9, 2019 at 4:27 PM Guillaume Tucker
>> >> <guillaume.tucker@gmail.com> wrote:
>> >> >
>> >> >
>> >> > On Tue, Jul 9, 2019 at 11:52 AM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>> >> >>
>> >> >> Hi,
>> >> >>
>> >> >> I'd like to request a new branch to be tracked by kernelci.org to
>> >> >> allow more experimental patches that could use much wider testing
>> >> >> across boards and architectures.
>> >> >>
>> >> >> We currently use our 'integration' branch[1] for this but that causes
>> >> >> disruption for people who depend on this branch to keep working.
>
>
> Ah sorry I missed the fact that the integration-linux-qcomlt
> branch was already built and tested on kernelci.org:
>
>   https://kernelci.org/job/qcom-lt/branch/integration-linux-qcomlt/
>
> and it seems to be updated roughly once a week.
>
>> >> >> This experimental branch shouldn't see too many updates and would
>> >> >> likely only be used to get better testing for experimental series.
>> >> >> Would you be ok to pick up such a branch[2] into kernelci?
>> >> >
>> >> >
>> >> > The links you've provided don't seem to work, the page says
>> >> > "No repositories found".
>> >>
>> >> Curious. Either I missed a space between the URL and branch name or
>> >> gmail seems to have combined them in the link. Try
>> >> https://git.linaro.org/landing-teams/working/qualcomm/kernel.git
>> >
>> >
>> > Oh I see, there was a space between the URL and the branch name.
>> > Yeah I guess that got mangled somewhere, that link works for me.
>> >
>> >>
>> >> > Generally speaking I would say it's fine, as long as these aren't
>> >> > downstream branches but experimental patches that are based on
>> >> > current mainline and intended to be merged upstream.
>> >>
>> >> No, these will certainly be mainline-based branches.
>> >
>> >
>> > Great, so yes these look like relevant branches to test on
>> > kernelci.org.  Which configurations do you need to build?  The
>> > full range means about 230 builds but if you only care about arm,
>> > arm64 and x86_64 with just the defconfigs and maybe some qcom arm
>> > defconfigs that should come down to a much smaller number.
>> >
>> > Doing fewer builds means faster turnaround between when you push
>> > a change and when you get the results, and makes it possible to
>> > have more development trees for a given build capacity.
>>
>> As mentioned earlier, I expect this branch to be used occassionally.
>> IOW, we won't use it in an automated merge + CI loop. We want to use
>> it to test instrusive features that might break on other
>> platforms/architectures/configuration.
>>
>> So if it isn't too a huge stress on resources, I'd prefer this branch
>> to be exposed to the full range of kernelci builds and boot testing.
>
>
> Right, this was mentioned during the weekly meeting yesterday and
> yes we can add it on the basis that it doesn't get updated very
> often.
>
> For developer trees like this one, I think the amount of builds
> should be kept to a lower number than the main trees such as
> mainline, next, stable, maintainers...  So if it's important to
> build all the defconfigs, there should be a limit on how often it
> gets built.  We don't have the ability to regulate this at the
> moment, so please avoid pushing to these branches more than once
> a week and it'll be fine.
>
> I've made a PR to add this branch:
>
>   https://github.com/kernelci/kernelci-core/pull/119

Thanks Guillame.

I will let the rest of the team know about using this branch only to
test potentially unstable changes that would benefit from wider
testing.

Regards,
Amit
