MIME-Version: 1.0
References: <1656314828-3544-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1656314828-3544-1-git-send-email-yangtiezhu@loongson.cn>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Tue, 28 Jun 2022 11:19:12 -0700
Message-ID: <CAKwvOdnmtGCUyxw4eXCyjp3nPAHZQ1v3Ui2ELXRNWpceCYsMyQ@mail.gmail.com>
Subject: Re: [PATCH v2] modpost: Add line break in the section mismatch warning
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Xuefeng Li <lixuefeng@loongson.cn>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernelci@groups.io

On Mon, Jun 27, 2022 at 4:46 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> The section mismatch warning may be too long, add a line break
> to make it more readable.
>
> Without this patch:
>
>   LD      vmlinux.o
>   MODPOST vmlinux.symvers
> WARNING: modpost: vmlinux.o(___ksymtab+prom_init_numa_memory+0x0): Section mismatch in reference from the variable __ksymtab_prom_init_numa_memory to the function .init.text:prom_init_numa_memory()
> The symbol prom_init_numa_memory is exported and annotated __init
> Fix this by removing the __init annotation of prom_init_numa_memory or drop the export.
>
> With this patch:
>
>   LD      vmlinux.o
>   MODPOST vmlinux.symvers
> WARNING: modpost: vmlinux.o(___ksymtab+prom_init_numa_memory+0x0): Section mismatch in reference
> from the variable __ksymtab_prom_init_numa_memory to the function .init.text:prom_init_numa_memory()
> The symbol prom_init_numa_memory is exported and annotated __init
> Fix this by removing the __init annotation of prom_init_numa_memory or drop the export.

This might aggravate the ability of scripts parsing build logs for
"warning:" case insensitive to accurately report what the warning is.

>
> This is based on Linux 5.19-rc4.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>
> v2: update the commit message
>
>  scripts/mod/modpost.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 620dc8c..4cc894f 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1320,8 +1320,8 @@ static void report_sec_mismatch(const char *modname,
>         get_pretty_name(from_is_func, &from, &from_p);
>         get_pretty_name(to_is_func, &to, &to_p);
>
> -       warn("%s(%s+0x%llx): Section mismatch in reference from the %s %s%s "
> -            "to the %s %s:%s%s\n",
> +       warn("%s(%s+0x%llx): Section mismatch in reference\n"
> +            "from the %s %s%s to the %s %s:%s%s\n",
>              modname, fromsec, fromaddr, from, fromsym, from_p, to, tosec,
>              tosym, to_p);
>
> --
> 2.1.0
>


-- 
Thanks,
~Nick Desaulniers
