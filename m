Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Jenkins example configuration
In-Reply-To: <AM5PR0801MB1777F53F11B189594ACC524E9C299@AM5PR0801MB1777.eurprd08.prod.outlook.com>
References: <AM5PR0801MB1777F53F11B189594ACC524E9C299@AM5PR0801MB1777.eurprd08.prod.outlook.com>
Date: Mon, 07 Feb 2022 11:31:46 -0800
Message-ID: <7h5ypqlbh9.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Matthew.Hart@arm.com, "kernelci@groups.io" <kernelci@groups.io>

Hi Matt,

Matthew Hart <Matthew.Hart@arm.com> writes:

> I'm deploying jenkins using the kernelci-jenkins repo and using AWS
> EKS as the kubernetes backend. I can't find any recent examples that
> include the k8s configuration (nodes.yaml i assume)

We have nodes.yaml in the `kernelci-jenkins-data` repo[1], which is
git-crypt protect due to auth tokens etc. associated with the GCE and
Azure k8s clusters.

> so had a few questions:

>   *   Any complaints if I upstream a patch for adding the AWS cli to the k8s Docker image?

Nope.

>   *   How is the K8S_CONTEXT environment variable is set in jenkins, to be used in jobs/build.jpl?

The k8s interaction is all done via kubectl, and the host where this
happens has many clusters configured.  So all kubectl commands are
called with  `kubectl --context ${K8S_CONTEXT}`

>   *   Is there a record of all the node labels needed to run a full build (monitor, build-trigger, k8s etc

Hmm, not sure if this is documented.  Guillaume?

>   *   Could I get a secrets-redacted example nodes.yaml for casc?

I can't remember if you already have a GPG key for
kernelci-jenkins-data, but if not, either we can set one up, or I can
share one with you privately.

Kevin

[1] https://github.com/kernelci/kernelci-jenkins-data
