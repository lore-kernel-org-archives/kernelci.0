Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Need help to connect kernelci main instance with our lava-docker instance
In-Reply-To: <uXqW.1579619316616468927.7OCH@groups.io>
References: <uXqW.1579619316616468927.7OCH@groups.io>
Date: Tue, 04 Feb 2020 10:53:04 -0800
Message-ID: <7himkmkwvj.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, brown.teh@gmail.com, kernelci@groups.io

brown.teh@gmail.com writes:

> Hi all,
>
> I'm new to kernelci, started to setup a lava-docker instance and managed to run a basic job to qemu device recently. Now I'm amid of integrating an actual x86_64 board(running a yocto image) with the IPXE boot scenario , the integration is still halfway done though.
> After gone through some previously posted message thread,
> I have learned that in order to connect my LAVA instance to kernelci main frontend/backend instance there's couple of flow involved as following
> 1) kernelci-core: jenkins jobs to watch kernel trees for changes
> 2) kernelci-core: create LAVA jobs and submit to multiple LAVA labs(require LAVA instance token to be shared to kernelci admin group)
> 3) LAVA labs: run LAVA jobs on hardware/VMs etc.
> 4) LAVA labs: submit results to kernelci-backend(Required kernelci admin group to share their token to LAVA)
>
> Based on the context above, I have couple of questions to ask before I can proceed with the connection enabling
> 1) If I'm just want to add my LAVA instance to the official main kernelci instance, other than sharing my LAVA instance API token and requesting kernelci API token from kernelci admin group, do I still have to setup the kernelci-core myself?

No. You do not have to setup kernelci-core yourself.

Once we have your LAVA API token, you just have to send a patch/PR to
the lab-configs.yaml file[1].

> 2) If the new device type that I'm integrating is required a custom
> kernel source in order to boot up the image, will kernelci support the
> build of custom kernel artifacts, if yes where can I feed the custom
> kernel source information?

Right now, we only support targets that boot mainline using upstream
defconfigs.  If it only requires mainline with a Kconfig fragment, we
can typically arrange to have that configuration built, but we like to
understand why a given target cannot boot with mainline.

> 3) For the communication between kernelci and LAVA instance, what are the ports that are involved? If it's REST API based, can I assume it's mostly only involving HTTP/HTTPS protocol? (The reason behind this question is I'll need to apply for a DMZ connection behind a corporate network, so might need the details of ports involved)

It's XML-RPC over HTTPS.

Kevin

[1] https://github.com/kernelci/kernelci-core/blob/master/lab-configs.yaml
