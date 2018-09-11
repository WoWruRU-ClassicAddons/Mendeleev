string.gmatch = string.gfind

function select(n, ...)
	if not (type(n) == "number" or (type(n) == "string" and n == "#")) then
		error(format("bad argument #1 to 'select' (number expected, got %s)", n and type(n) or "no value"), 2)
	end

	if n == "#" then
		return getn(arg)
	elseif n == 1 then
		return unpack(arg)
	end
	
	local args = {}

	for i = n, getn(arg) do
		args[i-n+1] = arg[i]
	end

	return unpack(args)
end

function string.match(str, pattern, index)
	if type(str) ~= "string" and type(str) ~= "number" then
		error(format("bad argument #1 to 'match' (string expected, got %s)", str and type(str) or "no value"), 2)
	elseif type(pattern) ~= "string" and type(pattern) ~= "number" then
		error(format("bad argument #2 to 'match' (string expected, got %s)", pattern and type(pattern) or "no value"), 2)
	elseif index and type(index) ~= "number" and (type(index) ~= "string" or index == "") then
		error(format("bad argument #3 to 'match' (number expected, got %s)", index and type(index) or "no value"), 2)
	end

	local i1, i2, match, match2 = string.find(str, pattern, index)

	if not match and i2 and i2 >= i1 then
		return string.sub(str, i1, i2)
	elseif match2 then
		local matches = {string.find(str, pattern, index)}
		tremove(matches, 2)
		tremove(matches, 1)
		return unpack(matches)
	end

	return match
end