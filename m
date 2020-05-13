Date: Wed, 13 May 2020 14:51:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: kernelci.org transitioning to functional testing
Message-ID: <20200513125150.GA1084253@kroah.com>
References: <66aae710-1ee9-fb67-1a1b-997eeb70dc04@collabora.com>
MIME-Version: 1.0
In-Reply-To: <66aae710-1ee9-fb67-1a1b-997eeb70dc04@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io, kernel-build-reports@lists.linaro.org, automated-testing@lists.yoctoproject.org, linux-next@vger.kernel.org, stable@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, agross@kernel.org, qcomlt-patches@lists.linaro.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, ulf.hansson@linaro.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-pm@vger.kernel.org, vireshk@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, kernel@collabora.com, kernelci@baylibre.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, May 13, 2020 at 12:13:24PM +0100, Guillaume Tucker wrote:
> As kernelci.org is expanding its functional testing
> capabilities, the concept of boot testing is now being
> deprecated.
> 
> Next Monday 18th May, the web dashboard on https://kernelci.org
> will be updated to primarily show functional test results
> rather than boot results.  The Boots tab will still be
> available until 5th June to ease the transition.
> 
> The new equivalent to boot testing is the *baseline* test suite
> which also runs sanity checks using dmesg and bootrr[1].
> 
> Boot email reports will eventually be replaced with baseline
> reports.  For those of you already familiar with the test email
> reports, they will be simplified to only show regressions with
> links to the dashboard for all the details.
> 
> Some functional tests are already being run by kernelci.org,
> results have only been shared by email so far but they will
> become visible on the web dashboard next week.  In particular:
> v4l2-compliance, i-g-t for DRM/KMS and Panfrost,
> suspend/resume...
> 
> And of course, a lot of functional test suites are in the
> process of being added: kselftest, KUnit, LTP, xfstests,
> extended i-g-t coverage and many more.
> 
> The detailed schedule is available on a GitHub issue[2].

Very cool stuff, thanks so much to everyone involved for making this
happen, it's really helpful.

greg k-h
