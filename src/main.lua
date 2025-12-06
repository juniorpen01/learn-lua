-- this uses vim/neovim typa shi for some reason

local MIN_RANDOM_NUMBER = 1
local MAX_RANDOM_NUMBER = 100

math.randomseed(os.time())

print(string.format(
	[[Number Guessing Game

Guess a number from %d-%d! Let's see how efficient you are.

]],
	MIN_RANDOM_NUMBER,
	MAX_RANDOM_NUMBER
))

while true do
	local isPlaying
	while true do
		local input = string.upper(vim.fn.input("Do you want to play? (Y/n): "))
		if input == "" or input == "Y" then
			isPlaying = true
			break
		elseif input == "N" then
			isPlaying = false
			break
		end
	end

	if isPlaying then
		local randomNumber = math.random(MIN_RANDOM_NUMBER, MAX_RANDOM_NUMBER)

		while true do
			local guessNumber
			while true do
				local input =
					vim.fn.input(string.format("Guess a number from %d-%d!: ", MIN_RANDOM_NUMBER, MAX_RANDOM_NUMBER))
				print("\n")

				local value = tonumber(input)
				if value < MIN_RANDOM_NUMBER or value > MAX_RANDOM_NUMBER then
					print(
						string.format(
							"We already told you to guess from %d-%d! Do better!",
							MIN_RANDOM_NUMBER,
							MAX_RANDOM_NUMBER
						)
					)
				else
					guessNumber = value
					break
				end
			end

			if guessNumber < randomNumber then
				print("Too low!")
			elseif guessNumber > randomNumber then
				print("Too high!")
			else
				print("Equal!")
				break
			end
		end
		while true do
			local input = string.upper(vim.fn.input("Do you want to play again? (Y/n): "))
			if input == "" or input == "Y" then
				isPlaying = true
				break
			elseif input == "N" then
				isPlaying = false
				break
			end
		end
	else
		break
	end
end

print("\nThanks for playing!")
