MIME-Version: 1.0
From: "Milosz Wasilewski" <milosz.wasilewski@linaro.org>
Date: Fri, 5 Oct 2018 13:19:14 +0100
Message-ID: <CAJrz+7+ey-o8xEa9G_dkKzCz+HjGPLvf+jP9gC4ntt5VN8WFXw@mail.gmail.com>
Subject: KernelCI NG master plan
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Charles Oliveira <charles.oliveira@linaro.org>

Hi,

This is follow up to the discussion we had on Monday meeting. The idea
was also discussed at Linaro Connect in Vancouver so should not come
as a surprise.

The problem:
As we want to present test results filtering becomes an issue. There
are different users with different filtering needs. Current
implementation at kernelci.org sorts tests results by board.

Alternative implementation by Baylibre [1] sorts by build. There can
be countless other options for filtering tests and for each of them
someone would have to code that in the backend and frontend.

Proposed solution:
Replace backend with 'search engine'. Current proposals for the search
engines are: elastic search, graylog. But we're not limited to them.
One of the frontends should be a configurable dashboard (like Kibana
for ES).

Current frontend will have to stay, so it needs to be migrated to new
backend. If we move from redis-mongo to ES for example this would only
require changing search criteria (they're most likely not compatible).

Scope of the project:
1. get the list of possible backends (search engines)
2. get the list of possible configurable dashboards (Kibana etc.)
3. create proof of concept for new solution (with existing data) and
present for discussion

Once we get here, following steps might be:

4. select search engine to be used
5. start pushing data to both old and new backends
6. migrate current frontend to the new backend
7. enable configurable dashboard for the search engine
8. prepare set of predefined dashboards that should cover 90% of use
cases (mainly for test results)

Any comments are welcome. Together with Charles we're starting on 1-3 next week.

[1] http://kernelci.dev.baylibre.com:8080/test-build/

Best Regards,
milosz
