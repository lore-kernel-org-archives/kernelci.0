MIME-Version: 1.0
References: <CAH+k93ESzNrC65JreCxH5NocED8xpu7aApGgFb7bwhqF_7prwA@mail.gmail.com>
In-Reply-To: <CAH+k93ESzNrC65JreCxH5NocED8xpu7aApGgFb7bwhqF_7prwA@mail.gmail.com>
From: Tyler Baker <tyler@foundries.io>
Date: Mon, 7 Jan 2019 08:09:23 -0800
Message-ID: <CAH=dhFS6TtEu5nFHQm-BA+zLVvBm-vGKhTm18qGKtQCrYLqxfw@mail.gmail.com>
Subject: Re: patches@kernelci.org email account
List-ID: <info.kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Matt Hart <matthew.hart@linaro.org>
Cc: fellows@kernelci.org, info@kernelci.org, Tyler Baker <tyler@opensourcefoundries.com>, Milo Casagrande <milo@opensourcefoundries.com>

On Mon, Jan 7, 2019 at 7:28 AM Matt Hart <matthew.hart@linaro.org> wrote:
>
> So, I hear the email account "patches@kernelci.org" was deleted.

It was, then it added back after Kevin told me it was a mistake.

> The problem is, that account is used by the kernelci-reports service
> which checks the stable review emails and sends the responses.
> I found it in the config file /etc/linaro/kernelci-reports.cfg, on the
> kernelci.org master server.
>
> It's also what we've previously told Greg to CC for his stable
> reports, and according to a recent meeting minutes someone is going to
> tell him to stop using it.
>
> Any chance we can get it turned back on? Or can we use
> bot@kernelci.org for the same thing? Tyler? Milo?

Should be back on as of a few weeks ago. Is the backend throwing an
error? I reset the password to use the one we were using in
production.
