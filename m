MIME-Version: 1.0
References: <bc6e9ed7-d98b-c4da-2a59-ee0915c18f10@gmail.com>
 <5ca35c47-6145-4ec1-6c05-3c46f436cb4d@gmail.com> <CAGS_qxpE9qGsS1LqaobVGFKFgV6TwvwNLR4e9PG5zsfPACSf_Q@mail.gmail.com>
 <5b2783a2-76bf-ce6f-89b1-d0fe05b80b82@gmail.com>
In-Reply-To: <5b2783a2-76bf-ce6f-89b1-d0fe05b80b82@gmail.com>
From: David Gow <davidgow@google.com>
Date: Sat, 14 May 2022 16:26:13 +0800
Message-ID: <CABVgOS=XcaheGrJ+n2DPUuE=MrJwDn5UWYcdQmfhZfHx2MDazg@mail.gmail.com>
Subject: Re: [RFC] KTAP spec v2: prefix to KTAP data
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Daniel Latypov <dlatypov@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, "Bird, Tim" <Tim.Bird@sony.com>, Brendan Higgins <brendanhiggins@google.com>, Jonathan Corbet <corbet@lwn.net>, Rae Moar <rmr167@gmail.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, kernelci@groups.io, KUnit Development <kunit-dev@googlegroups.com>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, May 13, 2022 at 1:26 AM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 5/12/22 10:25, Daniel Latypov wrote:
> > On Wed, May 11, 2022 at 11:01 PM Frank Rowand <frowand.list@gmail.com> wrote:
> >> ================================================================================
> >> #### discussion notes:
> >>
> >> - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
> >> PRO: minimally invasive to specification.
> >>
> >> - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
> >> CON:
> >>
> >> KTAP does not include any mechanism to describe the value of <prefix string>
> >> to test harnesses and test output processing programs.  The test output
> >> processing programs must infer the value of <prefix string> by detecting
> >> the <prefix string> in the "Version lines".
> >>
> >> The detection of a "Version lines" might be a match of the regex:
> >>
> >>    "^.*KTAP version 2$"
> >>
> >> This risks falsely detecting a "Version lines", but the risk is small???
> >
> > Agree this is a risk and also think it's probably small, but it's hard to say.
> > I think the $ anchoring the regex is probably safe enough.
> >
> > As noted earlier, this tracks with what kunit.py already does.
> > That was necessitated by dynamic prefixes such as timestamps, etc.f
>
> That is a good observation.  I nearly always have the prefix timestamp
> on my console output, and thus remove the timestamp with a regex when
> processing the data.
>

Yeah: the use of a prefix length for timestamps (and similar 'dynamic
prefixes') works really well as a way to automatically find KTAP
output in the kernel log.
It's definitely less useful as a way of disambiguating several
(potentially interleaved) KTAP streams, though.

Personally, my conception of KTAP is that the prefix is not a part of
the format, but a way (possibly one we should recommend in the spec)
to isolate KTAP output from (e.g.) the kernel log.
So, in theory, the processing pipeline for log -> result is:
[dmesg] ---<remove prefix>--> [KTAP] ---<parse>---> [results]

I wouldn't object to having the prefix be a part of KTAP if it were
particularly useful to anyone, though, and definitely agree we should
note ways to do it.

Either way, we do end up with two (slightly conflicting) uses of prefixes:
a) To isolate tests from a log.
b) To allow multiple concurrent tests.

For a), Alternative 1 seems obviously correct to me, since whatever
module is being used might not know what random prefixes are being
added to its log lines.
For b), either would work, but we do potentially get conflicts with a)
if we're trying to do both. So maybe alternative 2 makes sense for
that.

>
> > So I think this is probably a fine risk to take.
> >
> > I imagine we could add constraints of prefix string, e.g. must have []
> > around it, etc. if we want to try and minimize this risk.
> > But I don't know if it's necessarily worth it, given what we know right now.
> >
> > Along those lines, I think I like this approach (Alternative 1) more
> > than Alternative 2/2b.

I agree, though note that we might need both if we want two separate
types of prefix as mentioned above.

> > I'm not sure we need a structured way to specify metadata in KTAP yet?
> > The prefix seems like a reasonable candidate, but do others have ideas
> > of other bits of metadata we'd want to be able to declare?
> >

That's the important takeaway from Alternative 2: some generic way of
having metadata could be quite handy. (Of them, Alternative 2b feels a
little more like a hack than I'd prefer, albeit a clever one. I'd
prefer a cleaner "configuration info line" personally, though if
reusing the test results for test 0 makes parsing significantly easier
for others, it may nevertheless be worth doing.)

As for other pieces of metadata, there are all sorts of useful
information about the test which could be useful to store alongside
the results (what tool generated it, kernel version, etc), though
those might be more useful when saving results elsewhere than embedded
into the kernel output.

Equally, if we extended these configuration/info lines to individual
test/subtests, things like test size, originating module, etc could
potentially be stored. Suite/test init functions could potentially add
useful metadata, too (e.g., number of cores/threads for kcsan, etc).

None of those are, I think, quite compelling enough individually to
add a config system, though. If we already had one for the prefix, and
other things which are necessary for parsing, maybe...

-- David
