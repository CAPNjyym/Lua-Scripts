local rarehunt=true
local overworld=true
local dash=true
local hermes=false
local left=true

local battle = 0x7e3a8f
local win = 0x7e626a
local atb = {0x7e2022, 0x7e2023, 0x7e2024, 0x7e2025}
local turn = 0x7e0201
local rnjesus = 0x7e00be
local item = 0x7e196a

-- local veldtpack = 0x7e1fa5
local complete = {false, false, false, false}
local rn = 0
local steps = 8
local wait = 232
local shoes = 0
local party = {9, 10, 2, 13} -- indeces for each party member
	-- Tina = 1, Lock = 2, Cayene = 3, Shadow = 4, Edgar = 5, Mash = 6, Celes = 7
	-- Strago = 8, Relm = 9, Setzer = 10, Mog = 11, Gau = 12, Gogo = 13, Umaro = 14
local hp = {0x7e1609, 0x7e162e, 0x7e1653, 0x7e1678, 0x7e169d, 0x7e16c2, 0x7e16e7,
	0x7e170c, 0x7e1731, 0x7e1756, 0x7e177b, 0x7e17a0, 0x7e17c5, 0x7e17ea}
local battleHP = {0x7e2e78, 0x7e2e7a, 0x7e2e7c, 0x7e2e7e}
local state = savestate.create(1)


local function steal(char) -- waits until right time [if rarehunt], then steals
	if (char == "Lock") then
		actionwait = 10 + shoes
	elseif (char == "Gogo") then
		actionwait = 27 + math.floor(1.5*shoes)
	end
	
	emu.frameadvance()
	emu.frameadvance()
	
	-- wait until the item I want is about to appear...
	rn = memory.readbyte(rnjesus) + actionwait
	
	if (rn > 255) then
		rn = rn - 255
	end
	
	while (rarehunt and rn ~= 130 and rn ~= 162 and rn ~= 193 and memory.readbyte(win) ~= 1) do
	-- There are many more numbers, but these have room for error
		emu.frameadvance()
		
		if (memory.readbyte(0x7e2f41) < 1) then -- fell out of Steal menu
			joypad.set(1, {A=1})
			emu.frameadvance()
			emu.frameadvance()
		end
		
		rn = memory.readbyte(rnjesus) + actionwait
		
		if (rn > 255) then
			rn = rn - 255
		end
	end
	
	-- and then press A to steal
	joypad.set(1, {A=1})
	for i=1,16 do emu.frameadvance() end
end
local function slots(outcome) -- stops slots at right time based on outcome desired
	slot1 = 220
	slot2 = 20
	slot3 = 20
	slotwait = -1
	
	-- use the index for the thing you want (7 = 0, counting up)
	if (outcome == "Seven Flush") then
		slot1 = 4
		slot2 = 1
		slot3 = 2
	elseif (outcome == "Chocobo Rush") then
		-- set slot nums
	elseif (outcome == "Diving Bomb") then -- check for proper Rig number?
		-- set slot nums
	elseif (outcome == "Megaflare") then -- check for proper Rig number?
		-- set slot nums
	elseif (outcome == "Esper") then -- check for proper Rig number?
		-- set slot nums
		slotwait = 79 -- used to manipulate which esper to get
		-- 9, 30, 59, 79, 111, 113, 133, 163, 215, 223 = Metamorph
	elseif (outcome == "Joker Death") then -- check for proper Rig number?
		slot1 = 0
		slot2 = 16
		slot3 = 16
	elseif (outcome == "Mysidian Rabbit") then
		slot1 = 3
		slot2 = 3
		slot3 = 6
	else
		return
	end
	
	slot1 = 276 - (16 * slot1)
	if (slot1 > 255) then
		slot1 = slot1 - 256
	end
	slot2 = 4 * slot2
	slot3 = 4 * slot3
	
	for i=1,25 do emu.frameadvance() end
	while (memory.readbyte(0x7e7b5c) ~= slot1 and memory.readbyte(win) ~= 1) do
		emu.frameadvance()
	end
	
	joypad.set(1, {A=1})
	for i=1,slot2 do emu.frameadvance() end
	joypad.set(1, {A=1})
	for i=1,slot3 do emu.frameadvance() end
	joypad.set(1, {A=1})
	
	for i=1,24 do emu.frameadvance() end
	if (slotwait >= 0) then
		while (slotwait ~= memory.readbyte(rnjesus)) do
			emu.frameadvance()
		end
	end
	joypad.set(1, {A=1})
	
