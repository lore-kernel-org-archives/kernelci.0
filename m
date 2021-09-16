MIME-Version: 1.0
From: "Veronika Kabatova" <vkabatov@redhat.com>
Date: Thu, 16 Sep 2021 18:41:31 +0200
Message-ID: <CA+tGwnnZv6HzFanwVcyAc=DQb-Eh1pdA9JnE+mcLYS-UiUOFFg@mail.gmail.com>
Subject: CKI DataWarehouse now publicly available
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: automated-testing@lists.yoctoproject.org, kernelci@groups.io
Cc: "Malerba, Inaki" <imalerba@redhat.com>, Ondrej Kinst <okinst@redhat.com>

Hello,

after a very long time, we're excited to announce the CKI DataWarehouse is now
publicly available at

https://datawarehouse.cki-project.org/

DataWarehouse is a kernel test result database and web dashboard based on
KCIDB. On top of KCIDB structure, it offers known issue detection as the main
feature, as well as some statistics about test and host confidence.

The database will be populated with new CKI results as testing runs.


All code is publicly available and welcomes contributions ;) :

DataWarehouse: https://gitlab.com/cki-project/datawarehouse
Python API wrapper: https://gitlab.com/cki-project/datawarehouse-api-lib/

Some documentation is available at https://cki-project.gitlab.io/datawarehouse/


It is possible to generate text reports via reporter:

https://gitlab.com/cki-project/reporter

Reporter uses the API wrapper on the background, and can be used to create an
email friendly report out of the data in DataWarehouse.


Everyone is welcome to look around, please let us know if you have any
questions or ideas for improvement! And of course, all the praise for this
work goes to Inaki and Ondrej as the maintainers of DataWarehouse and reporter,
respectively.


Veronika and the CKI team

