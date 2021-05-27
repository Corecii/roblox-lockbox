local RequirePolyfill = require(game.ReplicatedStorage.lockbox.RequirePolyfill)

local lockboxInsecureInstance = game.ReplicatedStorage.lockbox["lockbox-insecure"]

local requirePolyfill = RequirePolyfill.new()
requirePolyfill:addRoot("lockbox", lockboxInsecureInstance["lockbox-autogen"])
requirePolyfill:addStandardLibrary("lockbox", {
	insecure = function()
	end,
})

return requirePolyfill:makeStandardRequire()
