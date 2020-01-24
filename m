From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kenelci.org update - 2020-01-24
Message-ID: <8884eb18-efce-c686-98b6-d29c8f0edc5e@collabora.com>
Date: Fri, 24 Jan 2020 21:44:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: kernelci-members@groups.io

Technical Steering Committee minutes - 2020-01-21
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Guillaume: new staging instance
  * staging.kernelci.org has moved to Azure, pending a data volume to be =
added
  * still need Jenkins to be moved too
  * storage.staging.kernelci.org subdomain not updated yet, will do with =
the
    new Jenkins subdomain
  * SSH keys installed for admins

* Guillaume: frontend changes to show test results
  * work on-going, making steady progress now to replace boots with test
    results

* Kevin: sourcing new VM instances for kernelci.org production web servic=
es

* Kevin: kcidb
  * config_name, config_url added
  * how to start submitting new schema / fields to BQ?
    * Kevin to try using kci_submit
    * If doesn=E2=80=99t work, dump the database with "kcidb-query", recr=
eate with
      "kcidb-cleanup" and "kcidb-init", then re-upload the dump with
      "kcidb-submit".
  * when to enable in production?
    * scaling issues: still takes 2s to submit
      * Workaround: bundle updates
      * Possible solution: streaming inserts (non-free)
    * Need a "real" user of kcidb to see if it=E2=80=99s really useful ye=
t
      * Grafana experiments: OK for visuals, but not for reporting
      * minimal email report? links to Grafana

* Micha=C5=82: kci_rootfs
  * starting with vanilla debian/buster
  * next step is buster-v4l2


Advisory Board minutes - 2020-01-22
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* approved budget for 2020 so can start spending
* discussing mission statement and goals for the project in 2020
* KernelCI stickers will be available at FOSDEM


Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* kernelci-backend v2020.1.1
  * drop some HTTP DELETE handlers
  * fix PyMongo deprecation warnings
  * prune unused fields in test case and test group documents
  * remove dead code in several places
  * fix database index creation
  * stop storing boot results in test case documents (not useful)

* kernelci-frontend v2020.01
  * disable "Compare" view as it is a Beta feature and has broken for a w=
hile
  * fix broken comments in Javascript headers

* kernelci-core v2020-01-24
  * enable kci_rootfs YAML validation in Travis CI
  * add linux-5.4.y for stable and stable-rc
  * new buster-cros-ec rootfs with Chrome OS Embedded Controller test sui=
te


Best wishes,
Guillaume
