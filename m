MIME-Version: 1.0
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Fri, 16 Nov 2018 12:52:16 +0000
Message-ID: <CAH+k93Fy4sFGYMPVBuOcXwh4_ANt2qdCLMSCRzEjeEihJ1_Ekw@mail.gmail.com>
Subject: Multiple compiler support in the backend
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi all,

Just wanted to clear up what my kernelci-backend PR [1] is for.

It introduces a build-environment variable to the build document,
which will allow the backend to distinguish between builds of the same
defconfig, but in a different environment. This variable is required
and requests without it will be dropped, to stop builds from
overwriting each other on the storage filesystem.

For kernelci.org usage, the environment difference will the compiler,
allowing our builders to push builds from our different docker images,
but as it's just a string, I'm hoping that the name build-environment
will work for other use cases.
There is already a compiler field which is populated by the backend
from the build.json and some simple parsing.

There is a matching PR [2] to kernelci-core-staging to add a
build-environment string to our builds (example:
docker-kernelci/build-gcc-7_arm64) but it has been suggested this
could be shortened to 'gcc-7' which I'm happy to change.

For the frontend, this change "just works", because build.py is now
populating the file_server_resource field, all the URLs on the build
information pages will be correct.

I would really like to get this deployed to staging for testing and
then rolled out ASAP as it's a requirement for starting builds with
compilers other than GCC, and multiple versions of GCC.


[1] https://github.com/kernelci/kernelci-backend/pull/86
[2] https://github.com/kernelci/kernelci-core-staging/pull/43
