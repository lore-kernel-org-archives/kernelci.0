Subject: Re: Contribute to KernelCI in Kubernetes or Cloud
References: <CAJMT-dGBCdkJnDNRYRRk9aVk=FmJkjGmpXCqsXc73v8hY+yi9w@mail.gmail.com>
 <7hwo3g4irb.fsf@baylibre.com> <1621E054EEFB3FDC.11249@groups.io>
 <CAJMT-dGA6ELQbnJt5qDsDhu3aKa6ixQC0Pv1QCNW_-WpGwTNRw@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <d70663cd-3124-a59c-156a-ee959f985380@collabora.com>
Date: Mon, 20 Jul 2020 09:07:24 +0100
MIME-Version: 1.0
In-Reply-To: <CAJMT-dGA6ELQbnJt5qDsDhu3aKa6ixQC0Pv1QCNW_-WpGwTNRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: adityasrivastava301199@gmail.com
Cc: Kevin Hilman <khilman@baylibre.com>, kernelci@groups.io

Hi Aditya,

On 17/07/2020 10:40, Aditya Srivastava wrote:
> On Wed, Jul 15, 2020 at 2:09 PM Aditya Srivastava via groups.io
> <adityasrivastava301199=gmail.com@groups.io> wrote:
> 
>> On Mon, Jul 6, 2020 at 11:40 PM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>>> Hello,
>>>
>>> Aditya Srivastava <adityasrivastava301199@gmail.com> writes:
>>>
>>>> Heard the talk on OSS by Kevin Hilman and khouloud touil , I would like
>>> to
>>>> help to get KernelCI on K8S or any other help if needed for the same.
>>>
>>> Thanks for contacting us.  What's your experience with k8s? and how do
>>> you want to help?
>>>
>>>
>> Hii Kevin,
>> I would like to start with apologizing for replying so late. I am sorry.
>> I was down with a cold and slight fever and pandemic sure gets you worried
>> over little things.
>> Then I got a little busy with college stuff.
>>
>> I am not very experienced with k8s either,
>> I am working and learning on the way by setting up a monitoring cluster for
>> OPNFV project.
>>
>>
>> As you may have learned in my talk, we do *lots* of kernel builds.
>>>
>> We have Docker images for each arch/toolchain combination[1], and these
>>> are the containers we use in the k8s jobs.
>>>
>>> Our pipeline is managed by Jenkins, and you can read a bit about the
>>> Jenkins jobs in the README of the main kernelci-core repo[2].
>>>
>>> Where k8s comes in is at the `jenkins/build.jpl` step.  When we get to
>>> this phase, we're ready to do a build for a specific combination of:
>>>
>>> - git tree
>>> - git branch
>>> - kernel defconfig
>>> - arch
>>> - compiler
>>>
>>> The build step then generates a k8s job (from a jinja2 template) based
>>> on these parameters, and sends it off to a pre-configure k8s cluster
>>> using kubectl.
>>>
>>> Here is the github PR[3] that has the jinja2 template and a python
>>> script (gen.py) to generate the k8s job yaml.  There's also another
>>> script (wait.py) which uses the k8s python API to wait for the job to
>>> complete and then fetch the build logs.
>>>
>>> I've been the one working on the k8s tooling, but I'm pretty new to it,
>>> so I'm assuming that I made some newbie mistakes and that there are
>>> probably better ways of doing things.
>>>
>>> For now, this is already working pretty well and has allowed us to scale
>>> up our build capacity (thanks to compute donations from gcloud and
>>> azure), but any help in this area by experienced engineers would be very
>>> helpful.
>>>
>>> I'm particularily interested in your thoughts on improvements on how to
>>> submit/wait for k8s jobs and then fetch the logs.
>>
>>
>> I would suggest that for fetching logs we can set up
>> Elasticsearch-Fluentd-Kibana stack (EFK) or
>> Elasticsearch-Logstash-Kibana stack (ELK) both work in a similar manner...
>> They can scale and support HA (high availability).
>>
>> We can use some alerting system there too, like parse the logs and notify
>> on failures (which can be
>> set using alerting rules)
>>
>> (Although I see kernelci build logs in my mail daily, so that can be
>> optional)
>>
>>
>>> It's working OK now,
>>> but occaisionaly get problems wher kubectl (or wait.py) gets random
>>> failures, or "connection refused" errors from the k8s cluster.  I cannot
>>
>> reliably reproduce these reliably but they happen every few thousand
>>> builds.
>>>
>>
>> Yes, I understand.
>> These stacks I am talking about, can themselves be deployed on a VM or as a
>> k8s cluster itself.
>> So it'll be like the cluster is sending the logs to us, not we fetching
>> them.
>> Here[1] is my one slide presentation for EFK. I know it is not very well
>> made but I hope it'll be helpful
>>
>>
>> (Similarly we can set up a monitoring stack using prometheus - alertmanager
>> - granfana to collect metrics
>> like CPU usage, disk space left, memory used,  if you see the need. My work
>> (not yet complete) can
>> be seen here[2])
>>
>>
>>> Anyways, that's a bit of background.  If you have some time to help out,
>>> please have a look at the current expirments and feel free to ask
>>> questions.
>>>
>>> It also might be worth your time to join our weekly call.  We meet at
>>> 16h UTC every Tuesday via a jitsi video call[4].
>>>
>>> I would love to join next week :D
>> If not possible, will inform you in advance.
>>
>>
>>> Thanks again for you interest and offer to help,
>>>
>>> Kevin
>>>
>> Thank you so much Kevin for giving such a detailed reply.
>> Again, I did go through the files but I would like to visit them again
>> before I get back to you with my questions.
>>
>>>
>>
>> [1]
>>>
>> https://github.com/kernelci/kernelci-core/tree/master/jenkins/dockerfiles
>>> [2] https://github.com/kernelci/kernelci-core
>>> [3]
>>>
>> https://github.com/kernelci/kernelci-core/pull/366/commits/b63da26abc216ad8bc8123d63010a485db2ae3a8
>>> [4] https://meet.kernel.social/kernelci-dev
>>
>>
>>
>> Thanks and Regards,
>> Aditya Srivastava
>>
>> [1] EFK Slide
>> <
>> https://docs.google.com/presentation/d/1yzOEkCblvojPVhR4MIOOG7bg1k8ACXXX9YluVLGHxNI/edit?usp=sharing
>>>
>> [2] https://github.com/adi10hero/PAG_K8S
>>
>>
>>
>>
> 
> 
> I went through the PRs sent by Kevin, I liked the way gen and wait.py were
> implemented.
> 
> I had one concern though, in the jinja2 file[1] the way args are inputted,
> Can't there be a way to create a config file or something to use instead of
> writing that huge args part (which can be error prone)

Yes, I actually started working on that last week.  It has always
been something to be done, and wasn't a blocker for automated
jobs so it was kept at a lower priority.  But now that logs from
Kubernetes don't filter out tokens on the command line like
Jenkins does, we really need config files for all use-cases.

I"m planning to do it in a similar way as what is in
kernelci-deploy, using configparser in Python.  I can send a link
to the PR when it's ready if you want to review the changes, or
we can discuss that on IRC.

Thanks,
Guillaume


> Thanks and regards,
>         Aditya
> 
> [1]
> https://github.com/kernelci/kernelci-core/pull/366/files#diff-80182b682042b9b2a1a71ac7233563e1R54
> 
> 
> ---
> PS: I wanted to bring it to notice that I am also learning the cloud
> orchestration (k8s) part,
>       Monitoring and logging on K8S is what I have some experience in,
>       My expertise lies in the ML/ DL/ analytics domain.
> 
> 
> 

