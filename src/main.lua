-- this uses vim/neovim typa shi for some reason

local MIN = 1
local MAX = 100

local INTRO = string.format(
	[[Number Guessing Game

Guess a number from %d-%d! Let's see how efficient you are!

]],
	MIN,
	MAX
)
local PLAY_PROMPT = "Do you want to play?"
local GUESS_PROMPT = string.format("Pick an integer from (%d to %d): ", MIN, MAX)

---@param prompt string
local function getInput(prompt)
	local input = vim.fn.input(prompt)
	vim.print("\n")
	return input
end

---@param prompt string
local function askYesOrNo(prompt)
	while true do
		local input = string.upper(getInput(prompt .. " (Y/n): "))
		if input == "" or input == "Y" then
			return true
		elseif input == "N" then
			return false
		end
	end
end

---@param prompt string
---@return integer
local function getInt(prompt)
	while true do
		local input = getInput(prompt)

		local foo = tonumber(input)
		if foo then
			local bar = math.floor(foo)
			if foo == bar then
				return bar
			end
		end
	end
end

---@param prompt string
local function getGuess(prompt)
	while true do
		local guess = getInt(prompt)
		if guess < MIN or guess > MAX then
			vim.print("Really? You were already told the range. Do better!")
		else
			return guess
		end
	end
end

vim.print(INTRO)

if not askYesOrNo(PLAY_PROMPT) then
	return
end

math.randomseed(os.time())

local random = math.random(MIN, MAX)

while true do
	local guess = getGuess(GUESS_PROMPT)
	if guess < random then
		vim.print("higher!")
	elseif guess > random then
		vim.print("lower!")
	else
		vim.print("nice!")
		break
	end
end

-- i am not doing "replay" just to express my dissent with this code bruh
