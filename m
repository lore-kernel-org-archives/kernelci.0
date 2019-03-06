MIME-Version: 1.0
References: <CAHRSSEzE-foFJaS4mmaosksXofwg8TaK=6ro8HFPGMV_d6=8sg@mail.gmail.com>
 <CABXOdTerkt85X856TDx9RGEymxm6yrqkkbyPUssJJp8Sm37J2A@mail.gmail.com> <CAH1_8nAkms+ioW2EJNo8=f+5d=tF3fQZRAsd1-mofvaiRYzXfA@mail.gmail.com>
In-Reply-To: <CAH1_8nAkms+ioW2EJNo8=f+5d=tF3fQZRAsd1-mofvaiRYzXfA@mail.gmail.com>
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Wed, 6 Mar 2019 16:48:12 +0000
Message-ID: <CAH+k93G-3oPZJO+k8Rt-mPym51vXzaxNE-gRu8-p-=ZnqZhvbA@mail.gmail.com>
Subject: Re: branches not building?
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: Guenter Roeck <groeck@google.com>, info@kernelci.org

On Wed, 6 Mar 2019 at 15:54, Guillaume Tucker
<guillaume.tucker@gmail.com> wrote:
>
>
>
> On Tue, Mar 5, 2019 at 5:06 PM Guenter Roeck via Groups.Io <groeck=google.com@groups.io> wrote:
>>
>> https://kernelci.org/job/ suggests that there have been several builds since yesterday. Maybe the build system was busy.
>>
>> Guenter
>>
>> On Tue, Mar 5, 2019 at 8:49 AM 'Todd Kjos' via info <info@kernelci.org> wrote:
>>>
>>> A bunch of our Android branches were modified yesterday, but there were no kernelci builds... are they no longer being tested? Here's a list of branches that had changes yesterday and haven't been built:
>>>
>>> android-3.18-o-release
>>> android-3.18-o-mr1
>>> android-4.4-o-release
>>> android-4.4-o-mr1
>>> android-4.4-p-release
>>> android-4.9-o-release
>>> android-4.9-o-mr1
>>> android-4.9-p-release
>>> android-4.14-p-release
>>>
>>> They were changed at about 4pm PST yesterday (~16 hours ago) which is normally plenty of time to get kernelci results...
>
>
> Err, I think these release branches might have been lost in
> translation during the move from Jenkins Matrix job configuration
> to the new YAML-based configuration.  I don't see them in the
> file:
>
>   https://github.com/kernelci/kernelci-core/blob/5b8b00504e930d13645162a6e308e4ba0b1f0c51/build-configs.yaml#L188

So from my email history I see that most of those were supposed to
have been re-enabled in october 2018 but looks like they weren't, and
so were forgotten in the changes to YAML configs.
I can fix that with a PR as needed.

>
> Can you confirm you still don't have the build results you
> expected?  In which case I can make a pull request to add them.
> I have to say that's quite a large number of downstream branches
> though...

I am expecting to move the GCE builders from staging (that are currently
only doing clang) over to production (to join the normal build pools) as
soon as my PR to move clang to production is finished.

In any case, I've got access to spin up more GCE builders as needed
so if we add these trees and the queue is growing, I can add capacity in
short order.

>
> Guillaume
>
> 
