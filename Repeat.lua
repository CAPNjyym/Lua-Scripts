-- Start at beginning of month, centered over Leader's kingdom; all kingdoms except Leader's delegated

local loop = false
local kingdom = "Yaksha"
local party = 6
local kingdoms_delegated = 9
local delay2 = 244
	-- 1.1, 1.6, 2.2
	-- 180, 244, 216

local stylusX = -1
local stylusY = -1
local delay1 = 0

if (kingdom == "Fontaine") then		stylusX = -1	stylusY = -1
elseif (kingdom == "Greenleaf") then	stylusX = -1	stylusY = -1
elseif (kingdom == "Chrysalia") then	stylusX = -1	stylusY = -1
elseif (kingdom == "Pugilis") then		stylusX = 127	stylusY = 50
elseif (kingdom == "Terrera") then		stylusX = 127	stylusY = 124
elseif (kingdom == "Illusio") then		stylusX = -1	stylusY = -1
elseif (kingdom == "Cragspur") then		stylusX = -1	stylusY = -1
elseif (kingdom == "Yaksha") then		stylusX = 126	stylusY = 134
elseif (kingdom == "Viperia") then		stylusX = -1	stylusY = -1
elseif (kingdom == "Valora") then		stylusX = -1	stylusY = -1
elseif (kingdom == "Spectra") then		stylusX = 155	stylusY = 105
elseif (kingdom == "Nixtorm") then		stylusX = 238	stylusY = 124
elseif (kingdom == "Dragnor") then		stylusX = 230	stylusY = 121	end 
if (kingdoms_delegated == 0) then		delay1 = 0 -- 184
--elseif (kingdoms_delegated == 1) then	delay1 = 252
--elseif (kingdoms_delegated == 2) then	delay1 = 320
--elseif (kingdoms_delegated == 3) then	delay1 = 388
--elseif (kingdoms_delegated == 4) then	delay1 = 456
--elseif (kingdoms_delegated == 5) then	delay1 = 524
elseif (kingdoms_delegated == 6) then	delay1 = 628
elseif (kingdoms_delegated == 7) then	delay1 = 680
elseif (kingdoms_delegated == 8) then	delay1 = 746
elseif (kingdoms_delegated == 9) then	delay1 = 796
elseif (kingdoms_delegated == 10) then	delay1 = 880
--elseif (kingdoms_delegated == 11) then	delay1 = 932
--elseif (kingdoms_delegated == 12) then	delay1 = 1000
--elseif (kingdoms_delegated == 13) then	delay1 = 1068
elseif (kingdoms_delegated == 14) then	delay1 = 1156
elseif (kingdoms_delegated == 15) then	delay1 = 1248
else delay1 = 68 * kingdoms_delegated + 204
end

savestate.load(2)
for i=1,2 do emu.frameadvance() end
savestate.save(2)

once=true
while (loop or once) do
	for i=1,6 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,50 do emu.frameadvance() end
	
	for i=1,4 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,116 do emu.frameadvance() end
	
	for i=1,2 do stylus.set{x=stylusX, y=stylusY, touch=true} 
		emu.frameadvance()
	end
	for i=1,2 do emu.frameadvance() end
	
	for i=1,2 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,26 do emu.frameadvance() end
	
	for j=0,party do for i=1,2 do joypad.set(1, {A=1})
			emu.frameadvance()
		end
		for i=1,4 do emu.frameadvance() end
	end
	for i=1,78 do emu.frameadvance() end
	
	for i=1,2 do joypad.set(1, {B=1})
		emu.frameadvance()
	end
	for i=1,38 do emu.frameadvance() end
	
	for i=1,2 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,52 do emu.frameadvance() end
	
	for i=1,30 do joypad.set(1, {B=1})
		emu.frameadvance()
	end
	
	for i=1,82 do joypad.set(1, {B=1})
		emu.frameadvance()
	end
	for i=1,70 do emu.frameadvance() end
	
	for i=1,2 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,34 do emu.frameadvance() end
	
	for i=1,448 do joypad.set(1, {B=1})
		emu.frameadvance()
	end
	for i=1,8 do emu.frameadvance() end
	
	
	for i=1,2 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,delay1 do emu.frameadvance() end
	--[[
	for i=1,2 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
	for i=1,delay2 do emu.frameadvance() end
	]]
	once=false
	--emu.pause()
	savestate.save(1)
	for i=1,2 do joypad.set(1, {A=1})
		emu.frameadvance()
	end
end

-- for debugging
--for i=1,90 do emu.frameadvance() end
	
--	emu.pause()
	
