Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: kselftest config option combinations
Date: Mon, 13 Jul 2020 13:09:54 -0700
Message-ID: <7h365vqir1.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Mathieu Acher <mathieu.acher@irisa.fr>
Cc: kernelci@groups.io

Hi Mathieu,

Since you're doing lots of kernel build combinations, I'm wondering if
you've explored the various combination of kselftest options and how
they might interact.

For the in-kernel selftests (c.f. tools/testing/selftest), each test
can provide a config fragment for the options it needs enabled in order
to run.  There's a make target (make kselftest-merge) which combines all
these fragments with an existing .config resulting in a new .config with
all the options enabled.

In testing this on some embedded boards, I'm finding the resulting
.config no longer boots.

This made me think of the work you're doing, and wondering if you have a
way to test this for known combinations of config options that don't
work together?

Kevin






