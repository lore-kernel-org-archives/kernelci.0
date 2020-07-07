Subject: Re: Participate in build test (MIPS/Loongson)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <17159ea67a7.13d5ba30b1709.5131811758859128540@flygoat.com>
 <7ho8os4i3c.fsf@baylibre.com>
 <2821325d-56d7-4770-6027-fb30097f6a7b@flygoat.com>
Message-ID: <bf280d0a-9289-1048-a8a4-f3e2972196d4@flygoat.com>
Date: Tue, 7 Jul 2020 10:14:42 +0800
MIME-Version: 1.0
In-Reply-To: <2821325d-56d7-4770-6027-fb30097f6a7b@flygoat.com>
List-ID: <info.kernelci.org>
List-Post: <https://groups.google.com/a/kernelci.org/group/info/post>, <mailto:info@kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
List-Archive: <https://groups.google.com/a/kernelci.org/group/info/>
List-Unsubscribe: <mailto:googlegroups-manage+1098402462627+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/kernelci.org/group/info/subscribe>
Content-Type: multipart/alternative;
 boundary="------------4A26E30B21BFFE8E03CF61BD"
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>, kernelci@groups.io, info <info@kernelci.org>
Cc: Corentin Labbe <clabbe@baylibre.com>

--------------4A26E30B21BFFE8E03CF61BD
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit



在 2020/7/7 8:43, Jiaxun Yang 写道:
>
>
> 在 2020/7/7 2:24, Kevin Hilman 写道:
>> Hi Jianxun,
>>
>> Jiaxun Yang<jiaxun.yang@flygoat.com>  writes:
>>
>>> I'm a maintainer of MIPS/LOONGSON64 and MIPS/LOONGSON2EF support in
>>> kernel, and I would like to enable build test for these platforms in
>>> KernelCI. Also I will respond to their build failures.
>>>
>>> Currently it's hard for me to provide hardware to perform boot test as
>>> a amateur, but Fuloong2E has already accepted by QEMU and we can
>>> perform boot test on it for LOONGSON2EF.
>>>
>>> Please give me some instructions.
>>>
>>> Btw: MIPS/malta is not under my maintenance but I can also respond to
>>> it's build failure and QEMU boot failure. I'd like to apply for this
>>> platform too if I'm eligible.
>> I don't think we're doing any MIPS boots on QEMU currently, but we can
>> probably add that if you can give us a bit of guidance.  I've also cc'd
>> Corentin who has been working on QEMU support for more platforms.
>>
>> Can you share with us more details on QEMU version that is known to work
>> well for upstream MIPS kernels, and the qemu cmdline that you use to
>> boot upstream kernels?  With that, we can guide you on how to add
>> support.
>
> Sure, with QEMU 4.2/5.0:

Forget to mention that I'd also have to select some drivers to get it boot.
I saw clabbe's work on github. Will discuss here.

Thanks!
**
>
> fuloong2e_defconfig:
> No RootFS avliable, Debian dropped MIPS-III suport since stretch.
> qemu-system-mips64el -nographic \
>         -machine fulong2e -cpu Loongson-2E -m 256M \
>         -kernel vmlinux \
>         -append "console=ttyS0,115200"
>
> malta_defconfig: (Default)
> RootFS: 
> https://people.debian.org/~jcowgill/qemu-mips/debian-buster-mipsel.qcow2
> qemu-system-mipsel -nographic -net nic,model=virtio \
>         -machine malta -cpu P5600 -m 2G \
>         -kernel vmlinux \
>         -append "root=/dev/vda1 rw console=ttyS0,38400n8r" \
>         -drive file=debian-buster-mipsel.qcow2,if=virtio
>
> malta_defconfig: (Selected to MIPS64R2 CPU)
> RootFS: 
> https://people.debian.org/~jcowgill/qemu-mips/debian-buster-mips64el.qcow2
> qemu-system-mips64el -nographic -net nic,model=virtio \
>         -machine malta -cpu |mips64dspr2| -m 2G \
>         -kernel vmlinux \
>         -append "root=/dev/vda1 rw console=ttyS0,38400n8r" \
>         -drive file=debian-buster-mips64el.qcow2,if=virtio
>
> malta_qemu_32r6_defconfig:
> No rootfs avilable
> qemu-system-mipsel -nographic -net nic,model=virtio \
>         -machine malta -cpu |mips32r6-generic| -m 2G \
>         -kernel vmlinux \
>         -append "root=/dev/vda1 rw console=ttyS0,38400n8r" \
>
> malta_defconfig: (Selected to MIPS64R6 CPU)
> RootFS: http://mips64el.bfsu.edu.cn/debian-new/tarball/qemu/
> qemu-system-mips64el -nographic -net nic,model=virtio \
>         -machine malta -cpu I6400 -smp 2 -m 512M \
>         -kernel vmlinux -initrd initrd.img \
>         -append "root=/dev/vda1 console=ttyS0,38400n8r rw" \
>         -drive file=buster-mips64r6el.qcow2,if=virtio
>
> Thanks.
>
>> Kevin
>>
>>
>>
>


