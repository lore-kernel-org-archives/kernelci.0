Return-Path: <dan.rue@linaro.org>
Date: Mon, 17 Dec 2018 09:49:26 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2018-12-17 #minutes
Message-ID: <20181217154926.6qyfw2a6y5oidkny@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Charles Oliveira, Daniel Díaz, Guenter Roeck, Guillaume
  Tucker, Milosz Wasilewski, Dan Rue, Mark Brown

- [drue] I received this when replying to -stable RCs on Saturday: “Your
  message wasn't delivered to patches@kernelci.org because the address
  couldn't be found, or is unable to receive mail.”
  - Tyler deleted it as it’s not used for anything and he’s still paying
    out of pocket for hosting the domain
    - Greg will need to remove this from the list of recipients for
      stable-rc

- [chaws] any comments on this PR?
  https://github.com/kernelci/kernelci-core-staging/pull/68
  - [drue] I spoke to Kevin about this.. You can get all the historical
    callbacks from kernelci
    - [Milosz] we have that for the prototype - This will give us a more
      live view
  - [guillaume] Have you looked at supporting elasticsearch as a backend
    instead of or in addition to mongodb?
    - [milosz] we haven’t considered that yet
    - [guillaume] It would be good to compare our current system with
      the ES-powered one you’re trying out now, for each feature that we
      have: creating data on one hand (importing logs, importing test
      results, tracking regressions, sending email reports, triggering
      bisections) and searching the results on the other hand.  Also
      making the very kernelci-specific code we have independent of the
      backend would make it more sustainable (i.e. a portable Python
      package).

- [mark] let’s cancel christmas eve and new year’s eve meetings.

- [gtucker] I’m starting to look into build configurations this week,
  the idea being to have a build-configs.yaml in the same way that we
  have test-configs.yaml.  The file would contain all the kernel trees,
  with associated configurations to build using filters, reference trees
  and branches to use in bisections and the list of recipients for the
  various email reports.

