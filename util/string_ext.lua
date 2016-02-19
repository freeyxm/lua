-- string relative ext functions
-- by yxm

--module(..., package.seeall)

function string.split( str, delimiter )
	local result = {};
	
	if str == nil or str == '' or delimiter == nil then
		return result;
	end
	
	for mat in string.gmatch(str..delimiter, "(.-)"..delimiter) do
		if string.match(mat, "^%s*$") == nil then
			table.insert(result, mat)
		end
    end
	
	return result;
end

-- test
--require "table_ext"
--print(table.tostr(string.split(",,a,b,c", ",")));