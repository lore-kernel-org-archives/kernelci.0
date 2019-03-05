Return-Path: <dan.rue@linaro.org>
Date: Tue, 5 Mar 2019 11:04:26 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Re: staging projects in github
Message-ID: <20190305170426.4kuzc4fq7fmvoeud@xps.therub.org>
References: <7himwxvr6m.fsf@baylibre.com>
 <CAH+k93EBGwnAbwvCDF3PmaCvS+Fpk6FTVtgdB37h-twqZf4hvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH+k93EBGwnAbwvCDF3PmaCvS+Fpk6FTVtgdB37h-twqZf4hvQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, matthew.hart@linaro.org
Cc: Kevin Hilman <khilman@baylibre.com>

On Tue, Mar 05, 2019 at 04:48:52PM +0000, Matt Hart wrote:
> On Tue, 5 Mar 2019 at 05:14, Kevin Hilman <khilman@baylibre.com> wrote:
> >
> > Can we consolidate the various "-staging" project in github with the
> > originals?  I've never fully understood why we created separate github
> > projects, when we should just be using a staging branch within the main
> > project.
> 
> I *think* it was because you couldnt make a pull request against a branch,
> however I think you can now set the default branch for PR on a project.
> As long as that works, I'm all for it.

I'm not sure if I'm considering all of the use-cases, but in the past
I've much preferred having staging == "master" and then tagging for
production releases. This does make it difficult (but not impossible) to
have things in staging that are not promoted to production.

As a user of kernelci, it does seem quite slow to get changes included
into staging, and then also to wait for them get into production. I'm
really interested in anything we can do to improve this turnaround time.

Dan

> 
> >
> > I've seen this come up a couple times now in causing confusion with new
> > developers.
> >
> > Thanks,
> >
> > Kevin
> >
> >
> > 
> >
> 
> 
> 
