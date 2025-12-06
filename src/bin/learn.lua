-- Two dashes

--[[
mult
i
line
]]

print("Hello world")

-- variables and data types
do
	local single = "single"
	local double = "double"
	local mult_1 = [[foo
by
bar]]
	local mult_2 = [[
foo
by
bar]]
	---@type integer?
	local nile = 5

	print(single .. "\n" .. double .. "\n" .. mult_1 .. "\n" .. mult_2 .. nile) -- uh still confused about diff between mults 1 and 2

	nile = nil

	print(nile)
end

-- control flow
do
	local num = 0
	while num < 50 do
		num = num + 1
		print(num)
	end

	num = 0
	repeat
		num = num + 1
		print(num)
	until not (num < 50) -- bruh

	num = 0
	while true do
		if not (num < 50) then
			break
		end

		print(num)

		num = num + 1
	end -- finally

	local function foo(acc, stop, step)
		if acc > (stop - 1) then
			return acc
		end
		print(acc)
		return foo(acc + step, stop, step)
	end

	foo(1, 50, 1)
end

do -- funcs
	---@param x number First operand
	local function adder(x)
		---@param y number Second operand
		return function(y)
			return x + y
		end
	end

	local a1 = adder(1)
	local a2 = adder(2)
	print(a1(1))
	print(a2)
	print(a2(4))

	local function foo()
		return 6, 7
	end

	local bar = foo()

	print(foo())
	print(bar)

	local baz = { foo() }
	for i, v in ipairs(baz) do
		print(i, v)
	end

	print(unpack(baz))

	print("hello")
end

do -- tables
	local foo = {
		key1 = 1,
		["@"] = 2,
		foo = function()
			print("hello")
		end,
		bar = function(self)
			print(self)
		end,
		[1] = 3,
		["1foo"] = 4,
		foo1 = 5,
	}

	for k, v in pairs(foo) do
		print(k, v)
	end

	foo:foo()
	foo:bar()

	local function baz(qux)
		print(qux.key1)
	end

	baz(foo)
	baz({
		key1 = 2,
		key2 = 3,
		key3 = 4,
		key4 = 5,
		key5 = 6,
		key6 = 7,
	})

	for k, v in pairs(_G._G._G._G) do -- why can i do this? idk
		print(k, v)
	end

	local quux = { 2, 3, 4, 5, 6, 7, 8 }
	for i = 1, #quux, 2 do
		print(quux[i])
	end
	for i = #quux, 1, -1 do
		print(quux[i])
	end
end

do -- metatables
	local v1 = { x = 1, y = 2 }
	local v2 = { x = 4, y = 3 }

	-- idk how type annotations work
	---@class Vec2
	---@field x number
	---@field y number
	Vec2 = {
		---@return Vec2
		---@param x number
		---@param y number
		new = function(x, y)
			return setmetatable({ x = x, y = y }, Vec2)
		end,
		__add = function(self, other)
			return setmetatable({ x = self.x + other.x, y = self.y + other.y }, Vec2)
		end,
		__tostring = function(self)
			return string.format("%d, %d", self.x, self.y)
		end,
	}

	setmetatable(v1, Vec2)
	setmetatable(v2, Vec2)

	local v3 = v1 + v2
	print(v3)

	local raw_addr = getmetatable(v3).__tostring
	local mt = getmetatable(v3)
	mt.__tostring = nil
	print(v3)
	mt.__tostring = raw_addr

	local v4 = Vec2.new(1, 1)
	local v5 = Vec2.new(2, 2)
	print(v4 + v5)
end
