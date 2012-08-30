local ffi = require('ffi')
local timer = require('timer')
local Object = require('core').Object
local fmt = require('string').format
local table = require('table')

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

function Journal:send(fields)
  local args = {}

  -- capitalize keys and format table as list of strings
  for i,v in pairs(fields) do
    table.insert(args, fmt("%s=%s", tostring(i):upper(), tostring(v)))
  end

  return binding.sd_journal_send(unpack(args))
end

return Journal
