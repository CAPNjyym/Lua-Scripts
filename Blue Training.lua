-- Battles Blue for easy exp. Must be Sunday Night (0000 - 0400 or 2000 - 2400)
-- Starts in front of the Saffron City PokeCenter
--   or in front of the Dojo if no visit to the PokeCenter is scheduled
-- Assumes Blue is already waiting at the Dojo.
--   NOTE: Requires "Fast" text and no battle animation

local pokecenter = true -- true if a visit to the PokeCenter is needed afterwards
local bug = false -- used to find errors, skipping some stuff
local team = 6 -- indicates which team is currently being trained
local crit = 6 -- * 4 = frames to skip in case of a critical hit
local level = 60 -- * 4 = frames to skip in case of a level-up

local function skip (frames)
	for i=1,frames do
		stylus.set{x=128, y=96, touch=true}	emu.frameadvance()
		stylus.set{x=128, y=96, touch=true}	emu.frameadvance()
		emu.frameadvance()
		emu.frameadvance()
	end
end

local function team1() -- Gengar, Lapras, Heracross, ?????, Garchomp, Tyranitar
end
local function team2() -- Meganium, Typhlosion, Feraligatr, Magmortar, Gyarados, Dragonite
end
local function team3() -- Weezing, Primeape, Donphan, Weavile, Kingdra, Arcanine
	-- Total Time: 16984 Frames / 4:43.06
	for i=1,986 do	emu.frameadvance() end
	
	-- Weezing uses Sludge Bomb to KO Exeggutor
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,524 do	emu.frameadvance() end
	skip (164)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Donphan to battle Arcanine
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,41 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=30, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,537 do	emu.frameadvance() end
	
	-- Donphan gets hit by Flare Blitz, causing up to 70-84 damage (254-240 +burn)
	-- Then Donphan uses Earthquake to KO Arcanine
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,464 do	emu.frameadvance() end
	skip (329) -- an extra 30 in case of burn
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Kingdra to battle Rhyperior
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,41 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=62, y=70, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,561 do	emu.frameadvance() end
	
	-- Kingdra uses Waterfall to KO Rhyperior
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,602 do	emu.frameadvance() end
	skip (160)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Arcanine to battle Machamp
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,41 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=78, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,557 do	emu.frameadvance() end
	
	-- Arcanine uses Flare Blitz to KO Machamp, losing 74 HP in the process
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,708 do	emu.frameadvance() end
	skip (141)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Primeape to battle Tyranitar
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,41 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=62, y=118, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,593 do	emu.frameadvance() end
	skip (1)
	for i=1,20 do	emu.frameadvance() end
	skip (1)
	for i=1,12 do	emu.frameadvance() end
	
	-- Primeape uses Close Combat to KO Tyranitar
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,576 do	emu.frameadvance() end
	skip (210)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Weavile to battle Pidgeot
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,41 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=126, touch=true}emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,663 do	emu.frameadvance() end
	skip (1)
	for i=1,70 do	emu.frameadvance() end
	skip (1)
	for i=1,10 do	emu.frameadvance() end
	
	-- Weavile uses Ice Punch to KO Pidgeot
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=51, touch=true}	emu.frameadvance() end
	for i=1,546 do	emu.frameadvance() end
	skip (179)
