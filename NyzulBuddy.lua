_addon.name = 'NyzulBuddy'
_addon.author = 'Darkdoom'
_addon.version = '1.9.25.2019a'
_addon.command = 'nb'
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

-- create default settings file for textbox

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

--lamps table

lamps = {}
lamps[724] = {}
lamps[725] = {}
lamps[726] = {}
lamps[727] = {}
lamps[728] = {} --728 and 729 are currently unused until I can acquire 5th lamp ID/Index.
lamps[729] = {}
lamps[730] = {}
lamps[215] = {}

		


text_box = texts.new(settings)

	running = true
	

	
	--just ignore this
function check_incoming_text(original)
	local org = original:lower()
	
	if org:find('sparks of eminence, and now possess a total of 99999') ~= nil then
		running = false
	elseif org:find('one or more party/alliance members do not have the required 200 unity accolades to join the fray') ~= nil then
		running = false
		end
end

--Run packet injection/force update from server on NPC

function update()

    if running == true then
    ids    = {0x2D4, 0x2D5, 0x2D6, 0x2D7, 0x2D8, 0x2D9, 0x2D2, 0x2D3, 0x150}
    L1 = 0x2D4
	L2 = 0x2D5 
	L3 = 0x2D6
	L4 = 0x2D7
	L5 = 0x2D8
	T1 = 0x2D2
	T2 = 0x2D3
	M1 = 0x10F

    
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
		local p5 = packets.new('outgoing', 0x016, {
			['Target Index'] = L5
			})
		local p6 = packets.new('outgoing', 0x016, {
			['Target Index'] = T1
			})
		local p7 = packets.new('outgoing', 0x016, {
			['Target Index'] = T2
			})
	--	local p8 = packets.new('outgoing', 0x016, {
	--		['Target Index'] = M1
	--		})

  packets.inject(p)
  packets.inject(p2)
  packets.inject(p3)
  packets.inject(p4)
  packets.inject(p5)
  packets.inject(p6)
  packets.inject(p7)
 -- packets.inject(p8)
  coroutine.sleep(5)
  update()
  
end

end
  
  --Handles commands

    function nb_command(...)
	if #arg > 3 then
		windower.add_to_chat(167, 'Invalid command. //nb help for valid options.')
	elseif #arg == 1 and arg[1]:lower() == 'start' then
		if running == false then
			running = true
			windower.add_to_chat(200, 'NyzulBuddy starting')
			update()
		else
			windower.add_to_chat(200, 'NyzulBuddy is already running.')
		end
	elseif #arg == 1 and arg[1]:lower() == 'stop' then
		if running == true then
			running = false
			windower.add_to_chat(200, 'NyzulBuddy stopping')
		else
			windower.add_to_chat(200, 'NyzulBuddy is not running.')
		end
	elseif #arg == 1 and arg[1]:lower() == 'help' then
		windower.add_to_chat(200, 'Available Options:')
		windower.add_to_chat(200, '  //nb start - turns on NyzulBuddy and starts sending lamp packets')
		windower.add_to_chat(200, '  //nb stop - turns off NyzulBuddy')
	
		windower.add_to_chat(200, '  //nb help - displays this text')
	end
end



windower.register_event('addon command', nb_command)
windower.register_event('incoming text', function(new, old)
	local info = windower.ffxi.get_info()
	if not info.logged_in then
		return
	else
		check_incoming_text(new)
	end
end)



--Register and parse incoming 0x0E for relevant data

windower.register_event("incoming chunk", function(id, data)
if id == 0x0E  then
			  new_text = {}
        local index  = {}
        local packet     = packets.parse('incoming', data)
        local mob_status = packet["Status"]
        local mob_id = packet["NPC"]
		local mob_index  = packet["Index"]
			  mob = windower.ffxi.get_mob_by_id(mob_id)

		
	     L1Index = 724
		 L2Index = 725
		 L3Index = 726
		 L4Index = 727
		 L5Index = 728
		 L6Index = 729
		 T1Index = 722
		 T2Index = 723
	--	 M1Index = 271

			if mob_index == 724 then
			mob = windower.ffxi.get_mob_by_id(mob_id)
			lamps[724] = mob
			
			elseif mob_index == 725 then
			mob = windower.ffxi.get_mob_by_index(mob_index)
			lamps[725] = mob
			
			elseif mob_index == 726 then
			mob = windower.ffxi.get_mob_by_index(mob_index)
			lamps[726] = mob 
			
			elseif mob_index == 727 then
			mob = windower.ffxi.get_mob_by_index(mob_index)
			lamps[727] = mob

			elseif mob_index == 728 then
			mob = windower.ffxi.get_mob_by_id(mob_id)
			lamps[728] = mob

			elseif mob_index == 722 then
			mob = windower.ffxi.get_mob_by_index(mob_index)
			lamps[729] = mob
			
			elseif mob_index == 723 then
			mob = windower.ffxi.get_mob_by_index(mob_index)
			lamps[730] = mob

	--		elseif mob_index == 271 then
	---		mob = windower.ffxi.get_mob_by_index(mob_index)
	--		lamps[215] = mob
					 
		-- text_box:text(new_text)
		-- text_box:visible(true)
		 end
	
	
	  
	  
end
end)



	
	function newText()

		if lamps ~= nil then
		coroutine.sleep(1)
		
		distance = math.sqrt(lamps[724].distance)
		distance2 = math.sqrt(lamps[725].distance)
		distance3 = math.sqrt(lamps[726].distance)
		distance4 = math.sqrt(lamps[727].distance)
		distance5 = math.sqrt(lamps[728].distance)
		distance6 = math.sqrt(lamps[729].distance)
		distance7 = math.sqrt(lamps[730].distance)
	--	distance8 = math.sqrt(lamps[215].distance)
		
			
		
			new_text =
			   lamps[724].name .. " ID: [" .. (L1Index) .. "] exists; Distance: " .. math.ceil(distance) .. " yalms. \n" 
		    .. lamps[725].name .. " ID:  [" .. (L2Index) .. "] exists; Distance: " .. math.ceil(distance2) .. " yalms. \n" 
			.. lamps[726].name .. " ID:  [" .. (L3Index) .. "] exists; Distance: " .. math.ceil(distance3) .. " yalms. \n" 
		    .. lamps[727].name .. " ID:  [" .. (L4Index) .. "] exists; Distance: " .. math.ceil(distance4) .. " yalms. \n" 
			.. lamps[728].name .. " ID:  [" .. (L5Index) .. "] exists; Distance: " .. math.ceil(distance5) .. " yalms. \n" 		
			.. lamps[729].name .. " *EVEN FLOOR* ID:  [" .. (T1Index) .. "] exists; Distance: " .. math.ceil(distance6) .. " yalms. \n" 		
			.. lamps[730].name .. " *ODD FLOOR* ID:  [" .. (T2Index) .. "] exists; Distance: " .. math.ceil(distance7) .. " yalms. \n" 	
		--	.. lamps[215].name .. " *ODD FLOOR* ID:  [" .. (M1Index) .. "] exists; Distance: " .. math.ceil(distance8) .. " yalms. \n" 	
			text_box:text(new_text)
			text_box:visible(true)
	end
   end

 windower.register_event('prerender', function()
		if running == true then
		newText()
        end
    end)


while(running == true) 
do
  update()
  end

  while(running == true)
  do 
  newText()
  end
  
