# luvit systemd journal binding

FFI based luvit binding for the systemd journal.

## Usage

As a first pass the

```
local fmt = require('string').format
local Journal = require('systemd-journal')

j = Journal:new()

j:print(1, "Hello World From Print")
j:send("PRIORITY=1", "MESSAGE=Hello World From Send", fmt("VERSION=%s", process.version), nil)
```

## Example Output

```
$ journalctl -a --no-pager -o json _COMM=luvit
{
	"__CURSOR" : "s=d58ef18f951e4e339f5270c8078449c6;i=98d;b=cd1a5d7ff6a94fadb4527bfcf58ade0d;m=3e9b7655b;t=4c88284d8d524;x=3415b51775800191;p=system.journal",
	"__REALTIME_TIMESTAMP" : "1346362806949156",
	"__MONOTONIC_TIMESTAMP" : "16806012251",
	"_BOOT_ID" : "cd1a5d7ff6a94fadb4527bfcf58ade0d",
	"MESSAGE" : "Hello World From Print",
	"PRIORITY" : "1",
	"_TRANSPORT" : "journal",
	"_PID" : "4129",
	"_UID" : "1001",
	"_GID" : "1001",
	"_COMM" : "luvit",
	"_EXE" : "/home/philips/luvit/out/Debug/luvit",
	"_CMDLINE" : "./out/Debug/luvit tests/systemd-journal.lua",
	"_AUDIT_SESSION" : "21",
	"_AUDIT_LOGINUID" : "1001",
	"_SYSTEMD_CGROUP" : "/user/philips/21",
	"_SYSTEMD_SESSION" : "21",
	"_SELINUX_CONTEXT" : "unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023",
	"_SOURCE_REALTIME_TIMESTAMP" : "1346362806948744",
	"_MACHINE_ID" : "9e3d4b6532ff41e1ab40d6b4e5609907",
	"_HOSTNAME" : "fedora17vm.local"
},
{
	"__CURSOR" : "s=d58ef18f951e4e339f5270c8078449c6;i=98e;b=cd1a5d7ff6a94fadb4527bfcf58ade0d;m=3e9b76990;t=4c88284d8d959;x=5cf8d9945f34aab1;p=system.journal",
	"__REALTIME_TIMESTAMP" : "1346362806950233",
	"__MONOTONIC_TIMESTAMP" : "16806013328",
	"_BOOT_ID" : "cd1a5d7ff6a94fadb4527bfcf58ade0d",
	"PRIORITY" : "1",
	"MESSAGE" : "Hello World From Send",
	"VERSION" : "0.5.0-163-g255e888",
	"_TRANSPORT" : "journal",
	"_PID" : "4129",
	"_UID" : "1001",
	"_GID" : "1001",
	"_COMM" : "luvit",
	"_EXE" : "/home/philips/luvit/out/Debug/luvit",
	"_CMDLINE" : "./out/Debug/luvit tests/systemd-journal.lua",
	"_AUDIT_SESSION" : "21",
	"_AUDIT_LOGINUID" : "1001",
	"_SYSTEMD_CGROUP" : "/user/philips/21",
	"_SYSTEMD_SESSION" : "21",
	"_SELINUX_CONTEXT" : "unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023",
	"_SOURCE_REALTIME_TIMESTAMP" : "1346362806949842",
	"_MACHINE_ID" : "9e3d4b6532ff41e1ab40d6b4e5609907",
	"_HOSTNAME" : "fedora17vm.local"
}
]
```
