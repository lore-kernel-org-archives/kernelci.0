Subject: Re: [kernelci] Bisection email recipients
References: <419a4e9b-4b03-d717-688b-bbc409369a97@collabora.com>
From: "Tomeu Vizoso" <tomeu.vizoso@collabora.com>
Message-ID: <a69dc0ac-2108-ab30-ab50-2d27b5378fa6@collabora.com>
Date: Wed, 31 Oct 2018 08:37:13 +0100
MIME-Version: 1.0
In-Reply-To: <419a4e9b-4b03-d717-688b-bbc409369a97@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

On 10/30/18 6:08 PM, Guillaume Tucker wrote:
> As you know, we're now running automated bisections for all boot
> regressions found in mainline and stable trees.  The email reports
> are currently only sent to a fixed list of recipients who manually
> check them and report the result as needed.  As it turns out, there
> haven't been any real false positives[1] thanks to the checks
> (verify breaking commit, then revert in-place).  Some lab issues
> can mislead bisections but the odds for all the checks to pass with
> a false positive are really low, and I've got a task to better
> handle infrastructure errors in the bisection job to further reduce
> that.
> 
> So unless anyone disagrees, I think it's now mature enough to start
> sending the report automatically to some relevant recipients.  I
> would first add a paragraph to give some context regarding the
> automated bisection so when people receive one out of the blue they
> get a clue as to where this is coming from.  I'll make a PR to
> update the template for this.
> 
> Here's a list of potential recipients that could be automatically
> added, using the "breaking" commit found and other metadata:
> 
> * author of the commit
> * committer
> * Signed-off-by
> * Acked-by
> * Reported-by
> * mailing list associated with the tree (like for test reports)
> * maintainers of the parts of the code touched (using
>    scripts/get_maintainer.pl and diff stat)
> * kernel-build-reports@lists.linaro.org
> * as well as a fixed list of recipients configured in Jenkins like
>    we already do now
> 
> It would also be good to send the report as a reply to either the
> boot report showing the regression, or the original patch on a
> mailing list if that can be found in the archives.  I'll see if it
> can be done easily to directly do this as well as enabling more
> recipients.
> 
> I also think it would be worth sending an email to the stable
> mailing list, and probably also lkml to explain what we're doing
> and warn people that we're turning this on.
> 
> Please let me know your thoughts; I'm planning to start working on
> it this week and have a first version to try out and review for
> next week.

Hi Guillaume,

I think that regardless of how well it's working already, it could make 
sense to increase the list of recipients incrementally, starting with 
those most likely to appreciate the email, and growing towards those less 
likely. Maybe I'm being overly cautious, but from past experiences I 
don't think we want to risk too much antagonizing people.

Once we have a feeling that the recipients in a stage are happy with 
getting the emails, we can expand to other recipients in the next stage.

So, to illustrate the point, we could start with the author and 
kernel-build-reports@lists.linaro.org, then include ackers, reviewers, 
reporter and sobers, then mailing lists.

Hope that makes sense.

Cheers,

Tomeu
