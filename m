MIME-Version: 1.0
References: <20181026151956.GG2015@sasha-vm> <CAH1_8nAAAw+2yunnWtet=OreRtD_u3M_Su3S7Dnd+2suypfczQ@mail.gmail.com>
In-Reply-To: <CAH1_8nAAAw+2yunnWtet=OreRtD_u3M_Su3S7Dnd+2suypfczQ@mail.gmail.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Date: Mon, 29 Oct 2018 08:35:34 -0700
Message-ID: <CAOi56cUp1TL126gFmP9Aw84EASMNd=Yt1xiQ8N7WiNf_oNQh-g@mail.gmail.com>
Subject: Re: [kernelci] branch inclusion request
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

On Fri, Oct 26, 2018 at 9:35 AM Guillaume Tucker
<guillaume.tucker@gmail.com> wrote:
>
> Hi Sasha,
>
> On Fri, Oct 26, 2018 at 5:08 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> Hi all,
>>
>> Right now I'm pushing stable patches to Greg for his weekly releases,
>> and for those branches I only do basic cross-compilation and no
>> boot/functional testing at all.
>>
>> I'd like to modify my process to rely on KernelCI testing instead. This
>> means I'd like to include my branches (one for each stable kernel) into
>> the build system.
>>
>> These branches get pushed a few times per week, and sometimes a few
>> times a day, so this will generate a fair amount of builds. OTOH, I
>> don't really need to keep the build results for too long as I try to
>> address any issues that come up the same day.
>
>
> This sounds like a good idea in principle, but what is the actual
> gain given the extra load it would take to build and test all
> these branches?
>
> Of course it's very important to test stable releases, but they
> typically show very few build or test failures and there is
> already stable-rc to catch any of these.  It seems to me that
> development branches are where extra testing efforts would be
> required the most, to catch issues earlier.
>
> If adding your stable branches to KernelCI would save you a lot
> of manual effort, then yes I guess that would probably be a good
> reason.  If you'll still be doing the same manual builds and
> checks before pushing your branches, then I'm not really sure
> it's worth adding them to KernelCI as it currently stands.
>
> Let's see what others think the priorities should be wrt adding
> more branches.

IMO, since we're trying to make stable rock solid, this is a good
addition.  Also, since Sasha is also helping with build horsepower, I
think we should add these trees.

Kevin