end
local function defend() -- if you have nothing better to do....
	joypad.set(1, {right=1})
	for i=1,24 do emu.frameadvance() end
	joypad.set(1, {A=1})
	for i=1,35 do emu.frameadvance() end
end


--[[ Item Finder
local el = 0x7e2698
local tk = 0x7e26f2	
local item = ""
local rn2 = 0
savestate.save(state)
local ouf = assert(io.open("table.txt", "w"))
ouf:write("RN	RN2	Item")
for i=0,256 do
	rn = memory.readbyte(rnjesus)
	joypad.set(1, {A=1})
	for i=1,140 do emu.frameadvance() end -- Stealing
	-- for i=1,330 do emu.frameadvance() end -- Killing
	
	rn2 = memory.readbyte(rnjesus)
	for i=1,41 do emu.frameadvance() end
	
	-- Stealing
	joypad.set(1, {Y=1})
	for i=1,24 do emu.frameadvance() end
	
	-- Killing
	-- for i=1,7 do
	--	joypad.set(1, {A=1})
	--	for j=1,25 do emu.frameadvance() end
	-- end
	
	if (memory.readbyte(el) == 25) then
		item = "0"
	elseif (memory.readbyte(el) == 26) then
		item = "1"
	else
		item = "2"
	end
	
	ouf:write("\n")
	ouf:write(string.format("%d	%d	%s", rn, rn2, item))
	
	savestate.load(state)
	emu.frameadvance()
	savestate.save(state)
end
io.close(ouf)
emu.pause()]]


if (overworld or not dash) then
	steps=16
end
if (not hermes) then
	wait = 235
	shoes = shoes + 6
end

savestate.load(state)
--for i=1,5 do emu.frameadvance() end
--savestate.save(state)

