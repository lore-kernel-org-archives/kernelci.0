Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 12 Apr 2021 21:54:08 -0500
From: "Bjorn Andersson" <bjorn.andersson@linaro.org>
Subject: Re: KernelCI backend redesign and generic lab support
Message-ID: <20210413025408.GJ1538589@yoga>
References: <a78c7329-36dd-185e-5c3e-ec90686ad7d3@collabora.com>
MIME-Version: 1.0
In-Reply-To: <a78c7329-36dd-185e-5c3e-ec90686ad7d3@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, guillaume.tucker@collabora.com
Cc: Micha?? Ga??ka <michal.galka@collabora.com>, ticotimo@gmail.com, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, Michael Grzeschik <m.grzeschik@pengutronix.de>, santiago.esteban@microchip.com, Jan L?bbe <j.luebbe@pengutronix.de>, automated-testing@lists.yoctoproject.org

On Fri 05 Mar 14:55 CST 2021, Guillaume Tucker wrote:

> Hello,
> 

Hi Guillaume,

Sorry for taking the time to give you some feedback on this.

> As it has been mentioned multiple times recently, the
> kernelci-backend code is ageing pretty badly: it's doing too
> many things so it's hard to maintain, there are better ways to
> implement a backend now with less code, and it's still Python
> 2.7.  Also, there is a need to better support non-LAVA labs such
> as Labgrid.  Finally, in order to really implement a modular
> KernelCI pipeline, we need a good messaging system to
> orchestrate the different components - which is similar to
> having a generic way to notify labs about tests to run.  For all
> these reasons, it's now time to seriously consider how we should
> replace it with a better architecture.
> 
> I've gathered some ideas in this email regarding how we might go
> about doing that.  It seems like there are several people
> motivated to help on different aspects of the work, so it would
> be really great to organise this as a community development
> effort.
> 
> Please feel free to share your thoughts about any of the points
> below, and tell whether you're interested to take part in any of
> it.  If there appears to be enough interest, we should schedule
> a meeting to kick-start this in a couple of weeks or so.
> 
> 
> * Design ideas
> 
>   * REST API to submit / retrieve data
>     * same idea as existing one but simplified implementation using jsonschema
>     * auth tokens but if possible using existing frameworks to simplify code
> 
>   * interface to database
>     * same idea as now but with better models implementation
> 
>   * pub/sub mechanism to coordinate pipeline with events
>     * new feature, framework to be decided (Cloud Events? Autobahn?)
>     * no logic in backend, only messages
>     * send notifications when things get added in database

My current approach for lab-bjorn is to poll the REST api from time to
time for builds that matches some search criteria relevant for my boards
and submit these builds to a RabbitMQ "topic" exchange. Then I have
individual jobs per board that consumes these builds, run tests and
submits test results in a queue, which finally is consumed by a thing
that reports back using the REST api.

The scraper in the beginning works, but replacing it with a subscriber
model would feel like a better design. Perhaps RabbitMQ is too low
level? But the model would be nice to have.

> 
> 
> * Client side
> 
>   Some features currently in kernelci-backend should be moved to client side
>   and rely on the pub/sub and API instead:
> 
>   * LAVA callback handling (receive from LAVA, push via API)
>   * log parsing (subscribe to events, get log when notified, send results)

Since I moved to the REST api for reporting, instead of faking a LAVA
instance, I lost a few details - such as the LAVA parser generating html
logs. Nothing serious, but unifying the interface here would be good.

Regards,
Bjorn
