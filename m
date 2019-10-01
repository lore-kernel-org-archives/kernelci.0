Return-Path: <dan.rue@linaro.org>
Date: Tue, 1 Oct 2019 16:37:29 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-10-01 #minutes
Message-ID: <20191001213729.wzl4oiqfs76erwgn@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Here are the minutes from today's as well as last week's kernelci
meetings.

2019-10-01
- Attendees: Mark, Michał, Kevin, Guillaume
- Guillaume
  - Baseline test plan:
    - Initial implementation enabled in production
    - Dynam ic table column widths fixed in email reports
    - Login test case added
    - Still needed: show number of lines (measurements)
  - kcidb
    - Prepared instructions for BigQuery account set-up (PR to come
      soon)
    - Tried locally with separate account and sample.json
    - Looking into how to wire this up in kernelci-backend
- Kevin
  - kcidb: new schema
    - initial experiment to export kernelci from mongodb to new schema:
      https://github.com/khilman/kcidb/tree/wip/kernelci 

2019-09-24
- Attendees: Daniel, Guillaume, Kevin, Mark, Michał, Nikolai
- Kevin
  - build01.baylibre.com still needed (currently connected to staging). 
    Load stats graph not working, so I can’t see how busy it is
  - exploring the Arm workload-automation tool:
    https://github.com/ARM-software/workload-automation
- gtucker
  - Baseline test plan:
    - Initial implementation enabled on staging, enabling now in
      production
    - Not sending reports yet other than for kernelci team
    - Adding login test case to all test plans using LAVA callback
      information
    - Improving formatting of summary table with dynamic widths
    - Still need to show number of kernel messages (i.e. measurements)
  - To replace boot tests with baseline:
    - Enable simple bisections for single test case failures
    - Check that all boot failures are also shown in baseline reports
    - Minimal fixes to the front-end for test results
  - Common database discussion:
    - Dashboard tools: Grafana, DataStudio
    - Waiting for regular user tokens before pushing more data
    - Tool to convert current KernelCI schema to the new BQ one
