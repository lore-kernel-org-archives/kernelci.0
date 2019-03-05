Return-Path: <dan.rue@linaro.org>
Date: Tue, 5 Mar 2019 16:04:39 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Re: Hourly, daily, weekly monitoring
Message-ID: <20190305220439.bzmsdtpd5gvrr3t6@xps.therub.org>
References: <1eb2fcf9-d08b-0d38-9aee-c0206089b5d7@collabora.com>
 <20190305121412.GA7513@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20190305121412.GA7513@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, broonie@kernel.org
Cc: guillaume.tucker@gmail.com, Linus Walleij <linus.walleij@linaro.org>

On Tue, Mar 05, 2019 at 12:14:12PM +0000, Mark Brown wrote:
> On Mon, Mar 04, 2019 at 01:20:25PM +0000, Guillaume Tucker wrote:
> 
> > I'm not entirely sure how much flexibility Jenkins can offer in
> > that respect, but at least having 3 versions of the monitor job
> > that runs every hour, every day and every week should cover all
> > the cases.  If possible, we may be able to implement something
> > that dynamically schedules the next check for each branch.
> 
> One big concern I have with this is latency.  One of the common cases
> where people don't need builds all the time is when they're mainly
> looking for checks before they submit pull requests.  For those if you
> might have to wait almost a day before we even queue the build it might
> be a bit of an issue.  If it was just a "skip this tree if we built it
> in the past X time" check that wouldn't be such an issue, it's just if
> the daily check runs at some fixed time each day or whatever that it
> might add huge extra latency.
> 
> Another idea I just thought of but I'm not sure is practical would be to
> only check some trees if the Jenkins queue is less than some number of
> builds - that way if we're busy we won't add extra load, but it feels
> like it's more trouble than it's worth to implement fairly.

That's a good point.

I wonder what happens when something doesn't fit in a
hourly/daily/weekly box. It could also cause a daily/weekly bottleneck
if they're all scheduled at the same time.

Perhaps each tree gets a cooling off period defined in e.g. seconds, and
it could be defaulted to current behavior of 1 hour. If a tree is
triggered but its cooling off period hasn't passed, the trigger is
either ignored or deferred. This would also let us increase the
frequency of the build trigger to something like every 5 minutes.

This way, load is evened out a bit (no spikes when 'weekly' or even
'hourly' runs), kernelci is more realtime (to Mark's point), and
configuration is granular and per-tree (we can still offer standard
cool-off periods, of course).

The only state that has to be tracked is the time of the last build per
tree, though I have no idea about the ease of implementation.

Dan
