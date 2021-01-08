local task=0

local pokemon=3
local skips=4
local guardian_charm=false
local enemy_stats_change=false
local ally_stats_change=false

savestate.load(1)
for i=1,2*skips do emu.frameadvance() end
if (skips > 0) then savestate.save(1) end

if (task == 0) then
	--for i=1,6 do emu.frameadvance() end
	for i=1,1 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	
	for i=1,346 do emu.frameadvance() end
	
	for i=1,2 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,30 do emu.frameadvance() end
	
	for i=1,2 do joypad.set(1, {B=1})
		emu.frameadvance()
	end
	for i=1,126 do emu.frameadvance() end
	
	for i=1,2 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,48 do emu.frameadvance() end
	
	if (enemy_stats_change) then for i=1,222 do emu.frameadvance() end end
	
	for i=1,2 do joypad.set(1, {B=1})
		emu.frameadvance()
	end
	for i=1,2 do emu.frameadvance() end
	
	if (guardian_charm) then
		for i=1,2 do joypad.set(1, {A=1})
			emu.frameadvance()
		end
		for i=1,192 do emu.frameadvance() end
	end
	
	for i=1,2 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,28 do emu.frameadvance() end
	
	if (ally_stats_change) then for i=1,214 do emu.frameadvance() end end
	
	for i=1,2 do joypad.set(1, {start=1})
		emu.frameadvance()
	end
	for i=1,38 do emu.frameadvance() end
	
	for i=1,2 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,100 do emu.frameadvance() end
	
	for i=1,2 do joypad.set(1, {select=1})
		emu.frameadvance()
	end
	for i=1,64 do emu.frameadvance() end
	
	if (pokemon ~= 1) then
		for i=1,2 do stylus.set{x=39.5, y=27*pokemon-14, touch=true} 
			emu.frameadvance()
		end
		for i=1,14 do emu.frameadvance() end
	end
	
	for i=1,16 do emu.frameadvance() end
	
	emu.pause()
	-- gui.text(127,39,memory.readbyte(0x0227CBBE + 0xA*pokemon))
	-- emu.frameadvance()
end
if (task == 1) then
local kingdom = "Nixtorm"
local other = false
local merchant = false

local loc = {-1, -1}
local loc2 = {-1, -1}

if (kingdom == "Aurora") then			loc = {25, 53}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Ignis") then		loc = {27, 47}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Fontaine") then		loc = {29, 59}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Greenleaf") then	loc = {18, 53}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Violight") then		loc = {15, 39}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Chrysalia") then	loc = {22, 32}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Pugilis") then		loc = {-1, -1}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Terrera") then		loc = {39, 41}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Illusio") then		loc = {36, 31}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Cragspur") then		loc = {-1, -1}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Yaksha") then		loc = {-1, -1}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Viperia") then		loc = {58, 39}
	if (other) then						loc2 = {111, 107}	end
elseif (kingdom == "Avia") then			loc = {-1, -1}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Valora") then		loc = {-1, -1}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Spectra") then		loc = {-1, -1}
	if (other) then						loc2 = {-1, -1}		end
elseif (kingdom == "Nixtorm") then		loc = {41, 13}
	if (other) then						loc2 = {149, 145}	end
elseif (kingdom == "Dragnor") then		loc = {-1, -1}
	if (other) then						loc2 = {-1, -1}		end
end

if (loc[1] >= 0) then
	for i=1,1 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,400 do emu.frameadvance() end
	
	if (merchant) then
		for i=1,34 do emu.frameadvance() end
		
		for i=1,2 do joypad.set(1, {B=1})
			emu.frameadvance()
		end
		for i=1,2 do emu.frameadvance() end
		
		for i=1,2 do joypad.set(1, {A=1})
			emu.frameadvance()
		end
		for i=1,66 do emu.frameadvance() end
		
		for i=1,2 do joypad.set(1, {B=1})
			emu.frameadvance()
		end
		for i=1,24 do emu.frameadvance() end
		
		for i=1,2 do joypad.set(1, {up=1})
			emu.frameadvance()
		end
		for i=1,2 do emu.frameadvance() end
		
		for i=1,2 do joypad.set(1, {A=1})
			emu.frameadvance()
		end
		for i=1,12 do emu.frameadvance() end
		
		for i=1,2 do joypad.set(1, {B=1})
			emu.frameadvance()
		end
		for i=1,2 do emu.frameadvance() end
		
		for i=1,2 do joypad.set(1, {A=1})
			emu.frameadvance()
		end
		for i=1,216 do emu.frameadvance() end
	end
	
	for i=1,4 do stylus.set{x=loc[1], y=loc[2], touch=true}
		emu.frameadvance()
	end
	for i=1,2 do emu.frameadvance() end
	
	for i=1,6 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,50 do emu.frameadvance() end
	
	for i=1,4 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,116 do emu.frameadvance() end
	
	if (loc2[1] >= 0) then
		for i=1,2 do stylus.set{x=loc2[1], y=loc2[2], touch=true} 
			emu.frameadvance()
		end
		for i=1,40 do emu.frameadvance() end
	end
end

emu.pause()
end
if (task == 2) then
	for i=1,1 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,40 do emu.frameadvance() end
	
--[[	while (memory.readbyte(0x0227EC5C) == 97 or 
			memory.readbyte(0x0227EC5D) == 194 or
			-- 164 = no 2nd warrior
			--memory.readbyte(0x0227EC5E) == 72 or
			-- 72/11 = 2 warrior, 2 pokemon
			-- 73/11 = 0 warrior, 2 pokemon / 1 warrior, 1 pokemon / 1 warrior, 2 pokemon
			memory.readbyte(0x0227EC61) ~= 92 or
			memory.readbyte(0x0227EC62) ~= 200) do
		savestate.load(1)
		for i=1,2*skips do emu.frameadvance() end
		if (skips > 0) then savestate.save(1) end
		
		for i=1,3 do joypad.set(1, {A=1})
			emu.frameadvance()
		end
		for i=1,20 do emu.frameadvance() end
	end]]
	
	for i=1,101 do emu.frameadvance() end
	for i=1,400 do emu.frameadvance() end
	
	for i=1,2 do joypad.set(1, {Y=1})
		emu.frameadvance()
	end
	for i=1,72 do emu.frameadvance() end
	
	for i=1,2 do joypad.set(1, {select=1})
		emu.frameadvance()
	end
	for i=1,20 do emu.frameadvance() end
	
	for i=1,2 do joypad.set(1, {select=1})
		emu.frameadvance()
	end
	for i=1,20 do emu.frameadvance() end
	
	for i=1,2 do joypad.set(1, {select=1})
		emu.frameadvance()
	end
	for i=1,26 do emu.frameadvance() end
	
	emu.pause()
	
	for i=1,2 do joypad.set(1, {up=1})
		emu.frameadvance()
	end
	for i=1,26 do emu.frameadvance() end
	
	emu.pause()
end

