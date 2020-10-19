MIME-Version: 1.0
References: <CAFW5HqQ6QTBDRHOT6dfnwFmNvWvPy3fuvBXBJQrnEwGEnatACQ@mail.gmail.com>
In-Reply-To: <CAFW5HqQ6QTBDRHOT6dfnwFmNvWvPy3fuvBXBJQrnEwGEnatACQ@mail.gmail.com>
From: "Milosz Wasilewski" <milosz.wasilewski@linaro.org>
Date: Mon, 19 Oct 2020 11:05:24 +0100
Message-ID: <CAJrz+7+wWfnQHx0hOs09OBpo9q3Vvguv-Z9fNjrTywiRoiz78A@mail.gmail.com>
Subject: Re: LAVA: How to link Requirements/"Any web page" page URL's to LAVA test cases
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, koti koti <kotisoftwaretest@gmail.com>
Cc: "lava-users@lists.lavasoftware.org" <lava-users@lists.lavasoftware.org>

On Mon, 19 Oct 2020 at 10:35, koti koti <kotisoftwaretest@gmail.com> wrote:
>
> Hi,
>
> How can I link the Requirement page (any web page) URL to LAVA test cases ?
>
> 1. I just want to see that web page URL in test case results page log after
> execution of test.

I don't think this can be done. LAVA doesn't offer such feature. A
long time ago we had a discussion about including arbitrary URL in the
test case metadata. So far there is no implementation. The closest you
can get is: https://master.lavasoftware.org/static/docs/v2/writing-tests.html#recording-test-case-references

milosz

>
> Do I need to add that web page URL  as metadata data in while writing the
> test definitions?
>
> Regards,
> Koti
>
>
> 
>
>
