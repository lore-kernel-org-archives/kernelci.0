Return-Path: <dan.rue@linaro.org>
Date: Mon, 20 Apr 2020 11:36:28 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: kci_build proposal
Message-ID: <20200420163628.wmbc7f7vuvqsbdhw@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hey Everyone!

I've been working on a kernel building service/api that's designed to perform
massive numbers of builds. The actual kernel build implementation reuses
kernelci's kci_build script.

So far we have not had to modify kernelci-core's kci_build, but we're
approaching a point where we think we're going to have to modify it
fundamentally to meet our needs. I would really like to continue sharing a
build implementation with kernelci, but some of the changes needed are
architectural in nature, and so I'd like to share a brief proposal for
consideration:

Standalone python-based kernel builder with the following properties:
- Independent python package (library and cli) that only does a local kernel
  build
- Takes as arguments things like architecture, toolchain, kernel config, etc.
- Dockerzed toolchain environments are supported directly (e.g. it will run
  "docker run make")
- Builds are done within the context of an existing kernel tree (doing git
  checkout, git fetch, etc are out of scope)
- Artifacts go to some named or default directory path. Uploading them
  elsewhere is out of scope.
- Exception handling is built in and makes it usable as a python library
- Logging is built in with flexibility in mind (log to console, verbose or
  silent, log to file, etc.)
- Simple, one-line dockerized reproducers are given as a build artifact, for
  reproducing builds locally.
- Partial build failure support - e.g. what if kselftest fails but the rest of
  the build passes?
- Rigorous unit testing
- Implementation is modular enough to support things like a documentation build
  and other targets in the tree such as various tools/, sparse checker,
  coccinelle, etc.
- Support for kernel fragement files or urls in addition to supporting
  individual kernel config arguments

Use Case Examples:
- Install using pip, build using the cli interface
  - "pip install --user kernel-builder; cd linux; kernel-builder --arch arm64 --toolchain clang-9"
- Run using a published docker container. This example would need permission to
  launch additional docker containers to perform the build steps.
  - "docker run kernel-builder --arch arm64 --toolchain clang-9"
- Install using pip, and use it from python as a library
  - "import kernel-builder"

In the example above, "kernel-builder" is a placeholder for whatever the name
would be.

The artifacts produced would be similar to the set of artifacts kci_build
produces today, with the addition of a build reproducer script and probably
some differences in metadata files.

Docker support would be optional (you could use a locally installed toolchain),
but allows for arbitrary toolchains to be available and perfect
reproducibility.

It's hard to change kci_build to be anything like this because it's tightly
coupled with the kernelci-core repo, and kernelci itself. The design above also
fundamentally changes how the builder interfaces with docker, such that it
becomes supported directly rather than something that's implemented outside the
scope of the builder.

It's important that docker is supported directly because it makes the
reproducible build use-case a one-liner, it solves the problem of having to get
python and the builder into the build containers, and it allows for more
granular control of the build.

So, thoughts? How close or how far is this from the roadmap for kci_build as it
stands today? We are likely to start working on this soon, and would really
like to work together on it if possible.

Thanks for your feedback,
Dan
