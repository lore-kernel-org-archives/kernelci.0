MIME-Version: 1.0
References: <bc6e9ed7-d98b-c4da-2a59-ee0915c18f10@gmail.com>
In-Reply-To: <bc6e9ed7-d98b-c4da-2a59-ee0915c18f10@gmail.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Thu, 12 May 2022 08:12:22 -0700
Message-ID: <CAGS_qxreTLFp1VvMd07AZhE9wbgxR5bXgeJSyW-iWWoA5qs79g@mail.gmail.com>
Subject: Re: [RFC] KTAP spec v2: prefix to KTAP data
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Frank Rowand <frowand.list@gmail.com>
Cc: David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>, Jonathan Corbet <corbet@lwn.net>, rmr167@gmail.com, guillaume.tucker@collabora.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 11, 2022 at 10:59 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> In the middle of the "RFC - kernel test result specification (KTAP)" thread,
> started in August 2021, Tim Bird made a suggestion to allow a prefix to the
> KTAP data format:
>
> > Just as a side note, in some Fuego tests, it was very useful to include an identifier
> > in thethe prefix nested tests.  The output looked like this:
> >
> > TAP version 13
> > 1..2
> > [batch_id 4] TAP version 13
> > [batch_id 4] 1..2
> > [batch_id 4] ok 1 - cyclictest with 1000 cycles
> > [batch_id 4] # problem setting CLOCK_REALTIME
> > [batch_id 4] not ok 2 - cyclictest with CLOCK_REALTIME
> > not ok 1 - check realtime
> > [batch_id 4] TAP version 13
> > [batch_id 4] 1..1
> > [batch_id 4] ok 1 - IOZone read/write 4k blocks
> > ok 2 - check I/O performance
> >
> > Can I propose that the prefix not be fixed by the spec, but that the spec indicates that
> > whatever the prefix is on the TAP version line, that prefix must be used with the output for
> > all lines from the test (with the exception of unknown lines)?

Just chiming in since I didn't see it mentioned after a quick skim of
the original thread:

This is already basically the behavior of kunit.py's TAP parser since
commit afc63da64f1e5e41875c98707020e85050f8a0c5
Author: Heidi Fahim <heidifahim@google.com>
Date:   Mon Mar 16 13:21:24 2020 -0700

    kunit: kunit_parser: make parser more robust

    Previously, kunit_parser did not properly handle kunit TAP output that
    - had any prefixes (generated from different configs e.g.
    CONFIG_PRINTK_TIME)
...

The notable difference is that only the prefix _length_ is fixed, not
the contents of the string itself.

So ignoring a dynamic prefix is a practical necessity if we want to
parse TAP from kernelspace/printk across a range of configs.
But I don't know if this dynamic version is worth including in the spec.
The static prefix makes more sense to me to formalize, and if we go
down that route, at least kunit.py will already be compliant :)

Daniel
