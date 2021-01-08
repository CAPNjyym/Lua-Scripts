-- Tells you what fish will catch next

local advance=false
local fish_add=0x02185F38
local fish_2_add=0x02186010
local mast_add=0x02185F80
local mast_2_add=0x02186058

local fish = {	"Fish Bones",		"Old Boot",				"Old Ball",
				"Fish Fossil",		"Legendary Treasure",	"Letter in a Bottle",
				"Sweetfish",		"Small Sweetfish",		"Large Sweetfish",
				"Char",				"Small Char",			"Large Char",
				"Eel",				"Small Eel",			"Large Eel",
				"Carp",				"Small Carp",
				"Salmon",			"Small Salmon",			"Special Salmon",
				"Shishamo",			"Small Shishamo",		"Special Shishamo",
				"Icefish",			"Small Icefish",		"Large Icefish",
				"Sea Bass",			"Small Sea Bass",		"Large Sea Bass",
				"Loach",			"Small Loach",			"Large Loach",
				"Goby",				"Small Goby",			"Large Goby",
				"Funa",				"Small Funa",			"Large Funa",
				"Black Bass",		"Small Black Bass",		"Large Black Bass",
				"Bluegill",			"Small Bluegill",		"Large Bluegill",
				"Trout",			"Small Trout",			"Large Trout",
				"Killifish",		"Small Killifish",		"Large Killifish",
				"Masu Salmon",		"Small Masu Salmon",	"Large Masu Salmon",
				"Blotch Snakehead",	"Small Snakehead",		"Large Snakehead",
				"Smelt",			"Small Smelt",			"Large Smelt",
				"Blue Crab",	"Crab",		"Small Crab",	"Small Blue Crab",
				"Bonito",	"Tuna",		"Ocean Sunfish",	"Dogfish Shark",
				"Moray Eel",	"Mackerel",		"Flounder",	"Giant Huchen",
				"Giant Salamander",	"Dragon Carp",	"Giant Catfish",	"Snapping Turtle",
				"Dummy 98", "Dummy 99", "Dummy 100", "Dummy 101", "Dummy 102",
				"Spring Sun", "Summer Sun", "Fall Sun", "Winter Sun",
				"Red Wonderful", "Orange Wonderful", "Yellow Wonderful",
				"Green Wonderful", "Blue Wonderful", "Purple Wonderful"
}

if advance then
	savestate.load(1)
	emu.frameadvance()
	savestate.save(1)
	emu.frameadvance()
	joypad.set(1, {A=1})
	--joypad.set(1, {right=1})
end

while true do
	fish_num=256*memory.readbyte(fish_add+1) + memory.readbyte(fish_add) - 706
	fish_size=256*memory.readbyte(fish_add+3) + memory.readbyte(fish_add+2)
	mast_num=256*memory.readbyte(mast_add+1) + memory.readbyte(mast_add) - 706
	mast_size=256*memory.readbyte(mast_add+3) + memory.readbyte(mast_add+2)
	fish_num2=256*memory.readbyte(fish_2_add+1) + memory.readbyte(fish_2_add) - 706
	fish_size2=256*memory.readbyte(fish_2_add+3) + memory.readbyte(fish_2_add+2)
	mast_num2=256*memory.readbyte(mast_2_add+1) + memory.readbyte(mast_2_add) - 706
	mast_size2=256*memory.readbyte(mast_2_add+3) + memory.readbyte(mast_2_add+2)
	
	if (fish_num > 0) then
		fish_text = "Fishing Rod - " .. fish[fish_num]
		mast_text = " Master Rod - " .. fish[mast_num]
		fish_2_text = "Fishing Rod - " .. fish[fish_num2]
		mast_2_text = " Master Rod - " .. fish[mast_num2]
		
		if (fish_num > 6 and fish_num < 76) then
			fish_text = fish_text .. ":  " .. fish_size .. " cm"
		end
		if (mast_num > 6 and mast_num < 76) then
			mast_text = mast_text .. ":  " .. mast_size .. " cm"
		end
		if (fish_num2 > 6 and fish_num2 < 76) then
			fish_2_text = fish_2_text .. ":  " .. fish_size2 .. " cm"
		end
		if (mast_num2 > 6 and mast_num2 < 76) then
			mast_2_text = mast_2_text .. ":  " .. mast_size2 .. " cm"
		end
		
		gui.text(0,61,fish_text)
		gui.text(0,71,mast_text)
		gui.text(0,91,"Konohana-Mid-Stream ONLY:")
		gui.text(0,101,fish_2_text)
		gui.text(0,111,mast_2_text)
	end
	
	emu.frameadvance()
end
