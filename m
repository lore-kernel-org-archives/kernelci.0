Return-Path: <Nikolai.Kondrashov@redhat.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: Tuxsuite sending impossible commit names to KCIDB
Message-ID: <4fe6b129-4ce9-fcac-112c-42d9b8094999@redhat.com>
Date: Mon, 25 Oct 2021 17:46:50 +0300
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Groupsio=g3uxJAGb54YdUpvSxboj"
List-ID: <kernelci.groups.io>
To: Vishal Bhoj <vishal.bhoj@linaro.org>, kernelci@groups.io

--Groupsio=g3uxJAGb54YdUpvSxboj
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vishal,

I've just noticed that tuxsuite is sending impossible values of "commit_name" 
revision fields to KCIDB. Please see one example attached.

The revision specifies the "commit_hash" to be 
"87066fdd2e30fe9dd531125d95257c118a74617e", but the "commit_name" is 
"v5.15-rc6-240-gda1a4fdec89b".

The commit name output by "git describe" is supposed to contain the shortened 
commit hash on the end, after "-g", and this commit name contains the 
shortened hash of another commit, which doesn't seem to exist in the 
referenced repository at all.

Could you check what's going on there, and perhaps fix this?

Thank you.
Nick

P.S. Your fix to the "config_name" seems to be working nicely, thanks!

--Groupsio=g3uxJAGb54YdUpvSxboj
Content-Type: application/json;
 name="017.data.json"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="017.data.json"

ewogICJyZXZpc2lvbnMiOiBbCiAgICB7CiAgICAgICJpZCI6ICI4NzA2NmZkZDJlMzBmZTlkZDUz
MTEyNWQ5NTI1N2MxMThhNzQ2MTdlIiwKICAgICAgIm9yaWdpbiI6ICJ0dXhzdWl0ZSIsCiAgICAg
ICJnaXRfcmVwb3NpdG9yeV91cmwiOiAiaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0IiwKICAgICAgImdpdF9jb21taXRfaGFz
aCI6ICI4NzA2NmZkZDJlMzBmZTlkZDUzMTEyNWQ5NTI1N2MxMThhNzQ2MTdlIiwKICAgICAgImdp
dF9jb21taXRfbmFtZSI6ICJ2NS4xNS1yYzYtMjQwLWdkYTFhNGZkZWM4OWIiLAogICAgICAiZGlz
Y292ZXJ5X3RpbWUiOiAiMjAyMS0xMC0yNVQxMjoyOToxOSswMDowMCIsCiAgICAgICJ2YWxpZCI6
IHRydWUsCiAgICAgICJnaXRfcmVwb3NpdG9yeV9icmFuY2giOiAibWFzdGVyIgogICAgfQogIF0s
CiAgImJ1aWxkcyI6IFsKICAgIHsKICAgICAgImlkIjogInR1eHN1aXRlOjF6enh4ME01SmhhRk5H
WjlvcnJyazN4WGNVZSIsCiAgICAgICJyZXZpc2lvbl9pZCI6ICI4NzA2NmZkZDJlMzBmZTlkZDUz
MTEyNWQ5NTI1N2MxMThhNzQ2MTdlIiwKICAgICAgIm9yaWdpbiI6ICJ0dXhzdWl0ZSIsCiAgICAg
ICJhcmNoaXRlY3R1cmUiOiAiYXJtIiwKICAgICAgImNvbXBpbGVyIjogIkRlYmlhbiBjbGFuZyB2
ZXJzaW9uIDEyLjAuMS0rKzIwMjEwOTE4MDQzMDI2K2ZlZDQxMzQyYTgyZi0xfmV4cDF+MjAyMTA5
MTgxNDM4MDUuMTM2IiwKICAgICAgImNvbmZpZ19uYW1lIjogImFsbG5vY29uZmlnIiwKICAgICAg
ImNvbmZpZ191cmwiOiAiaHR0cHM6Ly9idWlsZHMudHV4YnVpbGQuY29tLzF6enh4ME01SmhhRk5H
WjlvcnJyazN4WGNVZS9jb25maWciLAogICAgICAibG9nX3VybCI6ICJodHRwczovL2J1aWxkcy50
dXhidWlsZC5jb20vMXp6eHgwTTVKaGFGTkdaOW9ycnJrM3hYY1VlL2J1aWxkLmxvZyIsCiAgICAg
ICJzdGFydF90aW1lIjogIjIwMjEtMTAtMjVUMTI6Mjk6MTkrMDA6MDAiLAogICAgICAidmFsaWQi
OiB0cnVlCiAgICB9CiAgXSwKICAidmVyc2lvbiI6IHsKICAgICJtYWpvciI6IDMsCiAgICAibWlu
b3IiOiAwCiAgfQp9Cg==

--Groupsio=g3uxJAGb54YdUpvSxboj--
