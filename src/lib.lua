local function sayName()
	print("lib")
end

local M = {
	sayHello = function()
		print("Hello there, ")
		sayName()
	end,
}

print("Hello from lib")
print("Hello from lib")

return M
