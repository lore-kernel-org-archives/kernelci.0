Message-ID: <0747bf65-6a0b-8edf-debd-f699dfd938f9@collabora.com>
Date: Tue, 8 Feb 2022 12:39:48 +0000
MIME-Version: 1.0
Subject: Re: Jenkins example configuration
References: <AM5PR0801MB1777F53F11B189594ACC524E9C299@AM5PR0801MB1777.eurprd08.prod.outlook.com>
 <7h5ypqlbh9.fsf@baylibre.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
In-Reply-To: <7h5ypqlbh9.fsf@baylibre.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, khilman@baylibre.com, Matthew.Hart@arm.com
Cc: "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>

On 07/02/2022 19:31, Kevin Hilman wrote:
> Hi Matt,
> 
> Matthew Hart <Matthew.Hart@arm.com> writes:
> 
>> I'm deploying jenkins using the kernelci-jenkins repo and using AWS
>> EKS as the kubernetes backend. I can't find any recent examples that
>> include the k8s configuration (nodes.yaml i assume)
> 
> We have nodes.yaml in the `kernelci-jenkins-data` repo[1], which is
> git-crypt protect due to auth tokens etc. associated with the GCE and
> Azure k8s clusters.
> 
>> so had a few questions:
> 
>>   *   Any complaints if I upstream a patch for adding the AWS cli to the k8s Docker image?
> 
> Nope.

The only thing is that it won't be used upstream, at least not at
the moment.  So it might break without anyone noticing.

>>   *   How is the K8S_CONTEXT environment variable is set in jenkins, to be used in jobs/build.jpl?
> 
> The k8s interaction is all done via kubectl, and the host where this
> happens has many clusters configured.  So all kubectl commands are
> called with  `kubectl --context ${K8S_CONTEXT}`
> 
>>   *   Is there a record of all the node labels needed to run a full build (monitor, build-trigger, k8s etc
> 
> Hmm, not sure if this is documented.  Guillaume?

No, but you could run "grep node jobs/*" in kernelci-jenkins to
get an idea.

>>   *   Could I get a secrets-redacted example nodes.yaml for casc?
> 
> I can't remember if you already have a GPG key for
> kernelci-jenkins-data, but if not, either we can set one up, or I can
> share one with you privately.

The real issue is that there is no documentation for the Jenkins
setup.  It would be easy enough to have some sample config files
etc.  One reason why things aren't documented is because efforts
are being spent on moving away from Jenkins and in principle the
main pipeline should stop using it by the end of 2022.

Only people who require access to the encrypted repository should
be given access, which is now something the TSC would have to
approve.  If Matt has some time to help with maintaining Jenkins
for kernelci.org then great, he could join the TSC and get some
responsibility assigned for this like other members.  But the
lack of documentation should not be used as an excuse for cutting
corners, especially when it involves security issues.

I've added a sample nodes.yaml file which should provide all the
bits needed to recreate a full pipeline:

  https://github.com/kernelci/kernelci-jenkins-data/blob/main/samples/nodes.yaml

Let us know if you need any further help.

Best wishes,
Guillaume

> [1] https://github.com/kernelci/kernelci-jenkins-data
