MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 28 Aug 2019 14:03:22 -0700
Message-ID: <CACT4Y+bt8r-1t7=sFtH75_Bj-xBdTTUkM-tZ=GEoy2B=rCYQOg@mail.gmail.com>
Subject: Some questions about KernelCI
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Kevin Hilman <khilman@baylibre.com>

Hello KernelCI-devs,

I have some questions regarding KernelCI to better understand state of
upstream kernel testing. It's more about missing parts rather than
present parts, so sorry if it all sounds a bit negative.

1. Do I understand it correctly that KernelCI is still mostly about
building/booting, it started running tests some time ago but few tests
are currently onboarded? Is there a full list of tests? I looked at
lava-kernel-tests repo, but on the dashboard I also seen "networking"
tests, so I am not sure if lava-kernel-tests is the full list. There
are plans to onboard more tests in the future, right?

2. Are there test coverage reports anywhere? Is it in plans?

3. Does KernelCI use any of KASAN, LOCKDEP, KMEMLEAK, FAULT_INJECTION,
DEBUG_OBJECTS, DEBUG_VM runtime debugging features?

4. Do I understand it correctly that test failures are currently not
reported in any way (other than being shown on the dashboard)? Who
looks at the dashboard? Is there constant monitoring of all results?
Is automatic reporting in plans?

5. There is no pre-commit testing, right?

6. What are the major TODO items for near/mid-term future?

7. What is rough approximation of total engineer-years spent on the
project? What are the major time sinks? Pain points?

Thanks in advance
