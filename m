From: <Tim.Bird@sony.com>
Subject: Re: RFC - kernel test result specification (KTAP)
Date: Mon, 30 Aug 2021 22:21:26 +0000
Message-ID: 
 <BYAPR13MB2503A8C61639B2C25358F03FFDCB9@BYAPR13MB2503.namprd13.prod.outlook.com>
References: 
 <CA+GJov6tdjvY9x12JsJT14qn6c7NViJxqaJk+r-K1YJzPggFDQ@mail.gmail.com>
 <202108272330.AE55FCD@keescook>
 <BYAPR13MB2503A4B79074D8ED5579345DFDCB9@BYAPR13MB2503.namprd13.prod.outlook.com>
 <202108301226.800F3D6D4@keescook>
In-Reply-To: <202108301226.800F3D6D4@keescook>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: keescook@chromium.org
Cc: rmoar@google.com, brendanhiggins@google.com, davidgow@google.com, shuah@kernel.org, dlatypov@google.com, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernelci@groups.io, guillaume.tucker@collabora.com



> -----Original Message-----
> From: Kees Cook <keescook@chromium.org>
>=20
> On Mon, Aug 30, 2021 at 05:48:07PM +0000, Tim.Bird@sony.com wrote:
> > From: Kees Cook <keescook@chromium.org>
...
> > > Yes, though the optional "- " is strictly part of the optional
> > > description.
> >
> > It's mildly annoying that "-" is optional.  It's trivial to deal with i=
n the parser
> > to just ignore it if it's present.  But it has no semantic meaning what=
soever.
> > IMHO it would be nice to either mandate it or remove it, for consistenc=
y's sake.
> > This could be based solely on the consensus for whether it added or det=
racted
> > from human readability, since parsers don't care.
>=20
> I have no strong opinion on the "-". I was surprised to encounter it
> as it's not part of the TAP 13 spec. I would prefer to drop it, if I had
> to choose.

The TAP 13 specification does not mention "-", but a dash on the result lin=
e
is used in most of the examples shown in the specification here:
http://testanything.org/tap-specification.html

In the top two examples on that page, the first one does not use dashes and
the second one does.  It's kind of irritating to have that kind of loosey-g=
oosey
syntax in a specification.  IMHO the syntax should be more strictly specifi=
ed
than this.  I don't have a strong opinion either on whether to use dashes o=
r not.
But it would be nice to make it consistent.
 -- Tim Bird

