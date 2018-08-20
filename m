Subject: Re: [kernelci] Compilers from.. debian?
References: <CAH+k93God7SdCeet-S=n4iUmLvyJr4+hORa=W852N_tKWFo8Qw@mail.gmail.com>
 <7hefezlkoi.fsf@baylibre.com>
 <CACNq6_a4fBc3Q8H4rDZwOSNsWLCZ9tJ-_oi+iKs_=gkkZHGf+A@mail.gmail.com>
 <CAH+k93F_04KY43aUDaOuen8heG6-UVVgpbrgcW6DGXtNSEyLQw@mail.gmail.com>
 <CACNq6_Zuf+5cJXj41ZtALdKt3WtRUOurjCssL6FgfoDRXykETQ@mail.gmail.com>
From: "Ana Guerrero Lopez" <ana.guerrero@collabora.com>
Message-ID: <267c7d8f-29e7-c99c-637e-df2c9d4ae205@collabora.com>
Date: Mon, 20 Aug 2018 15:36:38 +0200
MIME-Version: 1.0
In-Reply-To: <CACNq6_Zuf+5cJXj41ZtALdKt3WtRUOurjCssL6FgfoDRXykETQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------62940441888BE6CA8400752E"
Content-Language: en-US
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--------------62940441888BE6CA8400752E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/08/18 18:27, Mark Brown wrote:
>
>
> On Wed, 15 Aug 2018, 5:05 pm Matt Hart, <matthew.hart@linaro.org 
> <mailto:matthew.hart@linaro.org>> wrote:
>
>     On 15 August 2018 at 16:39, Mark Brown <broonie@kernel.org
>     <mailto:broonie@kernel.org>> wrote:
>     >
>     >
>     > On Wed, 15 Aug 2018, 4:21 pm Kevin Hilman, <khilman@baylibre.com
>     <mailto:khilman@baylibre.com>> wrote:
>     >>
>     >> "Matt Hart" <matthew.hart@linaro.org
>     <mailto:matthew.hart@linaro.org>> writes:
>     >>
>     >> > Does anyone have a strong opinion about where we get our compiler
>     >> > releases from?
>     >>
>     >> I think the current tarball way is a hack and not scalable, so...
>     >>
>     >> > Currently it's a mash up of Linaro for ARM(32/64), MIPS from
>     unknown,
>     >> > and X86 from whatever ubuntu is installed on the builder
>     >> >
>     >> > As part of my work to start building with multiple compiler
>     versions,
>     >> > I've been creating Dockerfiles for the builders with different
>     >> > compiler versions installed in them. As I've been doing this,
>     it's
>     >> > been really easy to just install the various compilers
>     packages from
>     >> > Debian. They also cover a lot of architectures we're hoping
>     to add in
>     >> > the future.
>     >> >
>     >> > Anyone mind if we start using Debian toolchain releases in
>     future?
>     >> > I'm no toolchain expert, so I'm looking for some opinions.
>     >>
>     >> It's better than what we're doing today, and has a much clearer
>     >> upgrade/migration path, so I say go for it!
>     >
>     >
>     > The only concern I can think of is that it's going to be a bit
>     harder for
>     > those not fortunate enough to run Debian to get the toolchains
>     if there's
>     > some reason to reproduce things. On the other hand that's a rare
>     occurrence
>     > and with moving the builders more to Docker there's always the
>     option of
>     > using the container to get the compilers on other OSs.
>
>     I've been thinking about adding a section to the build page of "repeat
>     this build" and a link to either a dockerfile or image which runs the
>     identical steps in the same environment, it could be a really nice
>     feature to add.
>
>
> That'd be a neat thing to have!
>
+1 and thank you for taking care of this.

Ana

--------------62940441888BE6CA8400752E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 15/08/18 18:27, Mark Brown wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CACNq6_Zuf+5cJXj41ZtALdKt3WtRUOurjCssL6FgfoDRXykETQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <br>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Wed, 15 Aug 2018, 5:05 pm Matt Hart, &lt;<a
            href="mailto:matthew.hart@linaro.org" moz-do-not-send="true">matthew.hart@linaro.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">On 15 August
          2018 at 16:39, Mark Brown &lt;<a
            href="mailto:broonie@kernel.org" target="_blank"
            moz-do-not-send="true">broonie@kernel.org</a>&gt; wrote:<br>
          &gt;<br>
          &gt;<br>
          &gt; On Wed, 15 Aug 2018, 4:21 pm Kevin Hilman, &lt;<a
            href="mailto:khilman@baylibre.com" target="_blank"
            moz-do-not-send="true">khilman@baylibre.com</a>&gt; wrote:<br>
          &gt;&gt;<br>
          &gt;&gt; "Matt Hart" &lt;<a
            href="mailto:matthew.hart@linaro.org" target="_blank"
            moz-do-not-send="true">matthew.hart@linaro.org</a>&gt;
          writes:<br>
          &gt;&gt;<br>
          &gt;&gt; &gt; Does anyone have a strong opinion about where we
          get our compiler<br>
          &gt;&gt; &gt; releases from?<br>
          &gt;&gt;<br>
          &gt;&gt; I think the current tarball way is a hack and not
          scalable, so...<br>
          &gt;&gt;<br>
          &gt;&gt; &gt; Currently it's a mash up of Linaro for
          ARM(32/64), MIPS from unknown,<br>
          &gt;&gt; &gt; and X86 from whatever ubuntu is installed on the
          builder<br>
          &gt;&gt; &gt;<br>
          &gt;&gt; &gt; As part of my work to start building with
          multiple compiler versions,<br>
          &gt;&gt; &gt; I've been creating Dockerfiles for the builders
          with different<br>
          &gt;&gt; &gt; compiler versions installed in them. As I've
          been doing this, it's<br>
          &gt;&gt; &gt; been really easy to just install the various
          compilers packages from<br>
          &gt;&gt; &gt; Debian. They also cover a lot of architectures
          we're hoping to add in<br>
          &gt;&gt; &gt; the future.<br>
          &gt;&gt; &gt;<br>
          &gt;&gt; &gt; Anyone mind if we start using Debian toolchain
          releases in future?<br>
          &gt;&gt; &gt; I'm no toolchain expert, so I'm looking for some
          opinions.<br>
          &gt;&gt;<br>
          &gt;&gt; It's better than what we're doing today, and has a
          much clearer<br>
          &gt;&gt; upgrade/migration path, so I say go for it!<br>
          &gt;<br>
          &gt;<br>
          &gt; The only concern I can think of is that it's going to be
          a bit harder for<br>
          &gt; those not fortunate enough to run Debian to get the
          toolchains if there's<br>
          &gt; some reason to reproduce things. On the other hand that's
          a rare occurrence<br>
          &gt; and with moving the builders more to Docker there's
          always the option of<br>
          &gt; using the container to get the compilers on other OSs.<br>
          <br>
          I've been thinking about adding a section to the build page of
          "repeat<br>
          this build" and a link to either a dockerfile or image which
          runs the<br>
          identical steps in the same environment, it could be a really
          nice<br>
          feature to add.<br>
        </blockquote>
      </div>
      <div><br>
      </div>
      <div>That'd be a neat thing to have!</div>
      <div><br>
      </div>
    </blockquote>
    +1 and thank you for taking care of this.<br>
    <br>
    Ana<br>
  </body>
</html>

--------------62940441888BE6CA8400752E--
