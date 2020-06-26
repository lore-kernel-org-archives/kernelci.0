From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Subject: Bisections with KCIDB
Message-ID: <6cc1880f-456f-2c4f-2ac8-53bc321028ee@redhat.com>
Date: Fri, 26 Jun 2020 12:13:29 +0300
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi everyone,

Here are some ideas on how we can implement bisections with KCIDB.
Please keep in mind that I know little how it currently works in KernelCI.
Don't hesitate to correct, or share your ideas, please.

So, as I understand it, the objective is to only notify developers of a test
failure once the particular commit breaking it is found.

For that purpose, I think we can introduce a new (optional) field into
revision objects: "parent_id", pointing to the direct previous revision.

In the case of pure-commit revisions that would be the revision for the
parent commit. In the case of patched revisions that would either be the
pure-commit revision the patches were applied to, or the previous version of
the same patchset (if any).

We should be able to make the result-notification algorithm only send
the failure report if there's a parent revision (field exists and linked
revision object exists), the same (failing) test was executed for it on
similar hardware with a similar build, and it passed.

Finally, we could have the CI systems listen for incoming reports (on the same
message bus which is used to submit them), look at each failing test they can
execute, check if there is a parent revision with it passing, and if not,
initiate bisection between the failure and the latest revision with the test
passing they could find in the database. They would have to get the
not-yet-reported revisions from the relevant git repo, though.

Or they could track failures themselves and just submit results of their own
bisection (both the last passing and the first failing revision). Something
that the existing KernelCI algorithm can already do. The notifying algorithm
would still pick that up.

What do you think?

Nick

