Date: Fri, 26 Oct 2018 11:19:56 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: branch inclusion request
Message-ID: <20181026151956.GG2015@sasha-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi all,

Right now I'm pushing stable patches to Greg for his weekly releases,
and for those branches I only do basic cross-compilation and no
boot/functional testing at all.

I'd like to modify my process to rely on KernelCI testing instead. This
means I'd like to include my branches (one for each stable kernel) into
the build system.

These branches get pushed a few times per week, and sometimes a few
times a day, so this will generate a fair amount of builds. OTOH, I
don't really need to keep the build results for too long as I try to
address any issues that come up the same day.

--
Thanks,
Sasha
