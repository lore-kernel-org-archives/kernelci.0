Return-Path: <dan.rue@linaro.org>
Date: Tue, 23 Apr 2019 12:36:31 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-04-23 #minutes
Message-ID: <20190423173631.kgcbxmewtota4rhc@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Guillaume, Mark, Daniel, Dan, Guenter, Matt, Anders, Kevin,
  Michal

- gtucker
  - kci_build PR now being tested on staging
  - Email recipients for staging reports?
    - [drue] +1 please add me
    - [Matt] as well
    - [broonie] Sure, my mail server deserves to be punished
    - [khilman] yes, please
  - [drue] any update/info on the downtime on ci.kernelci.org from the
    weekend?
    - [Matt] I noticed the 2 baylibre builders havent come up
      - one is connected to staging
      - [khilman] other one is old/unused, I just deleted
      - [Matt] ack
    - Box became unavailable in hetzner. Needed to do a reboot through
      collabora’s hetzner interface to recover. Unknown root cause.

- Anders
  - Quickhit on x86 it takes 4-16min
  - Ltp-math 4-11min
  - Ltp-ipc 3-6min, hikey 8-11m
  - Ltp-timers 3-11min
  - [drue] what’s going on with ltp rootfs pr?
    - [anders] On me to get back with some numbers… like above I guess
      =)
  - Need to demonstrate it running under the debos build on an arm64
    host

- Broonie
  - Who has admin access to the builders/core services?
    - [anders] where’s the doc?
      - Private google doc that contains lots of admin secrets. Matt
        will create new doc with contact details for server owners which
        more people can view.
        - [drue] maybe secrets should be managed more properly too… i
          don’t have a suggestion
        - [Matt] Suggestions welcome :D
          - Lastpass or 1password? Dunno if either’s free version would
            cover this usecase.
          - [broonie] Not sure either of them is substantially better
            than the doc for secrets - fundamentally it’s just about
            sharing access to something where you can read everything,
            the ACL support in google docs is actually pretty advanced.

- Misc Discussion
  - Docker daemon on the build slave died quietly on staging gce host
    last week. Not happening in production gce - unknown cause.
  - [Kevin] Any updates on elastic search work
    - [matt] I will ask the Linaro guys to join meeting next week
  - LF project
    - MSFT joining
    - Kevin had brief call w/Redhat (Veronica) about joining

