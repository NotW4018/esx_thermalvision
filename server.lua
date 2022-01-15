ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('thermalvision', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx:thermal', source)
	xPlayer.removeInventoryItem('thermalvision', 1)
end)