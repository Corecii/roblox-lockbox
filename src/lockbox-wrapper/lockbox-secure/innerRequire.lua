local RequirePolyfill = require(script.Parent.Parent.RequirePolyfill)

local requirePolyfill = RequirePolyfill.new()
requirePolyfill:addRoot("lockbox", script.Parent["lockbox-autogen"])
requirePolyfill:addStandardLibrary("lockbox", {
	insecure = function()
		error(
			"This module is insecure! It should not be used in production. "
				.. "If you really want to use it, use lockbox.insecure.* instead of lockbox.*"
		)
	end,
})

return requirePolyfill:makeStandardRequire()
