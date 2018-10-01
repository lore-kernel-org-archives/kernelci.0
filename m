Return-Path: <dan.rue@linaro.org>
Date: Mon, 1 Oct 2018 08:47:42 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Meeting Minutes for 2018-10-01
Message-ID: <20181001134742.psppadjjrgtrrvsn@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Ana, Anmar, Mark, Milosz, Dan

- [milosz] KernelCI-NG
  - Discussed with Kevin and Carlos at Connect
  - Using “search engine” approach as backend (elastic search as
    example)
  - Adjust current frontend to use the new backend
  - Support for new-great frontends (like ES Kibana) - Kevin’s example:
    https://goo.gl/yfZ6VK
    - [Dan] is worried about usability as a public website, performance
      given a heavy load. Would be nice to have use case out in the
      field we can look at.
  - Work on that solution to be parallel to the currently working
    solution
  - AI: Milosz will propose a study of how to use ELK for kernelCI on
    the mailing list
    - Milosz’s team has an engineer who will investigate this further.

- [Matt] Not attending, unwell
  - Plan to split the mips and x86 architectures this week as agreed,
    which unblocks changing production builds to use containers

- [Ana]
  - Backend: now merged and available in staging: update format for the
    test reports and possibility to select the tests suites to be
    included in the mail
  - Media subsystem pilot
