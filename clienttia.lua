Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local id = GetPlayerServerId(PlayerId())

emsonline = 0
policeonline = 0
taxionline = 0
mechaniconline = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		ESX.TriggerServerCallback('cloudis_scoreboard', function(ems, police, taxi, mechanic)
			emsonline    = ems
			policeonline = police
			taxionline   = taxi 
			mechaniconline  = mechanic 
		end)
	end
end)
			
 Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(0)
 		if IsControlPressed(0, 178) then
		ESX.ShowNotification("Poliiseja: ~r~" .. policeonline .. "~s~\nEnsihoitajia: ~r~" .. emsonline .. "~s~\nTaxeja: ~r~" .. taxionline .. "~s~\nMekaanikkoja: ~r~" .. mechaniconline .. "~s~\n\nSinun ID: ~r~" .. id )
 		end
 	end
 end)