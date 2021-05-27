local RequirePolyfill = require(game.ReplicatedStorage.lockbox.RequirePolyfill)

local lockboxInsecureInstance = game.ReplicatedStorage.lockbox["lockbox-insecure"]

-- The "standard library" will overwrite direct requires for "lockbox" with our
-- small implementation here. This is used internally by lockbox to check if the
-- module is in secure mode or not. Other requires for e.g. "lockbox.util.bit"
-- (also only done internally) will return the correct module like normal.

local requirePolyfill = RequirePolyfill.new()
requirePolyfill:addRoot("lockbox", lockboxInsecureInstance["lockbox-autogen"])
requirePolyfill:addStandardLibrary("lockbox", {
	insecure = function()
	end,
})

return requirePolyfill:makeStandardRequire()
