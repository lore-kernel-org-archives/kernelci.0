Return-Path: <dan.rue@linaro.org>
Date: Tue, 18 Jun 2019 15:34:57 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-06-18 #minutes
Message-ID: <20190618203457.zz52e4qk6uatzahn@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Guenter, Daniel, Guillaume, Matt, Kevin, Mark, Dan, Nick

- Guillaume
  - Working on i-g-t tests, new buster-igt rootfs
  - Investigating the issue with conflicts treated as regressions

- Nick
  - Do we have coverage of stable branches?
    - Yes. LTS and 5.1
    - 4.9 stable regression with kslr on db410c reported last week
      - [mark] No kaslr configs for booting, just defconfigs
        - [nick] any strong technical reason why it’s not in defconfig?
  - Feature requests around better reporting for clang.
    - E.g. Pending-next emailing clang list about gcc errors
    - How could we more easily narrow down emails
    - [matt] i just replied about pending-next and will fix that issue
      - https://github.com/kernelci/kernelci-core/pull/97
    - [mark] When you turn on clang for linus’s tree you’ll want to turn
      on for pending-next
  - Clang on stable?
    - [guenter] we carry patches to get it building with clang
    - [nick] i can build many arch’s on many branches with clang,
      defconfigs
    - Allmodconfig?
      - No, and not built on stable on kernelci anyway
    - [kevin] We should try with latest stable (5.1)
    - [matt] if you provide a matrix of trees/arch’s/configs i can run a
      build of those through staging and see what they look like. Send
      an email to the kernelci mailing list

- Any update on alias support?  (Dan?)
  - [drue] Works, but kernelci won’t ‘discover’ devices using device
    aliases
    - https://validation.linaro.org/api/help/#scheduler.aliases.list
    - I think we need to patch
      https://github.com/kernelci/kernelci-core/blob/2561a4ad32fd0364873a6231c8cd13381e85d3a2/lava-v2-submit-jobs.py#L48
    - Alias for x15 applied on lkft.validation.linaro.org
      - https://gist.github.com/danrue/0153819b450500464c594e6dc38045cc

- Matt
  - Got some email recipient changes I’ll push tonight if we’re doing an
    upgrade tomorrow

- Kevin
  - exposing LAVA to the internet?  
    - [drue] what’s the concern?
      - Fwiw i put mine on a private vlan/dmz, and i run it behind
        cloudflare
    - [matt] it’s meant to be used publicly
    - [guillaume] it’s django, so, it’s reasonable to put it on the
      internet.
    -
  - How does bisect handle failures for lots of failures
    - [gtucker] there’s a filter in the backend to remove duplicates
      using bits of metadata. Same branch, same revisions, i think
      anything within that will be treated as a dup.

- broonie
  - Lots of failures in lab-baylibre yesterday in -next, look legit
    though (sunxi boards mostly)
