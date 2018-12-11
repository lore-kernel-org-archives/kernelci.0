Subject: Re: [kernelci] next/master boot bisection: next-20181210 on meson-gxl-s905x-libretech-cc
References: <5c0ef32c.1c69fb81.72744.44d8@mx.google.com>
 <CAOi56cV9NL2bVnALDEs_XOv96Y=bFiVcsNJ3E0KPC+n1uXNcjw@mail.gmail.com>
 <20181211005359.GC3004@sirena.org.uk>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <fff93168-d5b1-9997-c562-41e26461ba7a@collabora.com>
Date: Tue, 11 Dec 2018 08:58:28 +0000
MIME-Version: 1.0
In-Reply-To: <20181211005359.GC3004@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernal.org>, Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io

On 11/12/2018 00:53, Mark Brown wrote:
> On Mon, Dec 10, 2018 at 03:38:42PM -0800, Kevin Hilman wrote:
> 
>> Also, it might be helpful for folks not familiar with kCI to know what
>> this "bisection report" is about.  It's not obvious that what's being
>> bisected is a boot failure.  It might be useful to show the boot
>> failure, and have a link to a full boot log for the original failure.
> 
> It does say in the subject that it's a boot - perhaps we should put
> something in the body as well?  It doesn't actually get mentioned there.

Parameters:
  Tree:       next
  URL:        http://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  Branch:     master
  Target:     meson-gxl-s905x-libretech-cc
  Lab:        lab-baylibre
  Config:     defconfig+CONFIG_CPU_BIG_ENDIAN=y
  Plan:       boot
 

The "Plan" parameter here says it's a "boot".

Maybe we could have a link to a wiki page explaining what our
test plans are, in case the recipients aren't familiar with any
test plan.  Also, maybe "Test Suite" would be easier to
understand than "Plan".

Guillaume