--------------4A26E30B21BFFE8E03CF61BD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">在 2020/7/7 8:43, Jiaxun Yang 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2821325d-56d7-4770-6027-fb30097f6a7b@flygoat.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <br>
      <br>
      <div class="moz-cite-prefix">在 2020/7/7 2:24, Kevin Hilman 写道:<br>
      </div>
      <blockquote type="cite" cite="mid:7ho8os4i3c.fsf@baylibre.com">
        <pre class="moz-quote-pre" wrap="">Hi Jianxun,

Jiaxun Yang <a class="moz-txt-link-rfc2396E" href="mailto:jiaxun.yang@flygoat.com" moz-do-not-send="true">&lt;jiaxun.yang@flygoat.com&gt;</a> writes:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I'm a maintainer of MIPS/LOONGSON64 and MIPS/LOONGSON2EF support in
kernel, and I would like to enable build test for these platforms in
KernelCI. Also I will respond to their build failures.

Currently it's hard for me to provide hardware to perform boot test as
a amateur, but Fuloong2E has already accepted by QEMU and we can
perform boot test on it for LOONGSON2EF.

Please give me some instructions.

Btw: MIPS/malta is not under my maintenance but I can also respond to
it's build failure and QEMU boot failure. I'd like to apply for this
platform too if I'm eligible.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I don't think we're doing any MIPS boots on QEMU currently, but we can
probably add that if you can give us a bit of guidance.  I've also cc'd
Corentin who has been working on QEMU support for more platforms.

Can you share with us more details on QEMU version that is known to work
well for upstream MIPS kernels, and the qemu cmdline that you use to
boot upstream kernels?  With that, we can guide you on how to add
support.</pre>
      </blockquote>
      <br>
      Sure, with QEMU 4.2/5.0:<br>
    </blockquote>
    <br>
    Forget to mention that I'd also have to select some drivers to get
    it boot.<br>
    I saw clabbe's work on github. Will discuss here.<br>
    <br>
    Thanks!<br>
    <strong class="css-truncate"></strong>
    <blockquote type="cite"
      cite="mid:2821325d-56d7-4770-6027-fb30097f6a7b@flygoat.com"> <br>
      fuloong2e_defconfig:<br>
      No RootFS avliable, Debian dropped MIPS-III suport since stretch.<br>
      qemu-system-mips64el -nographic \<br>
              -machine fulong2e -cpu Loongson-2E -m 256M \<br>
              -kernel vmlinux \<br>
              -append "console=ttyS0,115200"<br>
      <br>
      malta_defconfig: (Default)<br>
      RootFS: <a class="moz-txt-link-freetext"
href="https://people.debian.org/~jcowgill/qemu-mips/debian-buster-mipsel.qcow2"
        moz-do-not-send="true">https://people.debian.org/~jcowgill/qemu-mips/debian-buster-mipsel.qcow2</a><br>
      qemu-system-mipsel -nographic -net nic,model=virtio \<br>
              -machine malta -cpu P5600 -m 2G \<br>
              -kernel vmlinux \<br>
              -append "root=/dev/vda1 rw console=ttyS0,38400n8r" \<br>
              -drive file=debian-buster-mipsel.qcow2,if=virtio<br>
      <br>
      malta_defconfig: (Selected to MIPS64R2 CPU)<br>
      RootFS:
      <a class="moz-txt-link-freetext"
href="https://people.debian.org/~jcowgill/qemu-mips/debian-buster-mips64el.qcow2"
        moz-do-not-send="true">https://people.debian.org/~jcowgill/qemu-mips/debian-buster-mips64el.qcow2</a><br>
      qemu-system-mips64el -nographic -net nic,model=virtio \<br>
              -machine malta -cpu <code class="docutils literal
        notranslate"><span class="pre">mips64dspr2</span></code> -m 2G \<br>
              -kernel vmlinux \<br>
              -append "root=/dev/vda1 rw console=ttyS0,38400n8r" \<br>
              -drive file=debian-buster-mips64el.qcow2,if=virtio<br>
      <br>
      malta_qemu_32r6_defconfig:<br>
      No rootfs avilable<br>
      qemu-system-mipsel -nographic -net nic,model=virtio \<br>
              -machine malta -cpu <code class="docutils literal
        notranslate"><span class="pre">mips32r6-generic</span></code> -m
      2G \<br>
              -kernel vmlinux \<br>
              -append "root=/dev/vda1 rw console=ttyS0,38400n8r" \<br>
      <br>
      malta_defconfig: (Selected to MIPS64R6 CPU)<br>
      RootFS: <a class="moz-txt-link-freetext"
        href="http://mips64el.bfsu.edu.cn/debian-new/tarball/qemu/"
        moz-do-not-send="true">http://mips64el.bfsu.edu.cn/debian-new/tarball/qemu/</a><br>
      qemu-system-mips64el -nographic -net nic,model=virtio \<br>
              -machine malta -cpu I6400 -smp 2 -m 512M \<br>
              -kernel vmlinux -initrd initrd.img \<br>
              -append "root=/dev/vda1 console=ttyS0,38400n8r rw" \<br>
              -drive file=buster-mips64r6el.qcow2,if=virtio<br>
      <br>
      Thanks.<br>
      <br>
      <blockquote type="cite" cite="mid:7ho8os4i3c.fsf@baylibre.com">
        <pre class="moz-quote-pre" wrap="">Kevin



</pre>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------4A26E30B21BFFE8E03CF61BD--
