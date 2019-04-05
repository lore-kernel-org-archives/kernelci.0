Date: Fri, 5 Apr 2019 10:41:53 -0400 (EDT)
From: Veronika Kabatova <vkabatov@redhat.com>
Message-ID: <457016061.11846096.1554475313006.JavaMail.zimbra@redhat.com>
In-Reply-To: <299272045.11819252.1554465036421.JavaMail.zimbra@redhat.com>
Subject: A common place for CI results?
MIME-Version: 1.0
List-ID: <info.kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: automated-testing@yoctoproject.org, info@kernelci.org


Hi,

as we know from this list, there's plenty CI systems doing some testing on the
upstream kernels (and maybe some others we don't know about).

It would be great if there was a single common place where all the CI systems
can put their results. This would make it much easier for the kernel
maintainers and developers to see testing status since they only need to
check one place instead of having a list of sites/mailing lists where each CI
posts their contributions.


A few weeks ago, with some people we've been talking about kernelci.org being
in a good place to act as the central upstream kernel CI piece that most
maintainers already know about. So I'm wondering if it would be possible for
kernelci to also act as an aggregator of all results? There's already an API
for publishing a report [0] so it shouldn't be too hard to adjust it to
handle and show more information. I also found the beta version for test
results [1] so actually, most of the needed functionality seems to be already
there. Since there will be multiple CI systems, the source and contact point
for the contributor (so maintainers know whom to ask about results if needed)
would likely be the only missing essential data point.


The common place for results would also make it easier for new CI systems to
get involved with upstream. There are likely other companies out there running
some tests on kernel internally but don't publish the results anywhere. Only
adding some API calls into their code (with the data they are allowed to
publish) would make it very simple for them to start contributing. If we want
to make them interested, the starting point needs to be trivial. Different
companies have different setups and policies and they might not be able to
fulfill arbitrary requirements so they opt to not get involved at all, which
is a shame because their results can be useful. After the initial "onboarding"
step they might be willing to contribute more and more too.


Please let me know if the idea makes sense or if something similar is already
in plans. I'd be happy to contribute to the effort because I believe it would
make everyone's life easier and we'd all benefit from it (and maybe someone
else from my team would be willing to help out too if needed).


Thanks,

Veronika Kabatova
CKI Project


[0] https://api.kernelci.org/examples.html#sending-a-boot-report
[1] https://kernelci.org/test/
