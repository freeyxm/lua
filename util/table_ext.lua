-- table relative ext functions
-- by yxm

--module(..., package.seeall)

local function _Table2String( tab, indent, result )
	if tab == nil then
		return;
	end

	result = result or {};
	indent = indent or 0
	local prefix = string.rep("    ", indent);

	if type(tab) ~= "table" then
		if type(tab) == "string" then
			tab = string.format("%q", tab);
		end
		result[#result + 1] = prefix;
		result[#result + 1] = tostring(tab);
		result[#result + 1] = ",\n";
		return;
	end

	for k,v in pairs(tab) do
		if type(k) == "string" then
			k = string.format("%q", k);
		end

		result[#result + 1] = prefix;
		result[#result + 1] = "[";
		result[#result + 1] = tostring(k);
		result[#result + 1] = "] = ";

		if type(v) == "table" then
			result[#result + 1] = "{\n";
			_Table2String(v, indent+1, result);
			result[#result + 1] = prefix;
			result[#result + 1] = "},\n";
		else
			if type(v) == "string" then
				v = string.format("%q", v);
			end
			result[#result + 1] = tostring(v);
			result[#result + 1] = ",\n";
		end
	end
end

function table.tostr( tab, indent )
	local result = {};
	_Table2String(tab, indent, result);
	return table.concat(result);
end

function table.copy( tab )
	if type(tab) ~= 'table' then
		return tab;
	end
	
	local temp = {};
	setmetatable(temp, getmetatable(tab));
	
	for k,v in pairs(tab) do
		k = (type(k) == 'table') and table.copy(k) or k
		v = (type(v) == 'table') and table.copy(v) or v
		temp[k] = v;
	end
	
	return temp;
end

-- test
--print(table.tostr(table));