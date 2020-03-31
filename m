MIME-Version: 1.0
References: <5e7cb175.1c69fb81.d10e.6d4a@mx.google.com> <CAKwvOdkTh+uHOK0bd5UGGfYiFQU+MkeT71Yy7Ggof9FkQHCG-g@mail.gmail.com>
 <64828a9f-9983-d731-d52e-3d753fc035f6@collabora.com> <CAKwvOdmRN6H6LMSc2o=XYVzrzSqDCW3JqLMxzWDiwa+XogyggA@mail.gmail.com>
 <8dc8d1f3-cccf-d908-2ed1-c24b1387e362@collabora.com>
In-Reply-To: <8dc8d1f3-cccf-d908-2ed1-c24b1387e362@collabora.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Tue, 31 Mar 2020 09:30:52 -0700
Message-ID: <CAKwvOd=PQabz1q3SJsa6VQ7t+KcfN9PgO1GjyMUHn2+YXD-g9w@mail.gmail.com>
Subject: Re: next/master build: 227 builds: 17 failed, 210 passed, 41 errors, 497 warnings (next-20200326)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Kevin Hilman <khilman@baylibre.com>, kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>, Mark Brown <broonie@kernel.org>

On Tue, Mar 31, 2020 at 4:59 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Hi Nick,
>
> On 27/03/2020 17:56, Nick Desaulniers wrote:
> > 3. I have to click through to see warnings, not all are listed in the
> > preview (example: allmodconfig =E2=80=90 arm =E2=80=90 clang-9 on
> > https://kernelci.org/build/next/branch/master/kernel/next-20200326/ is
> > red but says 0 warnings 0 errors. But if you click through in the logs
> > you see a failure in modpost).

^ thinking more about this case, not all errors are necessarily from
the compiler.  Other host utilities (in this case modpost, but on x86
and maybe soon arm64 objtool) can fail/warn/error as well.  Maybe the
UI is predicated on compiler warnings/errors only, and not the other
host utilities?  I can point to some objtool warnings with Clang; it
would be good to highlight those as they are typically bugs (sometimes
in the compiler).

> > 4. clicking back resets the filter, so you have to open multiple tabs
> > to the reports.
>
> Thanks for taking a look and providing this detailed feedback as
> to why the web frontend doesn't help with your workflow.  It's
> very useful as it's the only way we can improve it, for you and
> others in general.
>
> > Compare the above, to ctrl+f,clang,ctrl+g in a daily email.  It's
> > super painful.  It also makes the current email reports useless to us.
> >
> > I'm aware of every bug in
> > https://github.com/ClangBuiltLinux/linux/issues that's open and every
> > bug we've ever had there.  I need to be able to quickly spot if
> > there's something *new* on the Clang side and file a bug to follow up
> > on it when I have time, then quickly move on to the next fire.  I was
> > also able to quickly grep and see if the issue was observed with GCC
> > as well, or just Clang.
> >
> > I strongly agree with Broonie emailing that a successful build
> > occurred is noise; we disable this in our travisci:
> > https://github.com/ClangBuiltLinux/continuous-integration/blob/a0e363f2=
68dab899a6b259b24639d02b73401526/.travis.yml#L211
>
> We need to consider the whole notification / visualisation system
> we have to better design emails and web dashboards, with enough
> flexibility to take into account the main use-cases.  It's good
> to know that in your case, listing passing builds isn't useful.

If you have a dashboard that shows builds as a field of red/green, it
doesn't hurt. (https://ci.android.com/ for example).  For the email
reports, it might be possible to filter those out though. You
generally don't call the firemen when there's no fire.

>
> > But I'm afraid this change throws the baby out with the bath water,
> > and it really really hinders my ability to triage bugs and slows me
> > down.  Please consider reverting.
>
> Yep, it has now been reverted as agreed with others on IRC.  This
> is already effective in production so the next reports should
> have all the details as they did before.  Sorry for the
> inconvenience.

I appreciate it.

>
> Moving forward, we should make sure you have a chance to look at
> any changes to the email format before deploying something in
> production.

Yes, please @ me on the github change and I'd be happy to give a quick look=
.

--=20
Thanks,
~Nick Desaulniers
