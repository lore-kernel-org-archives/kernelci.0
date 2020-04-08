Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: experiments with GCE preemptible builders
Date: Tue, 07 Apr 2020 17:34:35 -0700
Message-ID: <7hpnciyfvo.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hello,

I've been trying to add more cloud builders using GCE preemptible VMs,
but am running into various Jenkins issues.

TL;DR; Jenkins Pipelines needs a lot of work to work with preemptible
builders.  :(

Long version...

First, I tried with the "JClouds plugin" which supports multiple cloud
providers.  I tried it first with GCE.  JClouds doesn't detect
preemption events at all on worker nodes, so I gave up on that rather
quickly.

Next, I tried with the "google-compute-enginge" Jenkins plugin.  It
seems to detect preemptible instances correctly.

If I create a very simple jenkins "freestyle" job (that just runs a
simple shell script), on a preemptible node, the google-compute-engine
jenkins plugin detects the builder preemption, aborts the job and
reschedules it automatically.  So that works as expected.

BUT... With pipeline jobs, things get quite a bit more complicated.

When a preemption event happens to a pipeline kernel-build job, the job
will still wait for it's timeout event (which can be a long time on
current build jobs).  When the timeout eventually happens, it detects
the preemption and the job is rescheduled.  However...

In our current jobs, if the preemption happens during the "Build" stage,
that specific build job will be rescheduled, but the build-trigger job
that called it will return SUCCESS and complete normall.

Then, the rescheduled "kernel-build" job is then rescheduled, but it's
scheduled as a non-parameterized job, so all the args we pass to jobs
are lost.

Kevin
