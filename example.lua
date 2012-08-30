local fmt = require('string').format
local Journal = require('.')

j = Journal:new()

j:print(1, "Hello World From Print")
j:send("PRIORITY=1", "MESSAGE=Hello World From Send", fmt("VERSION=%s", process.version), nil)
