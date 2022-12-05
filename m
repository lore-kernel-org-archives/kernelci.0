Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6767C
	for <kernelci@lists.linux.dev>; Mon,  5 Dec 2022 08:23:08 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:d901:c525:a85f:2da3] (unknown [IPv6:2001:861:4a40:8620:d901:c525:a85f:2da3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5703C6601DEB;
	Mon,  5 Dec 2022 08:22:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670228579;
	bh=lDS5Xuzg5fsI4zw/h5ahGrZtLdnE/dXhDQQqEufsQII=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=SMjmOWUcBm5CtPLi0mPE3Qv9dloHXG15A52mo53COL1HEay17fFos9YkTBMsk/qzr
	 tupPVzL/OkVgSW7FWZQZtWM4iuBtGqw7DSkbvoN6qg9d3PWvQRXGGxrApFcTfrXOUK
	 /mTfE+Kll2WSvmUQTuQvVNNhg+iZsJ9ceA0724vkH4hr4HKkQSI4TeQ6PKs0S9YQuU
	 Q1S65iXCBF2sI8fCTCv0b7aX2Rx5QpWwM/Nwoa2g7Kt98G0bOd5Wc1zTIZhg8KJ85w
	 VQ1jkFifh1lO73+bjHQHtXRwNiGOJ/1u58cchq21NZr6iEt3X2J053TUByIrY+KJpY
	 VHMkxkEkEz8zg==
Message-ID: <6cac8790-c82b-de34-c4c3-3c0ef45ea05d@collabora.com>
Date: Mon, 5 Dec 2022 09:23:28 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: KernelCI API Roadmap
Content-Language: en-US
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: automated-testing@lists.yoctoproject.org, kernelci@lists.linux.dev
Cc: kernelci-members <kernelci-members@groups.io>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 =?UTF-8?Q?Jan_L=c3=bcbbe?= <j.luebbe@pengutronix.de>,
 santiago.esteban@microchip.com, ticotimo@gmail.com,
 "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>
References: <b3e0fe1d-e352-5caa-71bd-7018c821f088@collabora.com>
In-Reply-To: <b3e0fe1d-e352-5caa-71bd-7018c821f088@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

Please see below a follow-up from last year's email which
featured an initial roadmap as the outcome of the preliminary
design discussions.

On 02/11/2021 12:36, Guillaume Tucker wrote:
> For some background on this topic, please see the early discussion about the
> KernelCI backend redesign:
> 
>   https://groups.io/g/kernelci/topic/81113478#1231
> 
> 
> Here's a proposed roadmap for the new KernelCI API work:
> 
> 
> * Initial PoC (November)
> 
> This is the current phase, to have some proof-of-concept system that will help
> prove whether the architecture is viable.  The key aspects are:
> 
>   * minimalistic schema taking into account past experience (pending / complete
>     state, common base class for builds and tests)
> 
>   * "application logic" entirely on the client-side
> 
>   * pub/sub mechanism to orchestrate a small number of services (e.g. one
>     waiting for new revisions to run some tests and push results, another
>     service waiting for results to send emails)
> 
> It should still all be run in a local environment at this stage, using
> docker-compose.

This gave some good first results, with the server-side
deployment using FastAPI for the API, Redis for pub/sub, OAuth2
for authentication, Mongo DB for the database and SSH / Nginx as
a basic storage solution.

The client-side pipeline implementation is orchestrated by
pub/sub events generated when nodes move to different states in
the database.  The PoC got this working by running some basic
tests (kernel version check) directly on the local host.

> * Staging deployment (December-January)
> 
> Once the PoC has been completed, we might have to readjust the design based on
> how it went.  We'll also have to prepare for a growing code base: decide where
> the code for the client-side services will be kept, find maintainers, add unit
> tests and documentation.
> 
> This is also when we should start looking into how it can get deployed as a
> hosted service, potentially all in the cloud (MS Azure?) while still keeping
> the local deployment with docker-compose entirely self-contained for
> developers in particular.

The staging instance was set up as expected.  It's using the same
docker-compose deployments for API and pipeline as what
developers are typically using locally.  The code is organised as
follows:

* kernelci-api for the server-side implementation
* kernelci-pipeline for the pipeline implementation
* kernelci-core for the core client-side tools

The idea being that kernelci-pipeline will eventually have nearly
no code but just some configuration which can be used by
kernelci-core.  That way, all the pipeline steps could be run
manually or in a different execution environment.

> * Automated pipeline (February-March)
> 
> Having a hosted system means that test labs can start subscribing to events,
> timers can be run to periodically monitor kernel branches and run builds etc.
> This is when we will start to see all the features being added gradually to
> eventually provide a full alternative to the current system.  The aim is to
> rely solely on the pub/sub mechanism to orchestrate the various components
> together.
> 
> Typically, some code from kernelci-backend would be moved to kernelci-core
> (LAVA callback handler, KCIDB bridge, email report generator, regression
> tracking) so it can be run on the client side of the KernelCI API.
> 
> Hopefully, this is also the time when the new Web Dashboard work should start
> becoming visible to show the results.  If not, there should still be KCIDB's
> Grafana solution in the meantime.

Unfortunately there was no tangible progress on the web dashboard
front during that period, and a good share of development efforts
went into bringing up the chromeos.kernelci.org instance with
full stack Chrome OS tests.  So progress on the new API and
pipeline carried on but at a slower pace for a few months.

Since then, KUnit running in Kubernetes was added to the pipeline
which is now producing results with mainline.  A PoC was also
done with fstests, running initially on a dedicated host with
local KVM and now in GCE using the xfstests-bld tools created by
the kernel maintainers (Ted et al).

The design of the API and how nodes can be used is being more
detailed now, with a state diagram for node objects and
client-side services to manage timeouts etc.  The concept of a
node is to have the common fields used by any entry in the
database, then derived types can be used for builds, tests etc.
Nodes can also depend on each other, as a result of how the
pipeline is being run.

> * Production deployment (April-June)
> 
> This is very far off in the future, and it probably will take much longer until
> we have a stable deployment in production that can replace the current system.
> This milestone is really about having another deployment based on what was done
> for staging but in a production environment, which only runs tested code,
> stores results in a persistent database and contains real data that can be
> reported publicly.

We've now resumed this discussion and involved our new sysadmin
Vince in the process too.  We're finalising the creation of a new
Azure account for KernelCI which should give us more flexibility
and control over the services we can deploy in the Cloud: we
could use it for Mongo DB (Atlas), Redis, storage, API
micro-service in Kubernetes all hosted directly by Azure rather
than docker-compose on a dedicated VM.  The client-side pipeline
can be distributed anywhere as long as each service can reach the
API, so various services might be deployed differently and fulfil
the distributed architecture that we need for KernelCI.

More concrete plans around production (continuous) deployment
should appear early 2023.  It would be good to have a phase up to
June to finalise things and trial it out to start deprecating the
current system during the 2nd half of 2023.

> To keep track of all this, see the dedicated project board on GitHub:
> 
>   https://github.com/orgs/kernelci/projects/10/views/1
> 
> along with the list of milestones:
> 
>   https://github.com/kernelci/kernelci-api/milestones
> 
> 
> The Outreachy internship will be taking place from December to February
> included, which is during the "staging" and "pipeline" phases.  As such, the
> corresponding backlogs will be defined with the internship's timeline in mind.
> We already have some strong candidates who have made some great contributions
> so this is looking very promising.  Thank you!

Our Outreachy intern Jeny has since joined Collabora and is now
one of the core developers of the new API & pipeline.

> Then the next KernelCI hackfest could be taking place early March, shortly
> after the Outreachy internship.  This could be a very good time to have lots of
> different tasks for new contributors to work on as the design should be very
> modular.
> 
> In addition to the Web Dashboard, we're now considering additional "work
> packages" to be sponsored by the KernelCI LF project budget.  For the KernelCI
> API work, this could include maintainership but potentially also some extra
> help with development if needed.

Our new sysadmin Vince was hired as a work package set up by the
LF project board.  We still have budget to fund other work
packages, although adding extra developers for the new API &
pipeline is not being actively discussed at the moment.

> Please feel free to ask any question or share any suggestions you might have.
> We can still easily make changes to the plans and the overall design at this
> stage, and it's important to come up with a solution that solves the issues
> we've highlighted in the past: supporting arbitrary labs, not relying on
> Jenkins, decoupling data post-processing from the API...

There hasn't been much discussion around the fundamental concepts
of this design in the meantime as we haven't hit any blocker.
Fairly recently, Alicef suggested to use buildbot and Kevin
brought back the idea of Concourse CI.  It's still possible to
change some elements of the design, but the longer we wait the
harder it's going to be without doing another full rewrite which
I don't think the project can afford at this stage.  There were
very good reasons behind the choices that have been made, going
all the way back to some early discussions around a modular
pipeline in 2019, so let's make sure we look into the details and
keep all the important aspects in mind.

The roadmap in GitHub is being reviewed now to define the next
milestones, basically to define the minimal set of features in
order to be production-ready and to design a production
deployment solution.

See also the work-in-progress documentation for the new API &
pipeline for some more details:

  https://kernelci.org/docs/api/

Best wishes,
Guillaume
