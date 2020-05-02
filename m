Date: Sat, 2 May 2020 09:47:21 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: Re: stable-rc/linux-5.4.y bisection: baseline.dmesg.alert on meson-g12a-x96-max
Message-ID: <20200502134721.GH13035@sasha-vm>
References: <5eabecbf.1c69fb81.2c617.628f@mx.google.com>
 <cc10812b-19bd-6bd1-75da-32082241640a@collabora.com>
 <20200501122536.GA38314@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200501122536.GA38314@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, Jerome Brunet <jbrunet@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernelci@groups.io, Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, stable@vger.kernel.org

On Fri, May 01, 2020 at 01:25:36PM +0100, Mark Brown wrote:
>On Fri, May 01, 2020 at 12:57:27PM +0100, Guillaume Tucker wrote:
>
>> The call stack is not the same as in the commit message found by
>> the bisection, so maybe it only fixed part of the problem:
>
>No, it is a backport which was fixing an issue that wasn't present in
>v5.4.
>
>> >   Result:     09f4294793bd3 ASoC: meson: axg-card: fix codec-to-codec link setup
>
>As I said in reply to the AUTOSEL mail:
>
>| > Since the addition of commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow
>| > playback/capture if supported"), meson-axg cards which have codec-to-codec
>| > links fail to init and Oops:
>
>| This clearly describes the issue as only being present after the above
>| commit which is not in v5.6.
>
>Probably best that this not be backported.

Hrm... But I never queued that commit... I wonder what's up.

-- 
Thanks,
Sasha
