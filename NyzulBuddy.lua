_addon.name = 'Updatetest'
_addon.author = 'Darkdoom'
_addon.version = '0.0.1a'
_addon.command = 'update'
_addon.commands = {'start', 'stop', 'help'}
_addon.language = 'english'

res         = require 'resources'
packets     = require 'packets'
files       = require 'files'
texts       = require 'texts'
              require 'strings'
              require 'actions'
              require 'tables'
              require 'sets'
              require 'chat'
              require 'pack'
              require 'logger'
config		= require('config')



default_settings = {}
default_settings.pos = {}
default_settings.pos.x = 144
default_settings.pos.y = 144
default_settings.text = {}
default_settings.text.font = 'Segoe UI'
default_settings.text.size = 12
default_settings.text.alpha = 255
default_settings.text.red = 246
default_settings.text.green = 131
default_settings.text.blue = 188
default_settings.bg = {}
default_settings.bg.alpha = 175
default_settings.bg.red = 052
default_settings.bg.green = 109
default_settings.bg.blue = 166
settings = config.load('data\\settings.xml',default_settings)



text_box = texts.new(settings)

	running = false
	

	

function check_incoming_text(original)
	local org = original:lower()
	
	if org:find('sparks of eminence, and now possess a total of 99999') ~= nil then
		running = false
	elseif org:find('one or more party/alliance members do not have the required 200 unity accolades to join the fray') ~= nil then
		running = false
		end
end

function update()

    if running == true then
    ids    = {0x2D4, 0x2D5, 0x2D6, 0x2D7}
    L1 = 0x2D4
	L2 = 0x2D5 
	L3 = 0x2D6
	L4 = 0x2D7
  print("Building")
    
        local p = packets.new('outgoing', 0x016, {
            ['Target Index'] = L1
        })
		local p2 = packets.new('outgoing', 0x016, {
			['Target Index'] = L2
			})
		local p3 = packets.new('outgoing', 0x016, {
			['Target Index'] = L3
			})
		local p4 = packets.new('outgoing', 0x016, {
			['Target Index'] = L4
			})
  print("Injecting!")
  packets.inject(p)
  packets.inject(p2)
  packets.inject(p3)
  packets.inject(p4)
  print("Successful")
  coroutine.sleep(10)
  update()
end

end
  
    function unm_command(...)
	if #arg > 3 then
		windower.add_to_chat(167, 'Invalid command. //update help for valid options.')
	elseif #arg == 1 and arg[1]:lower() == 'start' then
		if running == false then
			running = true
			windower.add_to_chat(200, 'Update start')
			update()
		else
			windower.add_to_chat(200, 'UNM is already running.')
		end
	elseif #arg == 1 and arg[1]:lower() == 'stop' then
		if running == true then
			running = false
			windower.add_to_chat(200, 'UNM - STOP')
		else
			windower.add_to_chat(200, 'UNM is not running.')
		end
	elseif #arg == 1 and arg[1]:lower() == 'help' then
		windower.add_to_chat(200, 'Available Options:')
		windower.add_to_chat(200, '  //unm start - turns on UNM and starts trying to spawn')
		windower.add_to_chat(200, '  //unm stop - turns off UNM')
	
		windower.add_to_chat(200, '  //unm help - displays this text')
	end
end



windower.register_event('addon command', unm_command)
windower.register_event('incoming text', function(new, old)
	local info = windower.ffxi.get_info()
	if not info.logged_in then
		return
	else
		check_incoming_text(new)
	end
end)





