-- stack
-- by yxm

--module(..., package.seeall);
--list = require("list");
require "list"

stack = list:new();
stack.__index = stack;
stack.__tostring = list.__tostring;

function stack:new()
	local o = {};
	setmetatable(o, self);
	o:clear();
	return o;
end

function stack:push( obj )
	self:push_front(obj);
end

function stack:pop()
	return self:pop_front();
end

function stack:peek()
	return self:front();
end

--[[
-- test
local tmp = stack:new();
tmp:push("a"); print(tmp);
tmp:push("b"); print(tmp);
print(tmp:pop()); print(tmp);
tmp:push("c"); print(tmp);
print(tmp:pop()); print(tmp);
--]]
