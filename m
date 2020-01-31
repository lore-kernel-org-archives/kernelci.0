From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2020-01-31 #minutes
Message-ID: <375bae09-d215-173a-a1b4-5414e39f63c0@collabora.com>
Date: Fri, 31 Jan 2020 16:50:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: kernelci-members@groups.io

Technical Steering Committee minutes - 2020-01-28
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Kevin: kcidb: how to best migrate for new config_name, config_url field=
s?
  * Nikolai will do it (and document it for sysadmin notes)

* Matt: staging jenkins
  * Doing it as config-as-code config files
    * Anyone can spin up a local setup
    * We have extra config for github auth, nodes, triggers etc
  * Where do we store our secrets/credentials/sshkeys etc
    * https://www.passwordstore.org/
    * https://docs.chef.io/data_bags.html
  * Discussion:
    * builder-config2 + builder-config-data using git-crypt
    * Let=E2=80=99s continue with that, and see if there are any limitati=
ons

* Nikolai
  * pushing more RedHat data
  * starting to look at dashboards, etc.

* Guillaume
  * Updating the GitHub board with milestones to better coordinate cross-=
team
    work
  * Next test suites to run and align test case naming scheme: kselftest,=
 LTP
  * Face to Face meetings
    * aiming for a 1-day event at Plumbers (before or after)


Advisory Board minutes - 2020-01-29
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Mission statement:

To ensure the quality, stability and long-term maintenance of the Linux k=
ernel
by maintaining an open ecosystem around test automation practices and
principles.

* Objectives:
  * Maintainer buy-in
  * Broad adoption
  * Community collaboration
  * Membership growth

* Metrics are needed to see whether objectives are met.  This is somethin=
g for
  the TSC to solve.


Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

There is no production update this week.  Frequent issues can be seen wit=
h the
kernelci.org Jenkins server, some builds are taking a long time to start.=
  This
seems to be a network issue.  The latency to produce builds and test resu=
lts is
much greater than usual as a result, please bear with us while we fix the
problem.

Best wishes,
Guillaume