windower.register_event("incoming chunk", function(id, data)
if id == 0x0E and mob_id == L1 then
			new_text = {}
        local index  = {}
        local packet     = packets.parse('incoming', data)
        local mob_status = packet["Status"]
        local mob_id = packet["NPC"]
		local mob_index  = packet["Index"]
		 mob = windower.ffxi.get_mob_by_id(mob_id)
		 distance = math.sqrt(mob.distance)
		--local mob3 = windower.ffxi.get_mob_by_id(mob_id)
		--local mob4 = windower.ffxi.get_mob_by_id(mob_id)
		--local name = "Lamp"
		 L1Index = 724
		
		--local L3Index = 726
		--local L4Index = 726
	--	if mob.name == "Runic Lamp" and mob_index == 724  then -- and mob_index == 724 then
	--	 new_text = mob.name .. ":  " .. (L1Index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms. \n" 
		--				 .. mob2.name .. ":  " .. (L2Index) .. " ] is now idle; Distance: " .. math.ceil(distance2) .. " yalms. \n" 
		--				 ..	mob3.name .. ":  " .. (L3Index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms. \n" 
			--			 ..	mob4.name .. ":  " .. (L4Index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms. \n" 
	--	windower.add_to_chat(179, mob.name .. ":  " .. (mob_index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms.")
	  --  windower.add_to_chat(mob.name .. ":  " .. (mob_index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms.")
				textDisplay()	 
	
	  
end
end)

	windower.register_event("incoming chunk", function(id, data)
if id == 0x0E and L2 then
			
        local index  = {}
        local packet     = packets.parse('incoming', data)
        local mob_status = packet["Status"]
        local mob_id = packet["NPC"]
		local mob_index  = packet["Index"]
		 mob2 = windower.ffxi.get_mob_by_id(mob_id)
		 distance2 = math.sqrt(mob2.distance)
	--local mob3 = windower.ffxi.get_mob_by_id(mob_id)
	--	local mob4 = windower.ffxi.get_mob_by_id(mob_id)
		--local name = "Lamp"
	
		 L2Index = 725
	--	local L3Index = 726
		--local L4Index = 726
	--	if mob.name == "Runic Lamp" and mob_index == 725  then -- and mob_index == 724 then
	--	 new_text = mob.name .. ":  " .. (L1Index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms. \n" 
		--				 .. mob2.name .. ":  " .. (L2Index) .. " ] is now idle; Distance: " .. math.ceil(distance2) .. " yalms. \n" 
		--				 ..	mob3.name .. ":  " .. (L3Index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms. \n" 
		--				 ..	mob4.name .. ":  " .. (L4Index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms. \n" 
	--	windower.add_to_chat(179, mob.name .. ":  " .. (mob_index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms.")
	  --  windower.add_to_chat(mob.name .. ":  " .. (mob_index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms.")
				textDisplay()		 
	
	  
end
end)
   
 
 	windower.register_event("incoming chunk", function(id, data)
if id == 0x0E and  L3 then
			
        local index  = {}
        local packet     = packets.parse('incoming', data)
        local mob_status = packet["Status"]
        local mob_id = packet["NPC"]
		local mob_index  = packet["Index"]
		 mob3 = windower.ffxi.get_mob_by_id(mob_id)
		 distance3 = math.sqrt(mob3.distance)
	--local mob3 = windower.ffxi.get_mob_by_id(mob_id)
	--	local mob4 = windower.ffxi.get_mob_by_id(mob_id)
		--local name = "Lamp"
	
		-- L2Index = 725
		 L3Index = 726
		--local L4Index = 726
		--if mob.name == "Runic Lamp" and mob_index == 726  then -- and mob_index == 724 then
		-- new_text = mob.name .. ":  " .. (L1Index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms. \n" 
		--				 .. mob2.name .. ":  " .. (L2Index) .. " ] is now idle; Distance: " .. math.ceil(distance2) .. " yalms. \n" 
			--			 ..	mob3.name .. ":  " .. (L3Index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms. \n" 
			--			 ..	mob4.name .. ":  " .. (L4Index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms. \n" 
	--	windower.add_to_chat(179, mob.name .. ":  " .. (mob_index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms.")
	  --  windower.add_to_chat(mob.name .. ":  " .. (mob_index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms.")
					textDisplay()	 
	
	  
end
end)

 	windower.register_event("incoming chunk", function(id, data)
if id == 0x0E and L4 then
			
        local index  = {}
        local packet     = packets.parse('incoming', data)
        local mob_status = packet["Status"]
        local mob_id = packet["NPC"]
		local mob_index  = packet["Index"]
		 mob4 = windower.ffxi.get_mob_by_id(mob_id)
		 distance4 = math.sqrt(mob4.distance)
	--local mob3 = windower.ffxi.get_mob_by_id(mob_id)
	--	local mob4 = windower.ffxi.get_mob_by_id(mob_id)
		--local name = "Lamp"
	
		-- L2Index = 725
		 L4Index = 727
		--local L4Index = 726
		--if mob.name == "Runic Lamp" and mob_index == 726  then -- and mob_index == 724 then
		-- new_text = mob.name .. ":  " .. (L1Index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms. \n" 
		--				 .. mob2.name .. ":  " .. (L2Index) .. " ] is now idle; Distance: " .. math.ceil(distance2) .. " yalms. \n" 
			--			 ..	mob3.name .. ":  " .. (L3Index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms. \n" 
			--			 ..	mob4.name .. ":  " .. (L4Index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms. \n" 
	--	windower.add_to_chat(179, mob.name .. ":  " .. (mob_index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms.")
	  --  windower.add_to_chat(mob.name .. ":  " .. (mob_index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms.")
					 textDisplay()	
	
	  
end
end)

	function textDisplay()
	 if mob.name == "Runic Lamp" then

						 new_text = mob.name .. ":  " .. (L1Index) .. " ] is now idle; Distance: " .. math.ceil(distance) .. " yalms. \n" 
						 .. mob2.name .. ":  " .. (L2Index) .. " ] is now idle; Distance: " .. math.ceil(distance2) .. " yalms. \n" 
						 ..	mob3.name .. ":  " .. (L3Index) .. " ] is now idle; Distance: " .. math.ceil(distance3) .. " yalms. \n" 
						 ..	mob4.name .. ":  " .. (L4Index) .. " ] is now idle; Distance: " .. math.ceil(distance4) .. " yalms. \n" 

				 text_box:text(new_text)
				text_box:visible(true)
				end
				end

while(running == true) 
do
  update()
  end

  
