Subject: Re: tuxbuilds in kcidb?
References: <20210113001320.qreaohq2hzzmlxxu@jug>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <0fd95437-74c4-1ab0-d53e-41fd6fe4f759@redhat.com>
Date: Wed, 13 Jan 2021 13:00:11 +0200
MIME-Version: 1.0
In-Reply-To: <20210113001320.qreaohq2hzzmlxxu@jug>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, dan.rue@linaro.org

Hi Dan,

On 1/13/21 2:13 AM, Dan Rue wrote:
 > Hi Nikolai,
 >
 > I'm looking to see what it would take to integrate tuxbuild results with
 > kcidb, for users that opt-in. Would that be useful? The volume would
 > typically be something in the single digit thousands per day.

Absolutely! It would be awesome to get tuxbuild results :)

We should be able to handle the volume, and if not, we will fix our service.

We're handling around 10K report objects per day now.

 > I took a look at the schema and came up with something like the
 > following:
 >
 >      {
 >          "builds": [
 >              {
 >                  "architecture": "arm64",
 >                  "compiler": "clang-10",
 >                  "config_name": "defconfig",
 >                  "config_url": "https://builds.tuxbuild.com/1myooFaScyEWNS87IO8HSMCu46d/config",
 >                  "id": "tuxsuite:1myooFaScyEWNS87IO8HSMCu46d",
 >                  "log_url": "https://builds.tuxbuild.com/1myooFaScyEWNS87IO8HSMCu46d/build.log",
 >                  "origin": "tuxsuite",
 >                  "revision_id": "e609571b5ffa3528bf85292de1ceaddac342bc1c",
 >                  "valid": true
 >              }
 >          ],
 >          "revisions": [
 >              {
 >                  "git_commit_hash": "e609571b5ffa3528bf85292de1ceaddac342bc1c",
 >                  "git_commit_name": "v5.11-rc3-32-ge609571b5ffa",
 >                  "git_repository_url": "https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline",
 >                  "id": "e609571b5ffa3528bf85292de1ceaddac342bc1c",
 >                  "origin": "tuxsuite"
 >              }
 >          ],
 >          "version": {
 >              "major": 3,
 >              "minor": 0
 >          }
 >      }
 >

The above looks good to go.
Only it would be good to add `"valid": true` to revisions (non-patched
revisions are always valid).

Just one question: is "tuxsuite" a (to-be) generally-known name of the
system which will be sending this? E.g. would you use this name at a
conference?

Just want to make sure it stays (relatively) stable and is recognizable.

 > I'm not sure how to represent the result of the build (pass/fail) - I
 > used "valid".

Yes, that's the right field for now.

I'm thinking about replacing it with "PASS"/"FAIL" "status", to match tests
after all, but not sure about that yet.

 > I'm not sure how to represent config - in this build's
 > case, the config was built from the following config target and
 > fragments:
 >
 >      "kconfig": [
 >          "defconfig",
 >          "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/lkft.config",
 >          "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/lkft-crypto.config",
 >          "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/distro-overrides.config",
 >          "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/systemd.config",
 >          "https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/virtio.config",
 >          "CONFIG_ARM64_MODULE_PLTS=y"
 >      ],

The schema accepts a URL for a single monolithic config file so far. This
might be inconvenient for some setups, but is more universal. You can specify
it using "config_url", and also specify a human-targeted and descriptive
"config_name". And you seem to be using them just fine in your sample :)

If you want to provide the above details, put them into the build's "misc"
object, and if there's demand for it, we can work on formalizing it.

 > There were some other fields I wasn't sure about, and I'm not sure how
 > specific some, like compiler, should be ("clang-10" vs "Debian clang
 > version 10.0.1-8+b1").

The schema doesn't specify this so far, but most reports seem to be using the
latter. E.g.:

     https://staging.kernelci.org:3000/d/build/build?orgId=1&var-dataset=kernelci04&var-id=kernelci:staging.kernelci.org:5ffe77964e2859804da07580

Regarding other fields, we can figure them out as we move forward. Your sample
is certainly good enough to start submitting.

Would you like to get credentials and submission parameters to start sending
your data to our "playground" setup, either manually or automatically?
I can send them to you right away.

The data will appear on this dashboard:

     https://staging.kernelci.org:3000/d/home/home?orgId=1&refresh=30m&var-origin=All&var-git_repository_url=All&var-dataset=playground_kernelci04

and you will be able to experiment freely without worrying about breaking
anything.

Once you feel you got it all set, I can flip the switch on permissions, you
change a single string in submission parameters, and then you will be
sending data to our "production".

Excited to be getting tuxbuild on board!
Nick

