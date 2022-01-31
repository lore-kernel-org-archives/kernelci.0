Return-Path: <spbnick@gmail.com>
Message-ID: <459c3f1d-c5a6-aa3e-a09f-1dea19df106c@gmail.com>
Date: Mon, 31 Jan 2022 12:30:12 +0200
MIME-Version: 1.0
Subject: Re: Testing done for linux.git:for-next/fixes@arm64-fixes-13150-g1e0924bd0991
References: <61ef655a.1c69fb81.a2d7f.0cba@mx.google.com>
 <YfQ9ZIj7MoF4Mvrj@sirena.org.uk>
From: "Nikolai Kondrashov" <spbnick@gmail.com>
In-Reply-To: <YfQ9ZIj7MoF4Mvrj@sirena.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>, maryam.m.yusuf1802@gmail.com
Cc: kernelci-results-staging@groups.io, kernelci@groups.io

Hi Mark,

Thanks a lot for your feedback, we desperately need it :)
Please see my responses below.

On 1/28/22 21:00, Mark Brown wrote:
> On Mon, Jan 24, 2022 at 06:50:02PM -0800, bot@kernelci.org wrote:
>> Below is the summary of results Kernel CI database has recorded
>> for this revision so far. See complete and up-to-date report at:
> 
> Overall I think this is pretty good.  A couple of fairly minor things I
> can think looking at it:
> 
>> OVERVIEW
> 
>>          Builds: ❌ FAIL
> 
> It might be good to rather than just have the pass/fail include the
> counts in the overview section.  eg,
> 
> | OVERVIEW
> 
> |        Builds: ❌ 8  ✅ 10
> 
> since it doesn't take any more vertical space and is a bit more detail
> for how good/bad things are.

Hmm, yeah, this could be a good idea, even though it could make the output a 
little busier. It could help to get a feel for how well/poor the revision 
fared, and for now that's all we can offer.

If we get the "known issues" going, or some other way of automatically dealing 
with all the failures, we might be able to return to a single emoji for the 
summary, since it will be closer to the truth.

>> BUILDS
>>
>>      Status
>>                 ❌ 8  ✅ 10
>>      Architectures
>>          arm64  ❌ 8  ✅ 10
>>      Failures
>>          ❌ 4  arm64 allyesconfig+
>>          ❌ 4  arm64 allmodconfig+
>>      By
>>          tuxsuite
> 
> A couple of things here:
> 
>   - It's collapsed multiple builds into a single line (it looks like it
>     chopped off extra configs that were added with the +).  Similar thing
>     looks to be happening if I click through to the web dashboard so that
>     could be an issue in the submitted data?

Those config names are intact, and as supplied by the submitter.

We don't have the configuration names standardized yet, and tuxsuite is adding 
"+" to signify a base config with modifications. I.e. the two configs above 
are "allyesconfig" with some stuff on top, and "allmodconfig" with some stuff 
on top.

You can say that it worked in a way, in that you recognized that these had 
some modification, perhaps because it's similar to the way KernelCI works, but 
yeah, we will have to define this better.

>   - Like I wes saying on the call there's no detail on the specific
>     errors anywhere in the mail.  Like I was saying on the call on
>     Tuesday I'm not actually sure if that's desirable or not since once
>     you get too many errors showing up it gets unweildy.

Yes, we'll have to weed them out first, and perhaps find a way to extract a 
few most common errors from the logs, before we can have anything useful in 
the emails.

> It's hard to do in the text version but one thing the old KernelCI build
> reports had which was handy in the HTML version of the mails was that
> individual results in lists like this (eg, the "defconfig" or whatever)
> were deep links to the relevant pages on the web site.  I wonder if the
> empty space to the right hand side could have something similar here?
> Though it might make the result too busy so it's hard to tell if that'd
> actually be good.

We can do that in theory, if we have a URL shortener. We can run one somewhere 
in the Google Cloud and e.g. automatically replace all the long links in our 
reports. Then links on the right won't be so overwhelming.

Otherwise, I think careful use of HTML features like links could be very 
beneficial indeed. I have one issue opened with some ideas here: 
https://github.com/kernelci/kcidb/issues/253

BTW, we're already sending both the text and the HTML version to force 
fixed-width fonts for our reports in e.g. groups.io and GMail.

>> See complete and up-to-date report at:
> 
>>      https://kcidb.kernelci.org/d/revision/revision?orgId=1&var-git_commit_hash=1e0924bd09916fab795fc2a21ec1d148f24299fd&var-patchset_hash=
> 
> Perhaps an "including full logs" or something in the text?  Though I
> can't see any on the dashboard (again, could be an issue with what went
> into the DB) so it might be false advertising.

The logs are there most of the time. The link might be non-obvious, though. 
There's a little panel called "Log" to the left of the "Status" status panel 
on each build page. If we have the log, it will have the "File" link there.

E.g. see here:
https://kcidb.kernelci.org/d/build/build?orgId=1&var-dataset=kcidb_01&var-origin=All&var-build_architecture=All&var-build_config_name=All&var-id=tuxsuite:24AOhst3uQ5uG4LsmePR7bvDc5R

Or here:
https://kcidb.kernelci.org/d/build/build?orgId=1&var-dataset=kcidb_01&var-origin=All&var-build_architecture=All&var-build_config_name=All&var-id=tuxsuite:24AOhst3uQ5uG4LsmePR7bvDc5R

Otherwise, yeah, we don't have a requirement of sending logs yet, let alone 
sending full logs. E.g. GKernelCI doesn't send any, tuxsuite seems to send 
excerpts, and so on, so we can't really say you'll find complete logs there, yet.

Nick
