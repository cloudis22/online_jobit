ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('cloudis_scoreboard', function(source, cb)

  local xPlayer  = ESX.GetPlayerFromId(source)
  
  local xPlayers = ESX.GetPlayers()

	EMSConnected = 0
	PoliceConnected = 0
	TaxiConnected = 0
	MechanicConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'ambulance' then
			EMSConnected = EMSConnected + 1
		end		
		if xPlayer.job.name == 'police' then
			PoliceConnected = PoliceConnected + 1
		end	
		if xPlayer.job.name == 'taxi' then
			TaxiConnected = TaxiConnected + 1
		end	
		if xPlayer.job.name == 'mechanic' then
			MechanicConnected = MechanicConnected + 1
		end
	end
  
  
cb(EMSConnected, PoliceConnected, TaxiConnected, MechanicConnected)

end)