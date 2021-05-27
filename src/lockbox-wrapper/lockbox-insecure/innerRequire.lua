local RequirePolyfill = require(script.Parent.Parent.RequirePolyfill)

local requirePolyfill = RequirePolyfill.new()
requirePolyfill:addRoot("lockbox", script.Parent["lockbox-autogen"])
requirePolyfill:addStandardLibrary("lockbox", {
	insecure = function()
	end,
})

return requirePolyfill:makeStandardRequire()
