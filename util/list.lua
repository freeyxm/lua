-- list
-- by yxm

--module(..., package.seeall);

list = 
{
	head = 1,
	tail = 0,
	data = {},
}
list.__index = list;

function list:new()
	local o = {};
	setmetatable(o, self);
	list.__tostring = list.tostr;
	o:clear();
	return o;
end

function list:push_front( obj )
	self.head = self.head - 1;
	self.data[self.head] = obj;
end

function list:push_back( obj )
	self.tail = self.tail + 1;
	self.data[self.tail] = obj;
end

function list:pop_front()
	if self:empty() then
		return nil;
	end
	
	local tmp = self.data[self.head];
	if (self.head >= self.tail) then
		clear();
	else
		self.data[self.head] = nil;
		self.head = self.head + 1;
	end
	return tmp;
end

function list:pop_back()
	if self:empty() then
		return nil;
	end
	
	local tmp = self.data[self.tail];
	if (self.head >= self.tail) then
		clear();
	else
		self.data[self.tail] = nil;
		self.tail = self.tail - 1;
	end
	return tmp;
end

function list:front()
	if self:empty() then
		return nil;
	end
	return self.data[self.head];
end

function list:back()
	if self:empty() then
		return nil;
	end
	return self.data[self.head];
end

function list:clear()
	self.head = 1;
	self.tail = self.head - 1;
	self.data = {};
end

function list:empty()
	return self.head > self.tail;
end

function list:tostr()
	local tmp = "";
	for i = self.head, self.tail, 1 do
		tmp = tmp .. self.data[i] .. ',';
	end
	return tmp;
end

--[[
-- test code
local tmp = list:new();
tmp:push_back("a"); print(tmp);
tmp:push_back("b"); print(tmp);
tmp:push_front("c"); print(tmp);
print(tmp:pop_back()); print(tmp);
print(tmp:pop_front()); print(tmp);
print(tmp:empty());
tmp:clear(); print(tmp);
--]]
