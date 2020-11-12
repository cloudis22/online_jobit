ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('cloudis_scoreboard', function(source, cb)

  local xPlayer  = ESX.GetPlayerFromId(source)
  
  local xPlayers = ESX.GetPlayers()

	Lanssit = 0
	Poliisit = 0
	Taxit = 0
	Mekaanikot = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'ambulance' then
			Lanssit = Lanssit + 1
		end		
		if xPlayer.job.name == 'police' then
			Poliisit = Poliisit + 1
		end	
		if xPlayer.job.name == 'taxi' then
			Taxit = Taxit + 1
		end	
		if xPlayer.job.name == 'mechanic' then
			Mekaanikot = Mekaanikot + 1
		end
	end
  
  
cb(Lanssit, Poliisit, Taxit, Mekaanikot)

end)
