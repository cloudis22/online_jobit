Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local id = GetPlayerServerId(PlayerId())

LanssitPaikalla = 0
PoliisitPaikalla = 0
TaxitPaikalla = 0
MekaanikotPaikalla = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		ESX.TriggerServerCallback('cloudis_scoreboard', function(lanssi, poliisi, taxi, meksu)
			LanssitPaikalla    = lanssi
			PoliisitPaikalla = poliisi
			TaxitPaikalla   = taxi 
			MekaanikotPaikalla  = meksu 
		end)
	end
end)
			
 Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(0)
 		if IsControlPressed(0, 178) then
		ESX.ShowNotification("Poliiseja: ~r~" .. PoliisitPaikalla .. "~s~\nEnsihoitajia: ~r~" .. LanssitPaikalla .. "~s~\nTaxeja: ~r~" .. TaxitPaikalla .. "~s~\nMekaanikkoja: ~r~" .. MekaanikotPaikalla .. "~s~\n\nSinun ID: ~r~" .. id )
 		end
 	end
 end)
