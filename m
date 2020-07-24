Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Contribute to KernelCI in Kubernetes or Cloud
In-Reply-To: <CAJMT-dGLxR0rT1ZsG6BBkC7uNZOB72VuJ8jKEfnAkyOO7n0Lrw@mail.gmail.com>
References: <CAJMT-dGBCdkJnDNRYRRk9aVk=FmJkjGmpXCqsXc73v8hY+yi9w@mail.gmail.com> <7hwo3g4irb.fsf@baylibre.com> <1621E054EEFB3FDC.11249@groups.io> <CAJMT-dGA6ELQbnJt5qDsDhu3aKa6ixQC0Pv1QCNW_-WpGwTNRw@mail.gmail.com> <7hmu3r6ziu.fsf@baylibre.com> <CAJMT-dGLxR0rT1ZsG6BBkC7uNZOB72VuJ8jKEfnAkyOO7n0Lrw@mail.gmail.com>
Date: Fri, 24 Jul 2020 11:48:13 -0700
Message-ID: <7hzh7o6976.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Aditya Srivastava <adityasrivastava301199@gmail.com>
Cc: kernelci@groups.io

Aditya Srivastava <adityasrivastava301199@gmail.com> writes:

> On Thu, Jul 23, 2020 at 2:25 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Aditya Srivastava <adityasrivastava301199@gmail.com> writes:
>>
>> [...]
>>
>> > I had one concern though, in the jinja2 file[1] the way args are
>> inputted,
>> > Can't there be a way to create a config file or something to use instead
>> of
>> > writing that huge args part (which can be error prone)
>>
>> Yes, as Guillaume said, we need a way to use config files for the tools.
>>
>> However, if we go this route, how do you pass the config file to the k8s
>> job?  So far, I only know how to start containers with
>> arguments/parameters passed in env variables.
>>
>> Kevin
>>
>
> Hi kevin,
> You can create a persistent volume and mount the file in the pod.
> I can show you an example of how it's done...

I know about persistent volumes, but how do you push files to the k8s
cluster so they show up in your volume?

In your example, how does /root/PAG_K8S/prometheus get populated?

Kevin
