-- queue
-- by yxm

--module(..., package.seeall);
--list = require("list");
require "list"

queue = list:new();
queue.__index = queue;
queue.__tostring = list.__tostring;

function queue:new()
	local o = {};
	setmetatable(o, self);
	o:clear();
	return o;
end

function queue:enqueue( obj )
	self:push_back(obj);
end

function queue:dequeue()
	return self:pop_front();
end

--[[
-- test
local tmp = queue:new();
tmp:enqueue("a"); print(tmp);
tmp:enqueue("b"); print(tmp);
print(tmp:dequeue()); print(tmp);
tmp:enqueue("c"); print(tmp);
print(tmp:dequeue()); print(tmp);
--]]
