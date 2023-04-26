Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E561FC6
	for <kernelci@lists.linux.dev>; Wed, 26 Apr 2023 13:12:20 +0000 (UTC)
Received: from [IPV6:2a00:5f00:102:0:b115:306b:3f3d:f0c2] (unknown [IPv6:2a00:5f00:102:0:b115:306b:3f3d:f0c2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B9746603009;
	Wed, 26 Apr 2023 14:12:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682514733;
	bh=JVre2D+nC523KtZI+xCAUC6Xo4eDiT/I5mzXQYX2TNg=;
	h=Date:To:Cc:From:Subject:From;
	b=l5ypVbxX87rWumXvLrNEckyJyXthLrp8tw+mv7wD7BsZVVaEjaoKuB8io0Ht8PoGP
	 CYGCoLl0AC5W3le5YK+VMU7u+jF5YuO2wbFakV+8MRQnIDa3FyWu1FyEJ7HbUrJ/e9
	 KosA+WU6JJV7g776Mf7gLHzJdYz4Ji4E4aW1YR17jS2xMZjKFCQOAcFZnyVbglfZeu
	 ZQQtpmceGMsM0olOgEmI0FZNlEBmB72RS1D9AyRBe9rNqaVYNP/Rg5rP98XmyEDU5h
	 OAei4XrhkqHI+BlKxc4KBru6cc5LQIcI3OocwxJn92zOFs/LoB3HplN3KmPOzkSVqd
	 H1u9w0frKO0PA==
Message-ID: <09c2d79d-27f3-1cb1-0d52-df003926a132@collabora.com>
Date: Wed, 26 Apr 2023 14:13:13 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>
Cc: "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: [RFC] KernelCI YAML pipeline configuration
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Along with the new KernelCI API & Pipeline currently under active development,
the YAML pipeline configuration is also going through a redesign.  This comes
from the fact that we now have a generic concept of "jobs" which could be
kernel builds, tests or anything that's orchestrated by the pipeline.  It's
also about defining dependencies between jobs rather than having implicit ones
such as LAVA tests that require particular kernel builds etc.  Also, the YAML
configuration used in the current Jenkins pipeline evolved from some legacy
implementation using Python dictionaries embedded in the code and hasn't really
been properly designed.  So now is a good time to take a fresh look at all this
again and try to come up with a simpler and better design.

It would also be the opportunity to fully document the schema of the YAML
configuration with a version and separate it from the code in kernelci-core.
This means we can more easily describe the pipeline used by kernelci.org as
application data and less as a base configuration library that other instances
depend upon.  Each instance should then have its own YAML configuration; we
might just share some very generic entries such as kernel git trees and public
API instances.

There's already some rough version of this in pipeline.yaml[1] which is used on
the staging KernelCI instance to get things going, but we've now reached the
point where we need to start finalising it with longer-term design decisions.
So here's a proposal with the main high-level YAML tags, what they're for and
some examples.  Please also see the GitHub discussion with more details:

  https://github.com/kernelci/kernelci-core/discussions/1907

Feel free to reply to this email or on GitHub, whatever works best for you.
Gathering feedback at this stage means we can more easily make changes than in
a few months' time when we start rolling things out in production.

If you're missing some general context around the new API & Pipeline:

  https://kernelci.org/docs/api/


* APIs

These config entries are about where the new API instances can be found.  While
a lot of things can be done offline such as running jobs locally, the main
use-case is to use the API to store / retrieve data and send / receive events
via the Pub-Sub interface.  It relies on API tokens which are managed as
secrets so not in the YAML configuration file.  So right now, we just need the
URL.

APIs:
  docker-host:
    url: http://172.17.0.1:8001


* storage

The new API doesn't provide any built-in storage solution, instead it just
requires all artifacts to be available via an http:// or https:// URL.  So any
arbitrary storage solution can be used, by default the docker-compose setup
comes with an SSH container for uploading files and an Nginx container for
serving them using a shared Docker volume.  A production system might have an
S3-compatible storage or anything that provides a way to retrieve the artifacts
over HTTP.

storage:
  docker-host:
    type: ssh
    host: 172.17.0.1
    port: 8022
    base_url: http://172.17.0.1:8002/


* jobs

A "job" is essentially anything that can be run.  This is a lot more generic
than the test and build configurations used with the current Jenkins pipeline.
There are still a few assumptions about "jobs" though as they typically come
with a Jinja2 template to generate a job definition.  This is in principle
independent of the runtime environment, so a same template can be used to run
the job in a local shell, in a Docker container, in Kubernetes, in LAVA etc.
It will do this by including a different base template that's specific to the
chosen runtime.  Jobs are also expected to require an "image" name which can be
pretty much anything that's usable by the runtime environment, typically a
Docker image or a root file system.

Another difference with the current Jenkins pipeline is that jobs have explicit
dependencies on other jobs.  For example, a KUnit job or a kernel build job
will require a source code tarball.  Then a kselftest job will require a
particular kernel build.  This hinges on the Pub/Sub interface: every time a
job node changes state an event is sent.  Then a pipeline service orchestrating
the jobs will look for jobs that have requirements that match the event to run
them.  This is what the "run_on" attribute is for.

jobs:
  kbuild-gcc-10-x86:
    template: kbuild.jinja2
    name: kbuild
    image: kernelci/gcc-10:x86-kernelci
    run_on:
      - channel: node
        name: checkout
        result: pass
    params:
      arch: x86_64
      compiler: gcc-10
      defconfig:
        - x86_64_defconfig
        - allmodconfig


* runtimes

Jobs are run in runtime environments, or "runtimes".  Currently, the only
runtimes implemented are a local shell directly on the host, Docker containers
and Kubernetes.  The next ones should include LAVA and other hardware labs such
as LabGrid or custom ones that don't rely on common frameworks.  Like the
storage configurations, runtimes have a "type" to look up a matching
implementation module.  The configuration attributes are therefore also
specific to the runtime type.  Then also like storage, runtime implementations
should be based on the abstract Runtime interface to provide standard methods
for generating jobs and running them.

runtimes:
  k8s-gke-eu-west4:
    type: kubernetes
    context: gke_android-kernelci-external_europe-west4-c_kci-eu-west4


* platforms

Runtime environments often provide a variety of platforms which can be used to
run jobs.  For example, Kubernetes clusters may provide different kinds of pods
and hardware test labs may provide different types of boards or servers.  This
is covered by the platform configurations.

Each platform is tied to a runtime environment type so that the services
running jobs can tell which ones need to be submitted for which runtime
environment.  Then specific fields can be provided depending on the platform's
associated runtime type.  For example, hardware platforms have a particular CPU
architecture that the runtime implementation needs to use to determine whether
it's compatible with a particular kernel build.

platforms:
  bcm2837-rpi-3-b:
    runtime-type: lava
    arch: arm64
    boot_method: uboot
    oem: broadcom
    params:
      context:
        console_device: ttyS1
        test_character_delay: 10


* scheduler

Finally, a list of scheduler combinations is used to tie things together.  This
is like a switchboard to connect jobs, runtimes and platforms.  As such, each
entry is anonymous so it takes the form of a list of dictionaries.  The initial
proposal is to have at least a job and runtime defined in each scheduler entry,
but we might need to refine it with additional criteria.  The idea being that
job, runtime and platform configurations should be self-contained and all the
"wiring" between them is done in the scheduler.

scheduler:
  - job: kunit
    runtime:
      name: k8s-gke-eu-west4


Best wishes,
Guillaume

[1] https://github.com/kernelci/kernelci-pipeline/blob/main/config/pipeline.yaml
