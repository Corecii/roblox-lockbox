local function requireOnIndex(parent)
	local proxy = {}
	setmetatable(proxy, {
		__index = function(self, key)
			assert(
				typeof(key) == "string",
				string.format("Expected key to be a string, got a %s instead (value: %s)", typeof(key), tostring(key))
			)

			local item = parent:FindFirstChild(key)
			assert(item, string.format("Item %s does not exist", tostring(key)))

			local result
			if item:IsA("ModuleScript") then
				result = require(item)
			else
				result = requireOnIndex(item)
			end

			rawset(self, key, result)

			return result
		end,
	})

	return proxy
end

return requireOnIndex
