Subject: Re: kernelci/staging.kernelci.org baseline: 59 runs, 1 regressions (staging-20191009.1)
References: <5d9dc6c8.1c69fb81.ffa07.41ad@mx.google.com>
 <557293d8-dde3-b24a-988f-f9b90dccf5f4@collabora.com>
 <20191009142505.GE3929@sirena.co.uk>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <0e8e25e6-872e-7639-fea8-b743bc9d9913@collabora.com>
Date: Wed, 9 Oct 2019 15:40:22 +0100
MIME-Version: 1.0
In-Reply-To: <20191009142505.GE3929@sirena.co.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: mgalka@collabora.com, alexandra.pereira@collabora.com, dan.rue@linaro.org, matthew.hart@linaro.org, kernelci@baylibre.com, anders.roxell@linaro.org, kernelci@groups.io

On 09/10/2019 15:25, Mark Brown wrote:
> On Wed, Oct 09, 2019 at 12:53:10PM +0100, Guillaume Tucker wrote:
>> On 09/10/2019 12:38, kernelci.org bot wrote:
> 
>>> run | platform                     | arch   | lab          | compiler | defconfig                    | errors
>>> ----+------------------------------+--------+--------------+----------+------------------------------+-------
>>> 40  | qemu_arm64-virt-gicv2        | arm64  | lab-baylibre | gcc-8    | defconfig                    | 1/5   
> 
>> Any thoughts on showing measurements in test reports, i.e. the
>> number of lines with emergency messages in this case?
> 
> The 1/5 bit is a bit weird - from the column title I'd expect it to be a
> count of errors, but 1/5 sounds like 5 is what we're aiming for.
> Perhaps just a count?

Yes that's not new but it's not great either, it means 1 failure
among 5 tests.  I think we should rather have the number of
passes and total as that's more intuitive, and replace "errors"
with "results" in the column title.

Showing just the number of failures also works but because we
don't have a functional web frontend yet it's actually very
helpful to know how many tests were run, to see whether it's the
expected number.  We should definitely be able to revisit and
simplify things in these emails once we can refer to a web page
with all the details.

>> It's not exactly great, but I don't know how to make something
>> generic and still more useful without doing a lot of redesign at
>> several levels.  Ideally we should be showing the log lines
>> themselves in the email, like we do with builds, but that's not
>> so easy to do with LAVA.  I guess the next step would be
>> extracting the log lines associated with each test case as they
>> should be there. Then we would be using that rather than storing
>> the number of lines in a "measurement".
> 
> OTOH if the log lines for all the boards end up in the mail the mail
> might get a bit big - this feels like something where being able to go
> to the web UI to figure things out might be better, at least for a big
> summary report like this.

It only shows the number of lines at the critical, alert or
emergency levels from dmesg as these are considered like problems
that need to be fixed pretty much like boot failures.

And yes, it can grow rather long.  So again, once we have a web
frontend we can simplify the reports to only show 2nd order
diffs: regressions that appear and regressions that get fixed.

Guillaume
