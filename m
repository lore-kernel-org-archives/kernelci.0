Return-Path: <dan.rue@linaro.org>
Date: Mon, 26 Nov 2018 13:37:12 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Meeting Minutes for 2018-11-26
Message-ID: <20181126193712.3ugwrtwmm2jk5vnc@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Ana, Anders, Charles, Dan Rue, Daniel, Guenter, Guillaume,
  Mark, Matt, Milosz
- [gtucker]
  - Infrastructure issues:
    - Tyler’s garage builders have been put offline because bandwidth
      was so slow it would cause build failures timing out while
      downloading the source tarball
      - [matt] Leave them off
    - Some Azure servers are down simply because of SSH port
      configuration issues - this has a big impact on our build capacity
      (kernelci3.westeurope.cloudapp.azure.com,
      kernelci5.westeurope.cloudapp.azure.com)
      - [matt] SSH ports being changed now
    - The kernelci.org server is starting to show its limits - while we
      surely can optimise the MongoDB transactions when saving test
      cases, we should really upgrade.  Should we wait for the LF
      project to fund this?
      - [milosz] is this HA issue on frontend or scaling of backend?
    - Both staging.kernelci.org and kernelci.org are running old Debian
      Jessie and should really be upgraded to Debian Stretch.  The
      Ansible config would first need to be tested on a temporary test
      server instance (local VM?) to check it actually works from
      scratch on Stretch.
      - [ana] I installed backend/frontend in stretch using ansible 2
        months ago and it worked OK
      - Matt to check with costs/time for upgrading services to stretch
        (and newer hardware)
    - There are still occasional issues with Jenkins build jobs not
      propagating errors correctly since the move to Docker containers.
       The LTS release we’re using (2.138) is showing this but not more
      recent version such as 2.148 which I’ve tested locally. Should we
      stick to LTS and report this, or use a more recent version in
      staging and production?
      - [matt] will try the latest jenkins version
  - Some trees failed to get their build and boot/test data imported
    correctly into the database on Friday.  I’ve restarted the Celery
    service and it now seems fine, not sure what the root cause was but
    may be due to lack of RAM or the server CPUs can’t keep up with the
    load (see point above about the server showing its limits)
    - [milosz] I see similar issues in SQUAD - tasks on Rabbit/Celery
      eating a lot of memory and stalling the whole service. The
      “solution” is to restart the worker when it reaches certain amount
      of allocated memory. Restart takes effect after the current tasks
      were completed (not mid task kill).
    - http://docs.celeryproject.org/en/latest/userguide/workers.html#max-memory-per-child-setting
  - Starting to work on bisecting “snapshot” trees such as linux-next
    this week.

