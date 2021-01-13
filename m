Return-Path: <dan.rue@linaro.org>
Date: Tue, 12 Jan 2021 18:13:20 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: tuxbuilds in kcidb?
Message-ID: <20210113001320.qreaohq2hzzmlxxu@jug>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>

Hi Nikolai,

I'm looking to see what it would take to integrate tuxbuild results with
kcidb, for users that opt-in. Would that be useful? The volume would
typically be something in the single digit thousands per day.

I took a look at the schema and came up with something like the
following:

    {
        "builds": [
            {
                "architecture": "arm64",
                "compiler": "clang-10",
                "config_name": "defconfig",
                "config_url": "https://builds.tuxbuild.com/1myooFaScyEWNS87IO8HSMCu46d/config",
                "id": "tuxsuite:1myooFaScyEWNS87IO8HSMCu46d",
                "log_url": "https://builds.tuxbuild.com/1myooFaScyEWNS87IO8HSMCu46d/build.log",
                "origin": "tuxsuite",
                "revision_id": "e609571b5ffa3528bf85292de1ceaddac342bc1c",
                "valid": true
            }
        ],
        "revisions": [
            {
                "git_commit_hash": "e609571b5ffa3528bf85292de1ceaddac342bc1c",
                "git_commit_name": "v5.11-rc3-32-ge609571b5ffa",
                "git_repository_url": "https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline",
                "id": "e609571b5ffa3528bf85292de1ceaddac342bc1c",
                "origin": "tuxsuite"
            }
        ],
        "version": {
            "major": 3,
            "minor": 0
        }
    }

I'm not sure how to represent the result of the build (pass/fail) - I
used "valid". I'm not sure how to represent config - in this build's
case, the config was built from the following config target and
fragments:

    "kconfig": [
        "defconfig",
        "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/lkft.config",
        "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/lkft-crypto.config",
        "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/distro-overrides.config",
        "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/systemd.config",
        "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/virtio.config",
        "CONFIG_ARM64_MODULE_PLTS=y"
    ],

There were some other fields I wasn't sure about, and I'm not sure how
specific some, like compiler, should be ("clang-10" vs "Debian clang
version 10.0.1-8+b1").

Let me know what you think!

Thanks,
Dan
