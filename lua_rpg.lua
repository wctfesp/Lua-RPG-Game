local player = {
	health = 10,
	stamina = 5,
	level = 0,
	damage = 5,
}

local easy = {
	health = 10,
	stamina = 5,
	level = 2,
	damage = math.random(2, 5),
}

local medium = {
	health = 50,
	stamina = 15,
	level = 7,
	damage = 6,
}

local hard = {
	health = 100,
	stamina = 30,
	level = 15,
	damage = 20,
}

local function fight()
	print("A Goblin Appeared!")
	player.health = player.health - easy.damage
	print("The damage scratched you and you have " .. player.health .. " now!")

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
	print("3. Exit")

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
