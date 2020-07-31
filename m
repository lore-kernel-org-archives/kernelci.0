Return-Path: <adityasrivastava301199@gmail.com>
Date: Fri, 31 Jul 2020 14:08:13 +0530
From: "Aditya Srivastava" <adityasrivastava301199@gmail.com>
Subject: Re: Contribute to KernelCI in Kubernetes or Cloud
Message-ID: <20200731083813.GA7355@kuro>
References: <7hwo3g4irb.fsf@baylibre.com>
 <1621E054EEFB3FDC.11249@groups.io>
 <CAJMT-dGA6ELQbnJt5qDsDhu3aKa6ixQC0Pv1QCNW_-WpGwTNRw@mail.gmail.com>
 <7hmu3r6ziu.fsf@baylibre.com>
 <CAJMT-dGLxR0rT1ZsG6BBkC7uNZOB72VuJ8jKEfnAkyOO7n0Lrw@mail.gmail.com>
 <7hzh7o6976.fsf@baylibre.com>
 <CAJMT-dGsKh9vObdBxbdTQNoC7_mVx7qgxyX6AN0pXzePepjbFQ@mail.gmail.com>
 <7hzh7j2qha.fsf@baylibre.com>
 <CAJMT-dEoEerBUcTeZT97ZfWbqDy3f0UhB8xordgG=Ae8wzOEtQ@mail.gmail.com>
 <7hlfj03opw.fsf@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <7hlfj03opw.fsf@baylibre.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io

On Thu, Jul 30, 2020 at 10:19:23AM -0700, Kevin Hilman wrote:
> Aditya Srivastava <adityasrivastava301199@gmail.com> writes:
> 
> > On Wed, Jul 29, 2020 at 4:32 AM Kevin Hilman <khilman@baylibre.com> wrote:
> >
> >> Aditya Srivastava <adityasrivastava301199@gmail.com> writes:
> >>
> >> > On Sat, Jul 25, 2020 at 12:18 AM Kevin Hilman <khilman@baylibre.com>
> >> wrote:
> >> >
> >> >> Aditya Srivastava <adityasrivastava301199@gmail.com> writes:
> >> >>
> >> >> > On Thu, Jul 23, 2020 at 2:25 AM Kevin Hilman <khilman@baylibre.com>
> >> >> wrote:
> >> >> >
> >> >> >> Aditya Srivastava <adityasrivastava301199@gmail.com> writes:
> >> >> >>
> >> >> >> [...]
> >> >> >>
> >> >> >> > I had one concern though, in the jinja2 file[1] the way args are
> >> >> >> inputted,
> >> >> >> > Can't there be a way to create a config file or something to use
> >> >> instead
> >> >> >> of
> >> >> >> > writing that huge args part (which can be error prone)
> >> >> >>
> >> >> >> Yes, as Guillaume said, we need a way to use config files for the
> >> tools.
> >> >> >>
> >> >> >> However, if we go this route, how do you pass the config file to the
> >> k8s
> >> >> >> job?  So far, I only know how to start containers with
> >> >> >> arguments/parameters passed in env variables.
> >> >> >>
> >> >> >> Kevin
> >> >> >>
> >> >> >
> >> >> > Hi kevin,
> >> >> > You can create a persistent volume and mount the file in the pod.
> >> >> > I can show you an example of how it's done...
> >> >>
> >> >> I know about persistent volumes, but how do you push files to the k8s
> >> >> cluster so they show up in your volume?
> >> >>
> >> >> In your example, how does /root/PAG_K8S/prometheus get populated?
> >> >>
> >> >>
> >> >
> >> > Lets talk with reference to this[1] file
> >> >
> >> > So the volume inside the container at line 41 (A) is the same volume
> >> > (because they have name)
> >> > written under the volume section on line 49. (B)
> >> >
> >> > A : Volume inside the pod / container
> >> > B:  Volume on the host path, i,e a directory ( /root/PAG_K8S/prometheus )
> >> >
> >> > Now root/PAG_K8S/prometheus, is something I need to have already on my
> >> host
> >> > before running the kubectl command
> >> > on the  prometheus-deployment.yaml file.
> >>
> >> So this is the important part.  You already have to have the hostPath on
> >> host running k8s, correct?
> >>
> >>
> > Yes that is correct
> >
> >
> >
> >> Which means if you wanted to use a custom config file for a given job,
> >> you have to push/publish that to the k8s host before running kubectl.
> >>
> >>
> > Yes, in my case I have the files already on the hostPath
> >
> >
> >
> >> > So when I run that file, the volume name which is written under the
> >> > containers section (lines 39 to 43)
> >> > It matches the name of the volume mounts from the ones under the Volumes
> >> > section (lines 46 to 52)
> >> >
> >> >
> >> > And the files /directory(ies) in the volumes section's (volume) paths are
> >> > mounted inside the container
> >> > on the paths mentioned under the volumeMounts section's mountPaths.
> >> >
> >> > For example,
> >> > /root/PAG_K8S/prometheus  (hostpath0) is mounted at  /etc/prometheus
> >> > (hostpath0's path inside the container)
> >> >
> >> > Now /root/PAG_K8S/prometheus in my case doesn't get populated in runtime,
> >> > it has static data....
> >>
> >> Right, so my main question is how would you do this same type of thing
> >> if you have data that needs to be populated at runtime?
> >>
> >> Kevin
> >>
> >
> >
> > 1.  A possibility can be to use config maps, if possible the config map's
> > yaml
> >      can be generated with the needed data at runtime and then it is
> > applied to the pods.
> 
> Ah, I think this is what we need.  I wasn't aware of ConfigMap.
> 
> > 2. We can try looking at helm charts for this purpose, but I am not very
> > familiar with them.
> 
> I'm not familiar at all with helm.
> 
> > I will search more on this, can you give me an example of what is expected
> > ....
> > Or maybe go over the actual  problem or goal if possible.
> >
> > Knowing exactly what is needed will help me refine my search so....
> 
> The overall goal is to get a dynamically generated config file (in
> python configparser, ini-style format) which can be used by some python
> tools in the container.
>

I seee... 

1. So if you have a host Vm on which  there is a k8s pod running
you need to generate the config file on the host VM right?

2. And are these VMs ephemeral?

3. If yes, how do will you generate the config file, I mean even the
_config-map.yaml_ needs to be generated somewhow, right?


> I did a little reading about ConfigMap and it looks like this will do
> the trick.
> 
> Kevin
> 
> 

I hope it works and I will be glad if I helped even a litle.


Is there anything else I could do to contribute? Something very basic
maybe, it can help me get familiar with the project and also help you guys a
little...


Thanks and regards, 
Aditya Srivastava

