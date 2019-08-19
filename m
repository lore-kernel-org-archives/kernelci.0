MIME-Version: 1.0
From: Xiaofeng Ren <rockrxf@gmail.com>
Date: Mon, 19 Aug 2019 10:10:47 +0800
Message-ID: <CANtOwNowQfWmsdO6p2D-JdaBzCmqkmHOVqcK9xop+aLc7kbk7Q@mail.gmail.com>
Subject: Help on LAVA and KernelCI integration
Content-Type: multipart/alternative; boundary="000000000000c794d405906ed95a"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--000000000000c794d405906ed95a
Content-Type: text/plain; charset="UTF-8"

Anyone can help to provide some suggestion about following kernelci
integration problem:
We setup one kernelci in our infrastructure and deploy LAVA master and
slave as well. kernelci can support build, LAVA can also work to run
automation test. We use the lava-boot-v2.sh (jenkins job in kernelci-core
project ) to trigger lava test, but we found that both boot report or test
report can't be synchronized to kernelci dashboard. It will report json
format error, may I know whether we need follow boot schema or test schema
defined in kernelci (https://api.kernelci.org/schema-boot.html and
https://api.kernelci.org/schema-test.html) to create one report, then
trigger LAVA callback function to post one request?

Following is callback definition in
https://github.com/kernelci/kernelci-core/blob/master/templates/base/kernel-ci-base.jinja2.
Do we need customize this callback if we want to post request for boot and
test result?  Any suggestion will be appreciated.
{%- if callback %}
notify:
criteria:
status: finished
callback:
{%- if callback_type == 'custom' %}
url: {{ callback_url }}
{%- else %}
url: {{ callback_url }}/callback/{{ callback_name }}?lab_name={{ lab_name
}}&status={STATUS}&status_string={STATUS_STRING}
{%- endif %}
method: POST
dataset: {{ callback_dataset }}
token: {{ callback }}
content-type: json
{% endif %}

--000000000000c794d405906ed95a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Anyone can help to provide some suggestion about following=
 kernelci integration problem:<div>We setup one kernelci in our infrastruct=
ure and deploy LAVA master and slave as well. kernelci can support build, L=
AVA can also work to run automation test. We use the lava-boot-v2.sh (jenki=
ns job in kernelci-core project ) to trigger lava test, but we found that b=
oth boot report or test report can&#39;t be synchronized to kernelci dashbo=
ard. It will report json format error, may I know whether we need follow bo=
ot schema or test schema defined in kernelci (<a href=3D"https://api.kernel=
ci.org/schema-boot.html" target=3D"_blank">https://api.kernelci.org/schema-=
boot.html</a>=C2=A0and=C2=A0<a href=3D"https://api.kernelci.org/schema-test=
.html" target=3D"_blank">https://api.kernelci.org/schema-test.html</a>) to =
create one report, then trigger LAVA callback function to post one request?=
=C2=A0</div><div><br></div><div>Following is callback definition in=C2=A0<a=
 href=3D"https://github.com/kernelci/kernelci-core/blob/master/templates/ba=
se/kernel-ci-base.jinja2" target=3D"_blank">https://github.com/kernelci/ker=
nelci-core/blob/master/templates/base/kernel-ci-base.jinja2</a>. Do we need=
 customize this callback if we want to post request for boot and test resul=
t?=C2=A0 Any suggestion will be appreciated.=C2=A0</div><div><table class=
=3D"gmail-m_-591551234835720720gmail-highlight gmail-m_-591551234835720720g=
mail-tab-size gmail-m_-591551234835720720gmail-js-file-line-container" styl=
e=3D"box-sizing:border-box;border-collapse:collapse;border-spacing:0px;colo=
r:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI=
&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:14px"><tbody style=3D=
"box-sizing:border-box"><tr style=3D"box-sizing:border-box"><td id=3D"gmail=
-m_-591551234835720720gmail-LC44" class=3D"gmail-m_-591551234835720720gmail=
-blob-code gmail-m_-591551234835720720gmail-blob-code-inner gmail-m_-591551=
234835720720gmail-js-file-line" style=3D"font-family:SFMono-Regular,Consola=
s,&quot;Liberation Mono&quot;,Menlo,monospace;box-sizing:border-box;padding=
:0px 10px;line-height:20px;vertical-align:top;font-size:12px;overflow:visib=
le;white-space:pre-wrap"><span class=3D"gmail-m_-591551234835720720gmail-pl=
-e" style=3D"box-sizing:border-box;color:rgb(111,66,193)">{%</span>- <span =
class=3D"gmail-m_-591551234835720720gmail-pl-k" style=3D"box-sizing:border-=
box;color:rgb(215,58,73)">if</span> <span class=3D"gmail-m_-591551234835720=
720gmail-pl-s" style=3D"box-sizing:border-box;color:rgb(3,47,98)">callback<=
/span> <span class=3D"gmail-m_-591551234835720720gmail-pl-e" style=3D"box-s=
izing:border-box;color:rgb(111,66,193)">%}</span></td></tr><tr style=3D"box=
-sizing:border-box"><td id=3D"gmail-m_-591551234835720720gmail-L45" class=
=3D"gmail-m_-591551234835720720gmail-blob-num gmail-m_-591551234835720720gm=
ail-js-line-number" style=3D"font-family:SFMono-Regular,Consolas,&quot;Libe=
ration Mono&quot;,Menlo,monospace;box-sizing:border-box;padding:0px 10px;co=
lor:rgba(27,31,35,0.3);font-size:12px;line-height:20px;min-width:50px;text-=
align:right;vertical-align:top;white-space:nowrap;width:50.0168px"></td><td=
 id=3D"gmail-m_-591551234835720720gmail-LC45" class=3D"gmail-m_-59155123483=
5720720gmail-blob-code gmail-m_-591551234835720720gmail-blob-code-inner gma=
il-m_-591551234835720720gmail-js-file-line" style=3D"font-family:SFMono-Reg=
ular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;box-sizing:border=
-box;padding:0px 10px;line-height:20px;vertical-align:top;font-size:12px;ov=
erflow:visible;white-space:pre-wrap">notify:</td></tr><tr style=3D"box-sizi=
ng:border-box"><td id=3D"gmail-m_-591551234835720720gmail-L46" class=3D"gma=
il-m_-591551234835720720gmail-blob-num gmail-m_-591551234835720720gmail-js-=
line-number" style=3D"font-family:SFMono-Regular,Consolas,&quot;Liberation =
Mono&quot;,Menlo,monospace;box-sizing:border-box;padding:0px 10px;color:rgb=
a(27,31,35,0.3);font-size:12px;line-height:20px;min-width:50px;text-align:r=
ight;vertical-align:top;white-space:nowrap;width:50.0168px"></td><td id=3D"=
gmail-m_-591551234835720720gmail-LC46" class=3D"gmail-m_-591551234835720720=
gmail-blob-code gmail-m_-591551234835720720gmail-blob-code-inner gmail-m_-5=
91551234835720720gmail-js-file-line" style=3D"font-family:SFMono-Regular,Co=
nsolas,&quot;Liberation Mono&quot;,Menlo,monospace;box-sizing:border-box;pa=
dding:0px 10px;line-height:20px;vertical-align:top;font-size:12px;overflow:=
visible;white-space:pre-wrap">  criteria:</td></tr><tr style=3D"box-sizing:=
border-box"><td id=3D"gmail-m_-591551234835720720gmail-L47" class=3D"gmail-=
m_-591551234835720720gmail-blob-num gmail-m_-591551234835720720gmail-js-lin=
e-number" style=3D"font-family:SFMono-Regular,Consolas,&quot;Liberation Mon=
o&quot;,Menlo,monospace;box-sizing:border-box;padding:0px 10px;color:rgba(2=
7,31,35,0.3);font-size:12px;line-height:20px;min-width:50px;text-align:righ=
t;vertical-align:top;white-space:nowrap;width:50.0168px"></td><td id=3D"gma=
il-m_-591551234835720720gmail-LC47" class=3D"gmail-m_-591551234835720720gma=
il-blob-code gmail-m_-591551234835720720gmail-blob-code-inner gmail-m_-5915=
51234835720720gmail-js-file-line" style=3D"font-family:SFMono-Regular,Conso=
las,&quot;Liberation Mono&quot;,Menlo,monospace;box-sizing:border-box;paddi=
ng:0px 10px;line-height:20px;vertical-align:top;font-size:12px;overflow:vis=
ible;white-space:pre-wrap">    status: finished</td></tr><tr style=3D"box-s=
izing:border-box"><td id=3D"gmail-m_-591551234835720720gmail-L48" class=3D"=
gmail-m_-591551234835720720gmail-blob-num gmail-m_-591551234835720720gmail-=
js-line-number" style=3D"font-family:SFMono-Regular,Consolas,&quot;Liberati=
on Mono&quot;,Menlo,monospace;box-sizing:border-box;padding:0px 10px;color:=
rgba(27,31,35,0.3);font-size:12px;line-height:20px;min-width:50px;text-alig=
n:right;vertical-align:top;white-space:nowrap;width:50.0168px"></td><td id=
=3D"gmail-m_-591551234835720720gmail-LC48" class=3D"gmail-m_-59155123483572=
0720gmail-blob-code gmail-m_-591551234835720720gmail-blob-code-inner gmail-=
m_-591551234835720720gmail-js-file-line" style=3D"font-family:SFMono-Regula=
r,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;box-sizing:border-bo=
x;padding:0px 10px;line-height:20px;vertical-align:top;font-size:12px;overf=
low:visible;white-space:pre-wrap">  callback:</td></tr><tr style=3D"box-siz=
ing:border-box"><td id=3D"gmail-m_-591551234835720720gmail-L49" class=3D"gm=
ail-m_-591551234835720720gmail-blob-num gmail-m_-591551234835720720gmail-js=
-line-number" style=3D"font-family:SFMono-Regular,Consolas,&quot;Liberation=
 Mono&quot;,Menlo,monospace;box-sizing:border-box;padding:0px 10px;color:rg=
ba(27,31,35,0.3);font-size:12px;line-height:20px;min-width:50px;text-align:=
right;vertical-align:top;white-space:nowrap;width:50.0168px"></td><td id=3D=
"gmail-m_-591551234835720720gmail-LC49" class=3D"gmail-m_-59155123483572072=
0gmail-blob-code gmail-m_-591551234835720720gmail-blob-code-inner gmail-m_-=
591551234835720720gmail-js-file-line" style=3D"font-family:SFMono-Regular,C=
onsolas,&quot;Liberation Mono&quot;,Menlo,monospace;box-sizing:border-box;p=
adding:0px 10px;line-height:20px;vertical-align:top;font-size:12px;overflow=
:visible;white-space:pre-wrap"><span class=3D"gmail-m_-591551234835720720gm=
ail-pl-e" style=3D"box-sizing:border-box;color:rgb(111,66,193)">{%</span>- =
<span class=3D"gmail-m_-591551234835720720gmail-pl-k" style=3D"box-sizing:b=
order-box;color:rgb(215,58,73)">if</span> <span class=3D"gmail-m_-591551234=
835720720gmail-pl-s" style=3D"box-sizing:border-box;color:rgb(3,47,98)">cal=
lback_type</span> =3D=3D <span class=3D"gmail-m_-591551234835720720gmail-pl=
-s" style=3D"box-sizing:border-box;color:rgb(3,47,98)">&#39;custom&#39;</sp=
an> <span class=3D"gmail-m_-591551234835720720gmail-pl-e" style=3D"box-sizi=
ng:border-box;color:rgb(111,66,193)">%}</span></td></tr><tr style=3D"box-si=
zing:border-box"><td id=3D"gmail-m_-591551234835720720gmail-L50" class=3D"g=
mail-m_-591551234835720720gmail-blob-num gmail-m_-591551234835720720gmail-j=
s-line-number" style=3D"font-family:SFMono-Regular,Consolas,&quot;Liberatio=
n Mono&quot;,Menlo,monospace;box-sizing:border-box;padding:0px 10px;color:r=
gba(27,31,35,0.3);font-size:12px;line-height:20px;min-width:50px;text-align=
:right;vertical-align:top;white-space:nowrap;width:50.0168px"></td><td id=
=3D"gmail-m_-591551234835720720gmail-LC50" class=3D"gmail-m_-59155123483572=
0720gmail-blob-code gmail-m_-591551234835720720gmail-blob-code-inner gmail-=
m_-591551234835720720gmail-js-file-line" style=3D"font-family:SFMono-Regula=
r,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;box-sizing:border-bo=
x;padding:0px 10px;line-height:20px;vertical-align:top;font-size:12px;overf=
low:visible;white-space:pre-wrap">    url: {{ callback_url }}</td></tr><tr =
style=3D"box-sizing:border-box"><td id=3D"gmail-m_-591551234835720720gmail-=
L51" class=3D"gmail-m_-591551234835720720gmail-blob-num gmail-m_-5915512348=
35720720gmail-js-line-number" style=3D"font-family:SFMono-Regular,Consolas,=
&quot;Liberation Mono&quot;,Menlo,monospace;box-sizing:border-box;padding:0=
px 10px;color:rgba(27,31,35,0.3);font-size:12px;line-height:20px;min-width:=
50px;text-align:right;vertical-align:top;white-space:nowrap;width:50.0168px=
"></td><td id=3D"gmail-m_-591551234835720720gmail-LC51" class=3D"gmail-m_-5=
91551234835720720gmail-blob-code gmail-m_-591551234835720720gmail-blob-code=
-inner gmail-m_-591551234835720720gmail-js-file-line" style=3D"font-family:=
SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;box-siz=
ing:border-box;padding:0px 10px;line-height:20px;vertical-align:top;font-si=
ze:12px;overflow:visible;white-space:pre-wrap"><span class=3D"gmail-m_-5915=
51234835720720gmail-pl-e" style=3D"box-sizing:border-box;color:rgb(111,66,1=
93)">{%</span>- <span class=3D"gmail-m_-591551234835720720gmail-pl-k" style=
=3D"box-sizing:border-box;color:rgb(215,58,73)">else</span> <span class=3D"=
gmail-m_-591551234835720720gmail-pl-e" style=3D"box-sizing:border-box;color=
:rgb(111,66,193)">%}</span></td></tr><tr style=3D"box-sizing:border-box"><t=
d id=3D"gmail-m_-591551234835720720gmail-L52" class=3D"gmail-m_-59155123483=
5720720gmail-blob-num gmail-m_-591551234835720720gmail-js-line-number" styl=
e=3D"font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,=
monospace;box-sizing:border-box;padding:0px 10px;color:rgba(27,31,35,0.3);f=
ont-size:12px;line-height:20px;min-width:50px;text-align:right;vertical-ali=
gn:top;white-space:nowrap;width:50.0168px"></td><td id=3D"gmail-m_-59155123=
4835720720gmail-LC52" class=3D"gmail-m_-591551234835720720gmail-blob-code g=
mail-m_-591551234835720720gmail-blob-code-inner gmail-m_-591551234835720720=
gmail-js-file-line" style=3D"font-family:SFMono-Regular,Consolas,&quot;Libe=
ration Mono&quot;,Menlo,monospace;box-sizing:border-box;padding:0px 10px;li=
ne-height:20px;vertical-align:top;font-size:12px;overflow:visible;white-spa=
ce:pre-wrap">    url: {{ callback_url }}/callback/{{ callback_name }}?lab_n=
ame=3D{{ lab_name }}&amp;status=3D{STATUS}&amp;status_string=3D{STATUS_STRI=
NG}</td></tr><tr style=3D"box-sizing:border-box"><td id=3D"gmail-m_-5915512=
34835720720gmail-L53" class=3D"gmail-m_-591551234835720720gmail-blob-num gm=
ail-m_-591551234835720720gmail-js-line-number" style=3D"font-family:SFMono-=
Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;box-sizing:bor=
der-box;padding:0px 10px;color:rgba(27,31,35,0.3);font-size:12px;line-heigh=
t:20px;min-width:50px;text-align:right;vertical-align:top;white-space:nowra=
p;width:50.0168px"></td><td id=3D"gmail-m_-591551234835720720gmail-LC53" cl=
ass=3D"gmail-m_-591551234835720720gmail-blob-code gmail-m_-5915512348357207=
20gmail-blob-code-inner gmail-m_-591551234835720720gmail-js-file-line" styl=
e=3D"font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,=
monospace;box-sizing:border-box;padding:0px 10px;line-height:20px;vertical-=
align:top;font-size:12px;overflow:visible;white-space:pre-wrap"><span class=
=3D"gmail-m_-591551234835720720gmail-pl-e" style=3D"box-sizing:border-box;c=
olor:rgb(111,66,193)">{%</span>- <span class=3D"gmail-m_-591551234835720720=
gmail-pl-k" style=3D"box-sizing:border-box;color:rgb(215,58,73)">endif</spa=
n> <span class=3D"gmail-m_-591551234835720720gmail-pl-e" style=3D"box-sizin=
g:border-box;color:rgb(111,66,193)">%}</span></td></tr><tr style=3D"box-siz=
ing:border-box"><td id=3D"gmail-m_-591551234835720720gmail-L54" class=3D"gm=
ail-m_-591551234835720720gmail-blob-num gmail-m_-591551234835720720gmail-js=
-line-number" style=3D"font-family:SFMono-Regular,Consolas,&quot;Liberation=
 Mono&quot;,Menlo,monospace;box-sizing:border-box;padding:0px 10px;color:rg=
ba(27,31,35,0.3);font-size:12px;line-height:20px;min-width:50px;text-align:=
right;vertical-align:top;white-space:nowrap;width:50.0168px"></td><td id=3D=
"gmail-m_-591551234835720720gmail-LC54" class=3D"gmail-m_-59155123483572072=
0gmail-blob-code gmail-m_-591551234835720720gmail-blob-code-inner gmail-m_-=
591551234835720720gmail-js-file-line" style=3D"font-family:SFMono-Regular,C=
onsolas,&quot;Liberation Mono&quot;,Menlo,monospace;box-sizing:border-box;p=
adding:0px 10px;line-height:20px;vertical-align:top;font-size:12px;overflow=
:visible;white-space:pre-wrap">    method: POST</td></tr><tr style=3D"box-s=
izing:border-box"><td id=3D"gmail-m_-591551234835720720gmail-L55" class=3D"=
gmail-m_-591551234835720720gmail-blob-num gmail-m_-591551234835720720gmail-=
js-line-number" style=3D"font-family:SFMono-Regular,Consolas,&quot;Liberati=
on Mono&quot;,Menlo,monospace;box-sizing:border-box;padding:0px 10px;color:=
rgba(27,31,35,0.3);font-size:12px;line-height:20px;min-width:50px;text-alig=
n:right;vertical-align:top;white-space:nowrap;width:50.0168px"></td><td id=
=3D"gmail-m_-591551234835720720gmail-LC55" class=3D"gmail-m_-59155123483572=
0720gmail-blob-code gmail-m_-591551234835720720gmail-blob-code-inner gmail-=
m_-591551234835720720gmail-js-file-line" style=3D"font-family:SFMono-Regula=
r,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;box-sizing:border-bo=
x;padding:0px 10px;line-height:20px;vertical-align:top;font-size:12px;overf=
low:visible;white-space:pre-wrap">    dataset: {{ callback_dataset }}</td><=
/tr><tr style=3D"box-sizing:border-box"><td id=3D"gmail-m_-5915512348357207=
20gmail-L56" class=3D"gmail-m_-591551234835720720gmail-blob-num gmail-m_-59=
1551234835720720gmail-js-line-number" style=3D"font-family:SFMono-Regular,C=
onsolas,&quot;Liberation Mono&quot;,Menlo,monospace;box-sizing:border-box;p=
adding:0px 10px;color:rgba(27,31,35,0.3);font-size:12px;line-height:20px;mi=
n-width:50px;text-align:right;vertical-align:top;white-space:nowrap;width:5=
0.0168px"></td><td id=3D"gmail-m_-591551234835720720gmail-LC56" class=3D"gm=
ail-m_-591551234835720720gmail-blob-code gmail-m_-591551234835720720gmail-b=
lob-code-inner gmail-m_-591551234835720720gmail-js-file-line" style=3D"font=
-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace=
;box-sizing:border-box;padding:0px 10px;line-height:20px;vertical-align:top=
;font-size:12px;overflow:visible;white-space:pre-wrap">    token: {{ callba=
ck }}</td></tr><tr style=3D"box-sizing:border-box"><td id=3D"gmail-m_-59155=
1234835720720gmail-L57" class=3D"gmail-m_-591551234835720720gmail-blob-num =
gmail-m_-591551234835720720gmail-js-line-number" style=3D"font-family:SFMon=
o-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;box-sizing:b=
order-box;padding:0px 10px;color:rgba(27,31,35,0.3);font-size:12px;line-hei=
ght:20px;min-width:50px;text-align:right;vertical-align:top;white-space:now=
rap;width:50.0168px"></td><td id=3D"gmail-m_-591551234835720720gmail-LC57" =
class=3D"gmail-m_-591551234835720720gmail-blob-code gmail-m_-59155123483572=
0720gmail-blob-code-inner gmail-m_-591551234835720720gmail-js-file-line" st=
yle=3D"font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menl=
o,monospace;box-sizing:border-box;padding:0px 10px;line-height:20px;vertica=
l-align:top;font-size:12px;overflow:visible;white-space:pre-wrap">    conte=
nt-type: json</td></tr><tr style=3D"box-sizing:border-box"><td id=3D"gmail-=
m_-591551234835720720gmail-L58" class=3D"gmail-m_-591551234835720720gmail-b=
lob-num gmail-m_-591551234835720720gmail-js-line-number" style=3D"font-fami=
ly:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;box-=
sizing:border-box;padding:0px 10px;color:rgba(27,31,35,0.3);font-size:12px;=
line-height:20px;min-width:50px;text-align:right;vertical-align:top;white-s=
pace:nowrap;width:50.0168px"></td><td id=3D"gmail-m_-591551234835720720gmai=
l-LC58" class=3D"gmail-m_-591551234835720720gmail-blob-code gmail-m_-591551=
234835720720gmail-blob-code-inner gmail-m_-591551234835720720gmail-js-file-=
line" style=3D"font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&qu=
ot;,Menlo,monospace;box-sizing:border-box;padding:0px 10px;line-height:20px=
;vertical-align:top;font-size:12px;overflow:visible;white-space:pre-wrap"><=
span class=3D"gmail-m_-591551234835720720gmail-pl-e" style=3D"box-sizing:bo=
rder-box;color:rgb(111,66,193)">{%</span> <span class=3D"gmail-m_-591551234=
835720720gmail-pl-k" style=3D"box-sizing:border-box;color:rgb(215,58,73)">e=
ndif</span> <span class=3D"gmail-m_-591551234835720720gmail-pl-e" style=3D"=
box-sizing:border-box;color:rgb(111,66,193)">%}</span></td></tr></tbody></t=
able></div></div>

--000000000000c794d405906ed95a--
