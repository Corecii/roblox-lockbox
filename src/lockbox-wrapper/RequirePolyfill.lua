local RequirePolyfill = {}
RequirePolyfill.__index = RequirePolyfill

RequirePolyfill.STANDARD_LIBRARY = {
	string = string,
	math = math,
	bit32 = bit32,
	table = table,
}

function RequirePolyfill.new()
	local self = {}
	setmetatable(self, RequirePolyfill)

	self.standardLibrary = {}
	self.roots = {}

	for key, value in pairs(RequirePolyfill.STANDARD_LIBRARY) do
		self.standardLibrary[key] = value
	end

	return self
end

function RequirePolyfill:addStandardLibrary(key, value)
	self.standardLibrary[key] = value
end

function RequirePolyfill:addRoot(key, instance)
	self.roots[key] = instance
end

function RequirePolyfill:require(target)
	if self.standardLibrary[target] then
		return self.standardLibrary[target]
	end

	local path = string.split(target, ".")
	local rootName = path[1]
	local root = self.roots[rootName]
	if not root then
		error(string.format("Bad require target root: %s (in path %s)", rootName, target))
	end

	local item = root
	for index, subTarget in ipairs(path) do
		if index == 1 then
			continue
		end

		item = item:FindFirstChild(subTarget)
		if not item then
			error(string.format("Bad require target: %s (in path %s)", subTarget, target))
		end
	end

	return require(item)
end

function RequirePolyfill:makeStandardRequire()
	return function(...)
		return self:require(...)
	end
end

return RequirePolyfill
