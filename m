MIME-Version: 1.0
References: <20200305202435.1284242-1-matthew.d.roper@intel.com>
In-Reply-To: <20200305202435.1284242-1-matthew.d.roper@intel.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Thu, 5 Mar 2020 13:16:25 -0800
Message-ID: <CAKwvOd=HkFWvWei0DHv2FiP188pHQBAwCO5e+K4hSMoq2n0mOg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/tgl: Don't treat unslice registers as masked
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, clang-built-linux <clang-built-linux@googlegroups.com>, kernelci@groups.io

On Thu, Mar 5, 2020 at 12:25 PM Matt Roper <matthew.d.roper@intel.com> wrot=
e:
>
> The UNSLICE_UNIT_LEVEL_CLKGATE and UNSLICE_UNIT_LEVEL_CLKGATE2 registers
> that we update in a few engine workarounds are not masked registers
> (i.e., we don't have to write a mask bit in the top 16 bits when
> updating one of the lower 16 bits).  As such, these workarounds should
> be applied via wa_write_or() rather than wa_masked_en()
>
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Fixes: 50148a25f841 ("drm/i915/tgl: Move and restrict Wa_1408615072")
> Fixes: 3551ff928744 ("drm/i915/gen11: Moving WAs to rcs_engine_wa_init()"=
)
> Cc: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

I appreciate the fast turnaround time!
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

If the maintainer wouldn't mind adding the following tags to help us
track and show some love for our bots:
Link: https://github.com/ClangBuiltLinux/linux/issues/918
Reported-by: kernelci.org bot <bot@kernelci.org>

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/dr=
m/i915/gt/intel_workarounds.c
> index 908a70914399..b4785212fb7d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1382,8 +1382,8 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, =
struct i915_wa_list *wal)
>                 wa_masked_en(wal, GEN9_ROW_CHICKEN4, GEN12_DISABLE_TDL_PU=
SH);
>
>                 /* Wa_1408615072:tgl */
> -               wa_masked_en(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
> -                            VSUNIT_CLKGATE_DIS_TGL);
> +               wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
> +                           VSUNIT_CLKGATE_DIS_TGL);
>         }
>
>         if (IS_TIGERLAKE(i915)) {
> @@ -1467,12 +1467,12 @@ rcs_engine_wa_init(struct intel_engine_cs *engine=
, struct i915_wa_list *wal)
>                  * Wa_1408615072:icl,ehl  (vsunit)
>                  * Wa_1407596294:icl,ehl  (hsunit)
>                  */
> -               wa_masked_en(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
> -                            VSUNIT_CLKGATE_DIS | HSUNIT_CLKGATE_DIS);
> +               wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
> +                           VSUNIT_CLKGATE_DIS | HSUNIT_CLKGATE_DIS);
>
>                 /* Wa_1407352427:icl,ehl */
> -               wa_masked_en(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
> -                            PSDUNIT_CLKGATE_DIS);
> +               wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
> +                           PSDUNIT_CLKGATE_DIS);
>
>                 /* Wa_1406680159:icl,ehl */
>                 wa_write_or(wal,
> --
> 2.24.1
>


--
Thanks,
~Nick Desaulniers
