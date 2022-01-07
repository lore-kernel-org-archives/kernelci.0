MIME-Version: 1.0
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Fri, 7 Jan 2022 16:38:43 +0100
Message-ID: <CACT4Y+ZtsKROJu13VSZcJDCb=rHbF7oh09LVUe3NKGDO3X4L0g@mail.gmail.com>
Subject: Resource not found (resource=kernelci_new)
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: syzkaller <syzkaller@googlegroups.com>, Taras Madan <tarasmadan@google.com>

Hi,

We've started getting the following errors on syzbot while trying to
submit KCIDB reports:

Jan  5 12:09:00: 200 GET /kcidb_poll "kcidb: upstream failed: rpc
error: code = NotFound desc = Resource not found
(resource=kernelci_new)."
Jan  5 12:14:00: 200 GET /kcidb_poll "kcidb: upstream failed: rpc
error: code = NotFound desc = Resource not found
(resource=kernelci_new)."
Jan  5 12:19:00: 200 GET /kcidb_poll "kcidb: upstream failed: rpc
error: code = NotFound desc = Resource not found
(resource=kernelci_new)."

There may be something changed/broken on our side. But I don't see
anything obvious yet. So wanted to ask if it rings any bells on your
end?

Thanks
