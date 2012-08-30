local fmt = require('string').format
local Journal = require('.')

j = Journal:new()

j:print(1, "Hello World From Print")
j:send({priority=1, message="Hello World From Send", version=process.version})
