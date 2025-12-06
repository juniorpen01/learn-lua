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
