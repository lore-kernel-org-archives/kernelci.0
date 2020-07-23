MIME-Version: 1.0
References: <CAJMT-dGBCdkJnDNRYRRk9aVk=FmJkjGmpXCqsXc73v8hY+yi9w@mail.gmail.com>
 <7hwo3g4irb.fsf@baylibre.com> <1621E054EEFB3FDC.11249@groups.io>
 <CAJMT-dGA6ELQbnJt5qDsDhu3aKa6ixQC0Pv1QCNW_-WpGwTNRw@mail.gmail.com> <7hmu3r6ziu.fsf@baylibre.com>
In-Reply-To: <7hmu3r6ziu.fsf@baylibre.com>
From: "Aditya Srivastava" <adityasrivastava301199@gmail.com>
Date: Thu, 23 Jul 2020 18:16:11 +0530
Message-ID: <CAJMT-dGLxR0rT1ZsG6BBkC7uNZOB72VuJ8jKEfnAkyOO7n0Lrw@mail.gmail.com>
Subject: Re: Contribute to KernelCI in Kubernetes or Cloud
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io

On Thu, Jul 23, 2020 at 2:25 AM Kevin Hilman <khilman@baylibre.com> wrote:

> Aditya Srivastava <adityasrivastava301199@gmail.com> writes:
>
> [...]
>
> > I had one concern though, in the jinja2 file[1] the way args are
> inputted,
> > Can't there be a way to create a config file or something to use instead
> of
> > writing that huge args part (which can be error prone)
>
> Yes, as Guillaume said, we need a way to use config files for the tools.
>
> However, if we go this route, how do you pass the config file to the k8s
> job?  So far, I only know how to start containers with
> arguments/parameters passed in env variables.
>
> Kevin
>

Hi kevin,
You can create a persistent volume and mount the file in the pod.
I can show you an example of how it's done...

If that's not a very high priority task, I can contribute to that part too

But right now my college placements are going on. Final round of placements
is
a hackathon which is this weekend. So I will be able to start with this on
monday.

If its needed ASAP,

Here's the example:
https://github.com/ADI10HERO/PAG_K8S/blob/master/yamls/prometheus-deployment.yaml#L48

And that directory that is  mentioned there is here:
https://github.com/ADI10HERO/PAG_K8S/tree/master/prometheus

So the setup was like:
On a centos VM, repository was cloned on in the /root/

PS: You can use relative paths too....

If an even detailed explanation was expected, please let me know,
I'd be more than happy to write :D

Thanks and regards,
Aditya Srivastava
