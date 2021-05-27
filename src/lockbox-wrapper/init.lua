local requireOnIndex = require(script.requireOnIndex)

local lockboxSecure = requireOnIndex(script["lockbox-secure"]["lockbox-autogen"])
local lockboxInsecure = requireOnIndex(script["lockbox-insecure"]["lockbox-autogen"])

lockboxSecure.insecure = lockboxInsecure

getmetatable(lockboxInsecure).__call = function()
	error(
		"Incorrect use of roblox-lockbox. "
			.. "Unlike lua-lockbox, you don't call lockbox.insecure() to allow insecure use. "
			.. "Instead, use lockbox.insecure.* just like lockbox.* . "
			.. "You can replace your requires with require(lockbox).insecure for convenience."
	)
end

return lockboxSecure

--[[
	THE FOLLOWING LICENSE IS FOR THE FILES WITHIN THE lockbox-autogen FOLDERS AND lockbox-test-autogen FOLDERS

	The MIT License (MIT)

	Copyright (c) 2015 James L.

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
--]]