end
local function team4() -- Ariados, Mantine, Shiftry, Gliscor, Magnezone, Porygon-Z
	-- Total Time: 16328 Frames / 4:32.13
	for i=1,932 do	emu.frameadvance() end
	
	-- Ariados uses Bug Bite to KO Exeggutor
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,520 do	emu.frameadvance() end
	skip (106+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Gliscor to battle Arcanine
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,41 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=30, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,537 do	emu.frameadvance() end
	
	-- Gliscor uses Earthquake to KO Arcanine
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,538 do	emu.frameadvance() end
	skip (89+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Mantine to battle Rhyperior
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,41 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=62, y=70, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,561 do	emu.frameadvance() end
	
	-- Mantine uses Surf to KO Rhyperior
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,604 do	emu.frameadvance() end
	skip (96+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Shiftry to battle Tyranitar
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,41 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=78, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,593 do	emu.frameadvance() end
	skip (1)
	for i=1,20 do	emu.frameadvance() end
	skip (1)
	for i=1,12 do	emu.frameadvance() end
	
	-- Shiftry uses Grass Knot to KO Tyranitar
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=51, touch=true}	emu.frameadvance() end
	for i=1,580 do	emu.frameadvance() end
	skip (135+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Porygon-Z to battle Machamp
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,41 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=62, y=118, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,559 do	emu.frameadvance() end
	
	-- Porygon-Z uses Tri-Attack to KO Machamp
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,564 do	emu.frameadvance() end
	skip (109+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Magnezone to battle Pidgeot
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,41 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=126, touch=true}emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,667 do	emu.frameadvance() end
	skip (1)
	for i=1,42 do	emu.frameadvance() end
	
	-- Magnezone uses Thunderbolt to KO Pidgeot
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,548 do	emu.frameadvance() end
	skip (128+crit+level)
end
local function team5() -- Purugly, Skuntank, Drifblim, Torterra, Infernape, Empoleon
	-- Total Time: 18288 Frames / 4:44.33
	for i=1,932 do	emu.frameadvance() end
	
	-- Skuntank uses Poison Jab to KO Exeggutor
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,524 do	emu.frameadvance() end
	skip (110+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Torterra to battle Rhyperior
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,42 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=30, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,542 do	emu.frameadvance() end
	
	-- Torterra uses Wood Hammer to KO Rhyperior, losing 87 HP in the process
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,624 do	emu.frameadvance() end
	skip (157+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Empoleon to battle Arcanine
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,42 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=62, y=70, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,556 do	emu.frameadvance() end
	
	-- Empoleon uses Surf to KO Arcanine
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,534 do	emu.frameadvance() end
	skip (95+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Purugly to battle Machamp
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,42 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=78, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,556 do	emu.frameadvance() end
	
	-- Purugly uses Fake Out, causing about 1/3+ damage, and Machamp flinches
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=115, touch=true}	emu.frameadvance() end
	for i=1,332+190 do	emu.frameadvance() end -- extra 190 in case of critical
	
	-- Purugly uses Return to KO Machamp
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,528 do	emu.frameadvance() end
	skip (55+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Infernape to battle Tyranitar
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,42 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=62, y=118, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,596 do	emu.frameadvance() end
	skip (1)
	for i=1,20 do	emu.frameadvance() end
	skip (1)
	for i=1,12 do	emu.frameadvance() end
	
	-- Infernape uses Close Combat to KO Tyranitar
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=51, touch=true}	emu.frameadvance() end
	for i=1,604 do	emu.frameadvance() end
	skip (159+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Empoleon to battle Pidgeot
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,42 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=78, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,666 do	emu.frameadvance() end
	skip (1)
	for i=1,42 do	emu.frameadvance() end
	
	-- Empoleon uses Ice Beam to KO Pidgeot
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=51, touch=true}	emu.frameadvance() end
	for i=1,544 do	emu.frameadvance() end
	skip (134+crit+level)
end
local function team6() -- Sableye, Pelipper, Linoone, Claydol, Manectric, Armaldo
	-- Total Time: 16624 Frames / 4:37.70
	for i=1,932 do	emu.frameadvance() end
	
	-- Linoone uses Shadow Claw to KO Exeggutor
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=51, touch=true}	emu.frameadvance() end
	for i=1,524 do	emu.frameadvance() end
	skip (74+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Torterra to battle Rhyperior
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,42 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=30, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,538 do	emu.frameadvance() end
	
	-- Sableye uses Psychic, causing just over 1/2 damage
	-- Machamp uses Fling or Rock Slide, causing up to 128 damage (critical)
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=115, touch=true}	emu.frameadvance() end
	savestate.save(1)
	for i=1,396 do	emu.frameadvance() end
	skip (64)
	for i=1,296 do	emu.frameadvance() end
	
	-- Sableye uses Psychic to KO Machamp
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=115, touch=true}	emu.frameadvance() end
	for i=1,244 do	emu.frameadvance() end
	skip (61+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Pelipper to battle Arcanine
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,42 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=62, y=70, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,558 do	emu.frameadvance() end
	
	-- Pelipper uses Surf to KO Rhyperior
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,618 do	emu.frameadvance() end
	skip (93+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Armaldo to battle Tyranitar
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,42 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=78, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,594 do	emu.frameadvance() end
	skip (1)
	for i=1,20 do	emu.frameadvance() end
	skip (1)
	for i=1,12 do	emu.frameadvance() end
	
	-- Armaldo uses X-Scissor to KO Tyranitar
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,598 do	emu.frameadvance() end
	skip (105+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Manectric to battle Pidgeot
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,42 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=62, y=118, touch=true}	emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,556 do	emu.frameadvance() end
	
	-- Manectric uses Thunderbolt to KO Pidgeot
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,548 do	emu.frameadvance() end
	skip (124+crit+level)
	for i=1,42 do	emu.frameadvance() end
	
	-- Send out Claydol to battle Arcanine
	for i=1,2 do	stylus.set{x=128, y=66, touch=true}	emu.frameadvance() end
	for i=1,42 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=190, y=126, touch=true}emu.frameadvance() end
	for i=1,8 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=126, y=74, touch=true}	emu.frameadvance() end
	for i=1,666 do	emu.frameadvance() end
	skip (1)
	for i=1,42 do	emu.frameadvance() end
	
	-- Claydol uses Earth Power to KO Arcanine
	for i=1,2 do	stylus.set{x=127, y=83, touch=true}	emu.frameadvance() end
	for i=1,10 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=63, y=51, touch=true}	emu.frameadvance() end
	for i=1,540 do	emu.frameadvance() end
	skip (118+crit+level)
end

local function team7() -- Furret, Electrode, Glalie, Bronzong, Cradily, Nidoking
end
local function team8() -- Swellow, Corsola, Parasect, Chimecho, Luxray, Muk
end

if (not bug) then	savestate.load(2)
	for i=1,2 do emu.frameadvance() end
	savestate.save(2)
else				savestate.load(1)
end

while true do -- loop that enters battle and returns to PokeCenter after battle.
	if (not bug) then
		if (pokecenter) then
			-- Get on your bike and ride to the Fighting Dojo
			for i=1,2 do	stylus.set{x=227, y=22, touch=true}	emu.frameadvance() end
			for i=1,6 do	emu.frameadvance() end
			for i=1,12 do	joypad.set(1, {down=1})		emu.frameadvance() end
			for i=1,38 do	joypad.set(1, {left=1})		emu.frameadvance() end
			for i=1,140 do	joypad.set(1, {up=1})		emu.frameadvance() end
			for i=1,140 do	joypad.set(1, {right=1})	emu.frameadvance() end
			for i=1,16 do	joypad.set(1, {up=1})		emu.frameadvance() end
		end
		for i=1,8 do	joypad.set(1, {up=1})		emu.frameadvance() end
		for i=1,120 do	emu.frameadvance() end
		
		-- Walk to and talk to Blue
		for i=1,56 do	joypad.set(1, {up=1})		emu.frameadvance() end
		for i=1,40 do	joypad.set(1, {right=1})	emu.frameadvance() end
		for i=1,20 do	joypad.set(1, {up=1})		emu.frameadvance() end
		for i=1,2 do	joypad.set(1, {A=1})		emu.frameadvance() end
		for i=1,46 do	emu.frameadvance() end
		for i=1,2 do	joypad.set(1, {A=1})		emu.frameadvance() end
	end
	
	if (team == 1) then
		team1()
	elseif (team == 2) then
		team2()
	elseif (team == 3) then
		team3()
	elseif (team == 4) then
		team4()
	elseif (team == 5) then
		team5()
	elseif (team == 6) then
		team6()
	else -- invalid team
		emu.pause()
	end
	
	-- Finish talking to Blue and exit the Fighting Dojo
	for i=1,130 do	emu.frameadvance() end
	for i=1,2 do	joypad.set(1, {A=1})		emu.frameadvance() end
	for i=1,18 do	emu.frameadvance() end
	for i=1,2 do	joypad.set(1, {A=1})		emu.frameadvance() end
	for i=1,108 do	emu.frameadvance() end
	for i=1,22 do	joypad.set(1, {down=1})		emu.frameadvance() end
	for i=1,40 do	joypad.set(1, {left=1})		emu.frameadvance() end
	for i=1,64 do	joypad.set(1, {down=1})		emu.frameadvance() end
	for i=1,94 do	emu.frameadvance() end
	
	if (pokecenter) then
		-- Get on your bike and ride to the PokeCenter
		for i=1,2 do	stylus.set{x=227, y=22, touch=true}	emu.frameadvance() end
		for i=1,6 do	emu.frameadvance() end
		for i=1,30 do	joypad.set(1, {down=1})		emu.frameadvance() end
		for i=1,140 do	joypad.set(1, {left=1})		emu.frameadvance() end
		for i=1,140 do	joypad.set(1, {down=1})		emu.frameadvance() end
		for i=1,32 do	joypad.set(1, {right=1})	emu.frameadvance() end
		for i=1,8 do	joypad.set(1, {up=1})		emu.frameadvance() end
		for i=1,124 do	emu.frameadvance() end
		
		-- Get your Pokemon healed and exit
		for i=1,50 do	joypad.set(1, {up=1})		emu.frameadvance() end
		for i=1,2 do	joypad.set(1, {A=1})		emu.frameadvance() end
		for i=1,46 do emu.frameadvance() end
		for i=1,2 do	joypad.set(1, {A=1})		emu.frameadvance() end
		for i=1,44 do emu.frameadvance() end
		for i=1,2 do	joypad.set(1, {A=1})		emu.frameadvance() end
		for i=1,64 do emu.frameadvance() end
		for i=1,2 do	joypad.set(1, {A=1})		emu.frameadvance() end
		for i=1,600 do emu.frameadvance() end
		for i=1,2 do	joypad.set(1, {A=1})		emu.frameadvance() end
		for i=1,42 do emu.frameadvance() end
		for i=1,2 do	joypad.set(1, {A=1})		emu.frameadvance() end
		for i=1,130 do emu.frameadvance() end
		for i=1,2 do	joypad.set(1, {A=1})		emu.frameadvance() end
		for i=1,32 do emu.frameadvance() end
		for i=1,60 do	joypad.set(1, {down=1})		emu.frameadvance() end
		for i=1,162 do	emu.frameadvance() end
	end
	
	-- Call Blue and schedule a rematch
	for i=1,2 do	stylus.set{x=45, y=157, touch=true}	emu.frameadvance() end
	for i=1,66 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=115, y=18, touch=true}	emu.frameadvance() end
	for i=1,2 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=177, y=89, touch=true}	emu.frameadvance() end
	for i=1,174 do	emu.frameadvance() end
	for i=1,2 do	joypad.set(1, {A=1})				emu.frameadvance() end
	for i=1,32 do	emu.frameadvance() end
	for i=1,2 do	joypad.set(1, {A=1})				emu.frameadvance() end
	for i=1,38 do	emu.frameadvance() end
	for i=1,2 do	joypad.set(1, {A=1})				emu.frameadvance() end
	for i=1,32 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=177, y=102, touch=true}emu.frameadvance() end
	for i=1,62 do	emu.frameadvance() end
	for i=1,2 do	joypad.set(1, {A=1})				emu.frameadvance() end
	for i=1,54 do	emu.frameadvance() end
	for i=1,2 do	joypad.set(1, {A=1})				emu.frameadvance() end
	for i=1,68 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=228, y=175, touch=true}emu.frameadvance() end
	for i=1,66 do	emu.frameadvance() end
	
	-- Save
	for i=1,2 do	stylus.set{x=125, y=76, touch=true}	emu.frameadvance() end
	for i=1,58 do	emu.frameadvance() end
	for i=1,2 do	stylus.set{x=231, y=95, touch=true}	emu.frameadvance() end
	for i=1,78 do	emu.frameadvance() end
	emu.pause()		-- Allow for confirmation before saving
	for i=1,2 do	stylus.set{x=231, y=95, touch=true}	emu.frameadvance() end
	for i=1,622 do	emu.frameadvance() end
	skip (1)
	--savestate.save(1)
	savestate.save(2)
end

