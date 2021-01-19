Subject: Re: KCIDB: Requiring IDs for test environments #KCIDB
References: <e76ed580-0cd9-6b58-c812-cfafb03c6f08@redhat.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <223f8984-684e-9c89-02ed-2bf1cb5281ae@collabora.com>
Date: Tue, 19 Jan 2021 15:03:05 +0000
MIME-Version: 1.0
In-Reply-To: <e76ed580-0cd9-6b58-c812-cfafb03c6f08@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>, Dmitry Vyukov <dvyukov@google.com>, Alice Ferrazzi <alicef@gentoo.org>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>, kernelci@groups.io, Dan Rue <dan.rue@linaro.org>

On 14/01/2021 16:47, Nikolai Kondrashov wrote:
> Hi everyone,
>=20
> To anyone involved/interested in contributing to KernelCI's KCIDB data a=
nd
> code, I'd like to announce a small, but noticeable change to the schema =
to let
> us develop result notifications further, and to move closer to reaching
> developers with our data.
>=20
> We'd like to start requiring unique IDs for test environments.
>=20
> Test "environment" is an optional object within the test object. So far =
it has
> only contained a "description" and a "misc" field.
>=20
> We would like to start grouping tests by environments (hosts/VMs) they
> executed in, on our dashboards and in e-mail notifications. To do that w=
e need
> a way to identify them, and that's where environment IDs come in.
>=20
> The environment IDs would need to be in the same format as "builds" and
> "tests" use in v3 schema, as well as "checkouts" are going to use in v4:
> the origin name (e.g. "syzbot"), followed by a colon, followed by an
> origin-unique ID.
>=20
> The origin-unique ID can be whatever uniquely identifies the environment
> inside the origin CI system. It could be just a straight hostname, or e.=
g. a
> hashed hostname if you'd like to keep it secret.
>=20
> E.g. a Red Hat test report could look like this:
>=20
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "version": {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "major": 4,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "minor": 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "tests": [
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "build_id": "redh=
at:1071310",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "id": "redhat:120=
299463",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "origin": "redhat=
",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "environment": {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "id":=
 "redhat:kernelci-1.s390.bos.redhat.com",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "comm=
ent": "kernelci-1.s390.bos.redhat.com"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "path": "boot",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "comment": "Boot =
test",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "status": "PASS",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "waived": false,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "start_time": "20=
21-01-14T10:01:43+00:00",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "duration": 161
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
> =C2=A0=C2=A0=C2=A0 }
>=20
> Reports in v3 and older formats will have environment IDs generated
> automatically by sha256-hashing a stable JSON representation of "environ=
ment"
> objects, if any are present and are not empty. Empty "environment" objec=
ts
> will be discarded. E.g. this v3 environment:
>=20
> =C2=A0=C2=A0=C2=A0 "environment": {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "description": "rk3288-veyron-jaq in lab-=
collabora",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "misc": {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "instance": "rk3288-veyron-ja=
q-cbg-1",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "device": "rk3288-veyron-jaq"=
,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mach": "rockchip",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "lab": "lab-collabora"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 }
>=20
> will be upgraded to this v4 environment:
>=20
> =C2=A0=C2=A0=C2=A0 "environment": {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "id": "_:c04ecf73a79cf29bdd91=
40ad4f50172c8f9783ff51895c63afb6d8ad448a3f3e",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "comment": "rk3288-veyron-jaq=
 in lab-collabora"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "misc": {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "inst=
ance": "rk3288-veyron-jaq-cbg-1",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "devi=
ce": "rk3288-veyron-jaq",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mach=
": "rockchip",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "lab"=
: "lab-collabora",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0 }

How do you intend to use this when reporting results?

Having an ID means we can group results with the exact same
environment, but I'm not sure how much value it would add.  Being
able to show all the results for say, a CPU architecture or a
category of hardware would be more useful.  If a CI system has 10
identical environments but just with a different hostname, how
could we still group the results if we only have unique IDs for
each of them?

Best wishes,
Guillaume


> The PR for the corresponding code change is up at:
>=20
> =C2=A0=C2=A0=C2=A0 https://github.com/kernelci/kcidb-io/pull/20
>=20
> Please don't hesitate to respond with any comments, objections, or
> suggestions.
>=20
> If there are no objections, I'll merge this change on Tuesday, Jan 19.
>=20
> Nick
>=20

