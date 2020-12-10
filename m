From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: KCIDB: Renaming "descriptions" to "comments"
Message-ID: <4b84dd0b-a0c2-c577-ee36-daacac25f953@redhat.com>
Date: Thu, 10 Dec 2020 14:01:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>, Dmitry Vyukov <dvyukov@google.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Alice Ferrazzi <alicef@gentoo.org>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>, kernelci@groups.io

Hi everyone,

To anyone involved/interested in contributing to KernelCI's KCIDB data and
code, I'd like to announce a small, but noticeable change to the schema to let
us develop result notifications further, and to move closer to reaching
developers with our data.

We'd like to rename the "description" fields in all objects to "comment".

The name "description" suggests the field contains a description of its object
as a whole. E.g. that a build's "description" could contain something like
this, coming from one CI system:

     Debian Clang 10.0.1 / arm / BeagleBone Black

and another CI system could send:

     BeagleBone Black (Clang 10.0.1 / arm)

However, we would have formalized fields for most of that information already
(i.e. "compiler", and "architecture"), and we would rather generate our own
build description from *those* in our email notifications/dashboards, for
consistency.

This way we could e.g. send email notifications with a consistent subject, no
matter which CI system sent the reports. For (a theoretical) example:

     BUILD FAILED: Clang 10.0.1 / arm

However, even as we keep on improving the schema, we recognize that CI systems
will always have something extra to add about their builds/tests, which they
would want the recipients to see. We have the "misc" field for the arbitrary
structured data, but since it's non-formalized, we cannot put it into e.g. our
reports in any meaningful way (except as a JSON dump).

For that purpose, in place of the "description" field, we're adding the
"comment" field, which would mean just that: any extra information you'd like
to add to your object, which has no formal place yet, for humans to see.
Basically, it's a (smaller) human-readable analogue of "misc".

Taking the example above, it could be just that target name:

     BeagleBone Black

because e.g. the submitter considers that important to the recipients, and we
don't have that field yet. Then we could e.g. append it to our subjects in a
consistent way:

     BUILD FAILED: Clang 10.0.1 / arm / BeagleBone Black

The specific change is up for review here:

     https://github.com/kernelci/kcidb-io/pull/19

and will be included into the next schema version (v4). When automatically
converting the v3 data the "description" field values will simply go into
"comment" as is. You won't need to change your reporting code until you switch
to sending data complying to v4, or later schema (after it is released), and
then please reconsider what you put there.

Please don't hesitate to respond with any comments, objections, or
suggestions.

If there are no objections, I'll merge this change next week.

Nick