while (memory.readbyte(item) < 98) do
	while (memory.readbyte(battle) ~= 1) do -- not in battle
		--[[ roam
		if (left) then
			left = false
			for i=1,steps do
				joypad.set(1, {left=1})
				emu.frameadvance()
			end
		else
			left = true
			for i=1,steps do
				joypad.set(1, {right=1})
				emu.frameadvance()
			end
		end]]
		
		-- Rapidly press A; useful for things such as the Colosseum
		for i=1,3 do joypad.set(1, {A=1}) emu.frameadvance() end
		for i=1,3 do emu.frameadvance() end
	end
	
	if (overworld or not dash) then
		left = not left
	end
	
	for i=1,186 do emu.frameadvance() end -- character animation, waiting on menus
	
	-- battle script
	while (memory.readbyte(battle) == 1) do
		-- temp steal script
		
		-- HP Check
		for i=1,1 do
			if (memory.readword(battleHP[i]) == 0) then
				savestate.load(state)
				for i=1,4 do emu.frameadvance() end
			end
			complete[i] = false
			emu.frameadvance()
		end
		
		if (memory.readbyte(win) == 1) then -- battle won, skip through messages
			joypad.set(1, {A=1})
			emu.frameadvance()
		
		--[[ if desired, after each character has completed their action, then run
		elseif (complete[1] and complete[2] and complete[3] and complete[4]) then
			joypad.set(1, {L=1})
			joypad.set(1, {R=1})
			emu.frameadvance()]]
		
		--[[ just in case game goes really screwy
		elseif (memory.readbyte(turn) > 3 or 
			memory.readbyte(atb[memory.readbyte(turn)+1]) < 255) then
			emu.frameadvance()
		else
			for i=1,59 do emu.frameadvance() end -- wait for action menu
			
			if (memory.readbyte(turn) == 0) then -- Relm's turn: heal someone
				if (not complete[1]) then
					joypad.set(1, {A=1})
					emu.frameadvance()
					joypad.set(1, {right=1})
					emu.frameadvance()
					emu.frameadvance()
					joypad.set(1, {right=1})
					emu.frameadvance()
					emu.frameadvance()
					joypad.set(1, {right=1})
					emu.frameadvance()
					
					-- Find party member with lowest HP
					lowest = 0
					HP = memory.readword(battleHP[1])
					for i=2,4 do
						if (memory.readword(battleHP[i]) < HP) then
							lowest = i - 1
							HP = memory.readword(battleHP[i])
						end
					end
					
					-- Target party member with lowest HP
					if (lowest == 3) then
						joypad.set(1, {up=1})
					elseif (lowest == 2) then
						joypad.set(1, {down=1})
						emu.frameadvance()
						emu.frameadvance()
						joypad.set(1, {down=1})
					elseif (lowest == 1) then
						joypad.set(1, {down=1})
					end
					emu.frameadvance()
					
					joypad.set(1, {A=1})
				end
				
				while (memory.readbyte(turn) == 0 and memory.readbyte(atb[1]) == 255 and memory.readbyte(win) ~= 1) do
					emu.frameadvance()
				end
				
			elseif (memory.readbyte(turn) == 1) then -- Setzer's turn: slots
				if (complete[2] and complete[3]) then -- attack
					joypad.set(1, {A=1})
					emu.frameadvance()
					emu.frameadvance()
					slots("Seven Flush")
					complete[1] = true
				else
					defend()
				end
				
				while (memory.readbyte(turn) == 1 and memory.readbyte(atb[2]) == 255 and memory.readbyte(win) ~= 1) do
					emu.frameadvance()
				end
				
			elseif (memory.readbyte(turn) == 2) then -- Lock's turn: Steal
				joypad.set(1, {A=1})
				emu.frameadvance()
				emu.frameadvance()
				if (not complete[2]) then
					joypad.set(1, {left=1})
					emu.frameadvance()
					emu.frameadvance()
				else
					joypad.set(1, {right=1})
					emu.frameadvance()
					emu.frameadvance()
					joypad.set(1, {up=1})
					emu.frameadvance()
					emu.frameadvance()
				end
				
				steal("Lock")
				
				while (memory.readbyte(turn) == 2 and memory.readbyte(atb[3]) == 255 and memory.readbyte(win) ~= 1) do
					emu.frameadvance()
				end
				complete[2] = true
				
			elseif (memory.readbyte(turn) == 3) then -- Gogo's turn: Steal
				joypad.set(1, {A=1})
				emu.frameadvance()
				emu.frameadvance()
				if (not complete[3]) then
					joypad.set(1, {right=1})
					emu.frameadvance()
					emu.frameadvance()
					joypad.set(1, {down=1})
					emu.frameadvance()
					emu.frameadvance()
				else
					joypad.set(1, {left=1})
					emu.frameadvance()
					emu.frameadvance()
				end
				
				steal("Gogo")
				
				while (memory.readbyte(turn) == 3 and memory.readbyte(atb[4]) == 255 and memory.readbyte(win) ~= 1) do
					emu.frameadvance()
				end
				complete[3] = true
				
				complete[0] = true
			end]]
		end
	end
	
	-- post-battle checks
	for i=1,62 do emu.frameadvance() end
	--[[if (overworld) then
		for i=1,17 do emu.frameadvance() end
	end
	
	if (not left) then
		left = true
		for i=1,steps do
			joypad.set(1, {right=1})
			emu.frameadvance()
		end
	end
	]]
	for i=1,4 do
		if (memory.readword(hp[party[i]]) == 0) then
			savestate.load(state)
			for i=1,4 do emu.frameadvance() end
		end
		complete[i] = false
	end
	
	savestate.save(state)
end
emu.pause()

