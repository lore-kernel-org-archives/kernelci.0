Date: Wed, 26 Jun 2019 08:21:24 +1000
From: Naveen Nathan <naveen@lastninja.net>
Subject: Who should I talk to about making kernel changes that could potential break CI
Message-ID: <20190625222124.GA79586@armakuni.lastninja.net>
MIME-Version: 1.0
List-ID: <info.kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: info@kernelci.org

Hi,

A few months ago I submitted a patch [1] to make /dev/urandom block until
sufficient entropy is gathered; this is blocked by a kernel config
option CONFIG_SECURE_URANDOM=[yn].

If set, this will break systemd systems.

If set, this will probably break Kernel CI (afaik tests are run on
Debian which use systemd) - specifically when randconfig is used
and the config option is set to y.

There is no longer a 'CONFIG_EXPERIMENTAL', to depend/block on, so
I cannot rely on that going forward.

I was hoping to work with the Kernel CI peeps to see if we can prepare
the Kernel CI system to support this config option.

Thanks,
Naveen

[1]: https://lore.kernel.org/patchwork/patch/1079511/
