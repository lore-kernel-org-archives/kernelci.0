Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Contribute to KernelCI in Kubernetes or Cloud
In-Reply-To: <CAJMT-dGA6ELQbnJt5qDsDhu3aKa6ixQC0Pv1QCNW_-WpGwTNRw@mail.gmail.com>
References: <CAJMT-dGBCdkJnDNRYRRk9aVk=FmJkjGmpXCqsXc73v8hY+yi9w@mail.gmail.com> <7hwo3g4irb.fsf@baylibre.com> <1621E054EEFB3FDC.11249@groups.io> <CAJMT-dGA6ELQbnJt5qDsDhu3aKa6ixQC0Pv1QCNW_-WpGwTNRw@mail.gmail.com>
Date: Wed, 22 Jul 2020 13:55:05 -0700
Message-ID: <7hmu3r6ziu.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Aditya Srivastava <adityasrivastava301199@gmail.com>, kernelci@groups.io, Aditya Srivastava <adityasrivastava301199@gmail.com>

Aditya Srivastava <adityasrivastava301199@gmail.com> writes:

[...]

> I had one concern though, in the jinja2 file[1] the way args are inputted,
> Can't there be a way to create a config file or something to use instead of
> writing that huge args part (which can be error prone)

Yes, as Guillaume said, we need a way to use config files for the tools.

However, if we go this route, how do you pass the config file to the k8s
job?  So far, I only know how to start containers with
arguments/parameters passed in env variables.

Kevin
