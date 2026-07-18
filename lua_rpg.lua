local player = {
	health = 10,
	stamina = 5,
	level = 1,
	damage = 1,
}
local easy = {
	health = 10,
	stamina = 5,
	level = 2,
	damage = math.random(2, 4),
}

local medium = {
	health = 50,
	stamina = 15,
	level = 7,
	damage = math.random(5, 7),
}

local hard = {
	health = 100,
	stamina = 30,
	level = 15,
	damage = math.random(15, 20),
}

local function getSkills()
	return {
		slice = 4 + player.damage,
		punch = 2 + player.damage,
		smash = 5 + player.damage,
	}
end

local function fight()
	local skills = getSkills()
	if player.level <= 5 then
		print("\nA Goblin Appeared!\n")
		player.health = player.health - easy.damage
		print("The damage scratched you and you have " .. player.health .. " health now!\n")
		print("1. Slice(" .. skills.slice .. ") 2. Punch(" .. skills.punch .. ") 3. Smash(" .. skills.smash .. ")\n")
		local choice = tonumber(io.read())
		if choice == 1 then
			print("You Dealed " .. skills.slice .. " Damage!\n")
			easy.health = easy.health - skills.slice
		elseif choice == 2 then
			print("You Dealed " .. skills.punch .. " Damage!\n")
			easy.health = easy.health - skills.punch
		elseif choice == 3 then
			print("You Dealed " .. skills.smash .. " Damage!\n")
			easy.health = easy.health - skills.smash
		end
	elseif player.level <= 15 then
		print("\nA Magma Giant Appeared!\n")
		player.health = player.health - medium.damage
		print("The enemy did a lava spit at you and you have " .. player.health .. " health now!\n")
		print("1. Slice(" .. skills.slice .. ") 2. Punch(" .. skills.punch .. ") 3. Smash(" .. skills.smash .. ")\n")
		local choice = tonumber(io.read())
		if choice == 1 then
			print("You Dealed " .. skills.slice .. " Damage!\n")
			medium.health = medium.health - skills.slice
		elseif choice == 2 then
			print("You Dealed " .. skills.punch .. " Damage!\n")
			medium.health = medium.health - skills.punch
		elseif choice == 3 then
			print("You Dealed " .. skills.smash .. " Damage!\n")
			medium.health = medium.health - skills.smash
		end
	end

	if easy.health <= 0 then
		player.level = player.level + 1
		player.health = player.health + 3
		player.damage = player.level * 1.05
		print("You Won! Level +1 Health +3")
	end

	if medium.health <= 0 then
		player.level = player.level + 1
		player.health = player.health + 15
		player.damage = player.level * 1.03
		print("You Won! Level +1 Health +15")
	end

	if player.health <= 0 then
		print("You've Died!")
		os.exit()
	end
end

print(
	"Hello Traveler, this is a world where you'll have to fight monsters to become stronger to defeat the demon king\n"
)
print("Can you do it?\n")
print("The more monsters you kill the more levels you gain which makes you stronger, good luck Traveler!\n\n")

local function menu()
	print("1. Fight")
	print("2. Stats")
	print("3. Exit\n")

	local choice = tonumber(io.read())

	if choice == 1 then
		fight()
	elseif choice == 2 then
		print("Health: " .. player.health)
		print("Damage: " .. player.damage)
		print("Stamina: " .. player.stamina)
		print("Level: " .. player.level .. "\n")
	elseif choice == 3 then
		print("\n" .. "Exit")
		return false
	end

	return true
end

local running = true

while running do
	running = menu()
end
