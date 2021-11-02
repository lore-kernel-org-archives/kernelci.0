From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: KernelCI API Roadmap
Message-ID: <b3e0fe1d-e352-5caa-71bd-7018c821f088@collabora.com>
Date: Tue, 2 Nov 2021 11:36:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: "kernelci@groups.io" <kernelci@groups.io>, automated-testing@lists.yoctoproject.org
Cc: kernelci-members <kernelci-members@groups.io>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michael Grzeschik <m.grzeschik@pengutronix.de>, =?UTF-8?Q?Jan_L=c3=bcbbe?= <j.luebbe@pengutronix.de>, santiago.esteban@microchip.com, ticotimo@gmail.com

For some background on this topic, please see the early discussion about the
KernelCI backend redesign:

  https://groups.io/g/kernelci/topic/81113478#1231


Here's a proposed roadmap for the new KernelCI API work:


* Initial PoC (November)

This is the current phase, to have some proof-of-concept system that will help
prove whether the architecture is viable.  The key aspects are:

  * minimalistic schema taking into account past experience (pending / complete
    state, common base class for builds and tests)

  * "application logic" entirely on the client-side

  * pub/sub mechanism to orchestrate a small number of services (e.g. one
    waiting for new revisions to run some tests and push results, another
    service waiting for results to send emails)

It should still all be run in a local environment at this stage, using
docker-compose.


* Staging deployment (December-January)

Once the PoC has been completed, we might have to readjust the design based on
how it went.  We'll also have to prepare for a growing code base: decide where
the code for the client-side services will be kept, find maintainers, add unit
tests and documentation.

This is also when we should start looking into how it can get deployed as a
hosted service, potentially all in the cloud (MS Azure?) while still keeping
the local deployment with docker-compose entirely self-contained for
developers in particular.


* Automated pipeline (February-March)

Having a hosted system means that test labs can start subscribing to events,
timers can be run to periodically monitor kernel branches and run builds etc.
This is when we will start to see all the features being added gradually to
eventually provide a full alternative to the current system.  The aim is to
rely solely on the pub/sub mechanism to orchestrate the various components
together.

Typically, some code from kernelci-backend would be moved to kernelci-core
(LAVA callback handler, KCIDB bridge, email report generator, regression
tracking) so it can be run on the client side of the KernelCI API.

Hopefully, this is also the time when the new Web Dashboard work should start
becoming visible to show the results.  If not, there should still be KCIDB's
Grafana solution in the meantime.


* Production deployment (April-June)

This is very far off in the future, and it probably will take much longer until
we have a stable deployment in production that can replace the current system.
This milestone is really about having another deployment based on what was done
for staging but in a production environment, which only runs tested code,
stores results in a persistent database and contains real data that can be
reported publicly.


To keep track of all this, see the dedicated project board on GitHub:

  https://github.com/orgs/kernelci/projects/10/views/1

along with the list of milestones:

  https://github.com/kernelci/kernelci-api/milestones


The Outreachy internship will be taking place from December to February
included, which is during the "staging" and "pipeline" phases.  As such, the
corresponding backlogs will be defined with the internship's timeline in mind.
We already have some strong candidates who have made some great contributions
so this is looking very promising.  Thank you!

Then the next KernelCI hackfest could be taking place early March, shortly
after the Outreachy internship.  This could be a very good time to have lots of
different tasks for new contributors to work on as the design should be very
modular.

In addition to the Web Dashboard, we're now considering additional "work
packages" to be sponsored by the KernelCI LF project budget.  For the KernelCI
API work, this could include maintainership but potentially also some extra
help with development if needed.


Please feel free to ask any question or share any suggestions you might have.
We can still easily make changes to the plans and the overall design at this
stage, and it's important to come up with a solution that solves the issues
we've highlighted in the past: supporting arbitrary labs, not relying on
Jenkins, decoupling data post-processing from the API...


Best wishes,
Guillaume
