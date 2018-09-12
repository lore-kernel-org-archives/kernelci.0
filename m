MIME-Version: 1.0
In-Reply-To: <d0113fd0-801a-feff-af96-12a71ca27dc7@collabora.com>
References: <d0113fd0-801a-feff-af96-12a71ca27dc7@collabora.com>
From: "Milosz Wasilewski" <milosz.wasilewski@linaro.org>
Date: Wed, 12 Sep 2018 09:51:26 +0100
Message-ID: <CAJrz+7KR0x51xK=4bHH2i_OzGgrK6BdyiJE5vhs0gOdNx1YcAw@mail.gmail.com>
Subject: Re: [kernelci] media subsystem test pilot
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: ezequiel Garcia <ezequiel@collabora.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, Chase Qi <chase.qi@linaro.org>

On 12 September 2018 at 09:13, Guillaume Tucker
<guillaume.tucker@gmail.com> wrote:
>
> * add config fragment (similar to the kselftest one) with virtual
>   video drivers enabled to test v4l2 framework on QEMU and get
>   reference test results

Last week I asked Chase (CCed) to try to create a 'test definition'
for v4l for LAVA. I can see the v4l template in the repo now [1] but
it looks like bound to LAVA environment. Do you possibly have some
different implementation that allows for local execution?

[1] https://github.com/kernelci/kernelci-core-staging/blob/master/templates/v4l2/v4l2.jinja2

milosz
