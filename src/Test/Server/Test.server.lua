for _, child in ipairs(script.Parent.test["lockbox-test-autogen"]:GetChildren()) do
	print("Running test", child.Name)
	require(child)()
	print("Test", child.Name, "passed")
end
