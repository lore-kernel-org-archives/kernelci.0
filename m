Date: Mon, 28 May 2018 13:55:40 +0200
From: "Ana Guerrero Lopez" <ana.guerrero@collabora.com>
Subject: New pipeline to build images with the test suites
Message-ID: <20180528115539.GA14389@delenn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io


Hi!

In a previous email, I said:

> On 05/16/2018 06:46 PM, Ana Guerrero Lopez wrote:
>>
>> I'm fine having a single image with these two test suites, if eventually
>> this not convenient we can always change it. However, now we have more
>> or less agreed on a job creating the "basic" images, how do you envisage
>> we should be creating the images with the test suites?
>>
>> My proposal is installing the build and run dependencies via extra_packages
>> in the Jenkinsfile and then building the test suite directly against the
>> new created image with script run by debos directly. This will avoid
>> the merge step, although the strip/crush might need a bit of work
>> for making sure the resulting ramdisk is still small.
>> The advantage is adding/modifying the test suites doesn't require a lot
>> of knowledge of jenkins or even debos. 

I have sent a pull request in this sense: 
https://github.com/kernelci/kernelci-build-staging/pull/28/


If you have any comments related to code, please comment directly in
github, for other discussion, I think it's easier to use the list.

I tried building this new pipeline in staging but it seems to be some 
problems with loading the kvm module in the docker slaves:

[Build image for x86_64] + debos -t architecture:amd64 -t basename:20180528.0/x86_64 -t extra_packages:bash jenkins/debian/debos/stretch.yaml
[Build image for x86_64] Could not access KVM kernel module: Permission denied
[Build image for x86_64] failed to initialize KVM: Permission denied
[Build image for x86_64] open /tmp/fakemachine-777615409/result: no such file or directory

Maybe it's missing the nest parameter when loading the module?

Ana

