Return-Path: <spbnick@gmail.com>
From: "Nikolai Kondrashov" <spbnick@gmail.com>
Subject: Sharing Compass CI results with KCIDB
Message-ID: <96af4c4f-4fa4-2d59-1e8b-d286c319e314@gmail.com>
Date: Wed, 21 Apr 2021 10:28:14 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Wu Fengguang <wufengguang@huawei.com>
Cc: kernelci@groups.io

Hi Fengguang,

Tim Bird has recommended I contact you regarding Compass CI, which you 
presented at Linaro Connect this year.

We at Linux Foundation's KernelCI project are developing a system for 
aggregating kernel testing reports into a single database, dashboard, and 
e-mail notification system for use by kernel maintainers, developers, and 
researchers. The system is called "KCIDB" and I presented it at the same 
Linaro Connect this year:

     https://connect.linaro.org/resources/lvc21/lvc21-310/

We're already collecting data from six different kernel CI systems in our 
prototype database and dashboard:

     https://kcidb.kernelci.org

We are working on reaching developers with our data next.

I was wondering if you're doing any testing of public kernel trees at Compass 
CI, and if so, whether you'd be interested in contributing testing results to 
KCIDB as well.

We hope to make it easier for developers to access all testing resultsm and to 
replace the multiple different e-mail reports and dashboards they're receiving 
and accessing, with a single one, thus saving them time, effort, and 
frustration. Having your data in the database, your requirements accounted for 
in our implementation, and hearing your ideas of how this could be done, would 
help us towards that goal.

Would you be interested in joining us and contributing your data to KCIDB?

Thank you.
Nick
