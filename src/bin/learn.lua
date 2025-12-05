-- Two dashes

--[[
mult
i
line
]]

print("Hello world")

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

	print(single .. "\n" .. double .. "\n" .. mult_1 .. "\n" .. mult_2 .. nile) -- Uh still confused about diff between mults 1 and 2

	nile = nil

	print(nile)
end
