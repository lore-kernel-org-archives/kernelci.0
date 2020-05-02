Return-Path: <jbrunet@baylibre.com>
References: <5eabecbf.1c69fb81.2c617.628f@mx.google.com> <cc10812b-19bd-6bd1-75da-32082241640a@collabora.com> <20200501122536.GA38314@sirena.org.uk> <20200502134721.GH13035@sasha-vm> <20200502140908.GA10998@kroah.com>
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: stable-rc/linux-5.4.y bisection: baseline.dmesg.alert on meson-g12a-x96-max
In-reply-to: <20200502140908.GA10998@kroah.com>
Date: Sat, 02 May 2020 16:52:14 +0200
Message-ID: <1jd07mie3l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Guillaume Tucker <guillaume.tucker@collabora.com>, kernelci@groups.io, Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, stable@vger.kernel.org


On Sat 02 May 2020 at 16:09, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Sat, May 02, 2020 at 09:47:21AM -0400, Sasha Levin wrote:
>> On Fri, May 01, 2020 at 01:25:36PM +0100, Mark Brown wrote:
>> > On Fri, May 01, 2020 at 12:57:27PM +0100, Guillaume Tucker wrote:
>> > 
>> > > The call stack is not the same as in the commit message found by
>> > > the bisection, so maybe it only fixed part of the problem:
>> > 
>> > No, it is a backport which was fixing an issue that wasn't present in
>> > v5.4.
>> > 
>> > > >   Result:     09f4294793bd3 ASoC: meson: axg-card: fix codec-to-codec link setup
>> > 
>> > As I said in reply to the AUTOSEL mail:
>> > 
>> > | > Since the addition of commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow
>> > | > playback/capture if supported"), meson-axg cards which have codec-to-codec
>> > | > links fail to init and Oops:
>> > 
>> > | This clearly describes the issue as only being present after the above
>> > | commit which is not in v5.6.
>> > 
>> > Probably best that this not be backported.
>> 
>> Hrm... But I never queued that commit... I wonder what's up.
>
> I saw the Fixes: tag, but missed the changelog text.  My fault.
>
> I'll go drop it from everywhere, sorry about that.
>
> greg k-h

Hi everyone,

Sorry for the mess this seems to have triggered.

Indeed, with the Fixes tag, I understand why the patch has been picked
up. Even I thought that a backport would be OK, since the mistake was
quite old.

If I had wrote it correctly from the start, I would have found the
problem that was waiting for us in ASoC ... but the 2 errors cancelled
each other out.

It is only now that ASoC has been fixed that we found my mistake.

Again, sorry for the mess.
Thanks a lot for your time and effort on this
