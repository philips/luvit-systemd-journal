local ffi = require('ffi')
local timer = require('timer')
local Object = require('core').Object
local fmt = require('string').format

local timeout = 20
local success = false

-- From /usr/include/systemd/sd-journal.h
ffi.cdef[[
int sd_journal_print(int priority, const char *format, ...);
int sd_journal_send(const char *format, ...);
]]

local binding = ffi.load('libsystemd-journal.so')

local Journal = Object:extend()

function Journal:print(priority, message)
  return binding.sd_journal_print(ffi.new("int", priority), message) 
end

function Journal:send(...)
  return binding.sd_journal_send(...) 
end

return Journal
