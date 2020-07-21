Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Contribute to KernelCI in Kubernetes or Cloud
In-Reply-To: <CAJMT-dGH=_eGqBiFdpSQyRT1UDmQANgzGS7RXxNbQWqx+vnGNA@mail.gmail.com>
References: <CAJMT-dGBCdkJnDNRYRRk9aVk=FmJkjGmpXCqsXc73v8hY+yi9w@mail.gmail.com> <7hwo3g4irb.fsf@baylibre.com> <CAJMT-dGH=_eGqBiFdpSQyRT1UDmQANgzGS7RXxNbQWqx+vnGNA@mail.gmail.com>
Date: Tue, 21 Jul 2020 10:14:14 -0700
Message-ID: <7htuy094ex.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Aditya Srivastava <adityasrivastava301199@gmail.com>
Cc: kernelci@groups.io

Aditya Srivastava <adityasrivastava301199@gmail.com> writes:

> On Mon, Jul 6, 2020 at 11:40 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Hello,
>>
>> Aditya Srivastava <adityasrivastava301199@gmail.com> writes:
>>
>> > Heard the talk on OSS by Kevin Hilman and khouloud touil , I would like
>> to
>> > help to get KernelCI on K8S or any other help if needed for the same.
>>
>> Thanks for contacting us.  What's your experience with k8s? and how do
>> you want to help?
>>
>>
> Hii Kevin,
> I would like to start with apologizing for replying so late. I am sorry.
> I was down with a cold and slight fever and pandemic sure gets you worried
> over little things.
> Then I got a little busy with college stuff.
>
> I am not very experienced with k8s either,
> I am working and learning on the way by setting up a monitoring cluster for
> OPNFV project.
>
>
> As you may have learned in my talk, we do *lots* of kernel builds.
>>
> We have Docker images for each arch/toolchain combination[1], and these
>> are the containers we use in the k8s jobs.
>>
>> Our pipeline is managed by Jenkins, and you can read a bit about the
>> Jenkins jobs in the README of the main kernelci-core repo[2].
>>
>> Where k8s comes in is at the `jenkins/build.jpl` step.  When we get to
>> this phase, we're ready to do a build for a specific combination of:
>>
>> - git tree
>> - git branch
>> - kernel defconfig
>> - arch
>> - compiler
>>
>> The build step then generates a k8s job (from a jinja2 template) based
>> on these parameters, and sends it off to a pre-configure k8s cluster
>> using kubectl.
>>
>> Here is the github PR[3] that has the jinja2 template and a python
>> script (gen.py) to generate the k8s job yaml.  There's also another
>> script (wait.py) which uses the k8s python API to wait for the job to
>> complete and then fetch the build logs.
>>
>> I've been the one working on the k8s tooling, but I'm pretty new to it,
>> so I'm assuming that I made some newbie mistakes and that there are
>> probably better ways of doing things.
>>
>> For now, this is already working pretty well and has allowed us to scale
>> up our build capacity (thanks to compute donations from gcloud and
>> azure), but any help in this area by experienced engineers would be very
>> helpful.
>>
>> I'm particularily interested in your thoughts on improvements on how to
>> submit/wait for k8s jobs and then fetch the logs.
>
>
> I would suggest that for fetching logs we can set up
> Elasticsearch-Fluentd-Kibana stack (EFK) or
> Elasticsearch-Logstash-Kibana stack (ELK) both work in a similar manner...
> They can scale and support HA (high availability).

For now, we are trying to de-couple the build steps from the log
collection and reporting, and for now we're just looking at k8s for
scaling the kernel builds.

On log collection/reporting, just for your info, he last step of the
build is to publish logs and related metadata to the
kernelci-backend[2].  From there we have an existing frontend[2]
(production instance at kernelci.org) that allows basic viewing of
data/logs.  We also have a PoC grafana instance (see the KCIDB tab at
kernelci.org) setup to view some of that data.

> We can use some alerting system there too, like parse the logs and
> notify on failures (which can be set using alerting rules)

This will be part or the reporting side as well, and is part of kcidb[3]

> (Although I see kernelci build logs in my mail daily, so that can be
> optional)
>
>
>> It's working OK now,
>> but occaisionaly get problems wher kubectl (or wait.py) gets random
>> failures, or "connection refused" errors from the k8s cluster.  I cannot
>
> reliably reproduce these reliably but they happen every few thousand
>> builds.
>>
>
> Yes, I understand.
> These stacks I am talking about, can themselves be deployed on a VM or as a
> k8s cluster itself.
> So it'll be like the cluster is sending the logs to us, not we fetching
> them.
> Here[1] is my one slide presentation for EFK. I know it is not very well
> made but I hope it'll be helpful

There have been a couple expeirments already with ELK for the
visualization parts, but they stalled out mainly due to lack of time so
didn't get far enough to show how it could be useful, but we're always
open to examples of how we could better use these tools.

Kevin

[1] https://github.com/kernelci/kernelci-backend
[2] https://github.com/kernelci/kernelci-frontend
[3] https://github.com/kernelci/kcidb

