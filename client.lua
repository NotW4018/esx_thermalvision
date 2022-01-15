ESX = nil

local ThermalVision = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)



ThermalVision = true
RegisterNetEvent("esx:thermal")
AddEventHandler("esx:thermal", function()
	if ThermalVision then
		ThermalVision = false
		local animDict = 'mp_masks@on_foot'
		local animName = 'put_on_mask'

		RequestAnimDict(animDict)

		while not HasAnimDictLoaded(animDict) do
			Wait(10)
		end
		

		TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 8.0, -8.0, -1, 100, 0, false, false, false)

		   exports["progressBars"]:startUI(1000, "Stavljas Thermal...")
			Wait(1000)
			SetSeethrough(true)

		TriggerEvent('skinchanger:getSkin', function(skin) 
			if skin.sex == 0 then
				local clothesSkin = {
            		['helmet_1'] = 117, ['helmet_2'] = 0 ---Change these values for which ThermalVision helmet want to use.
						}
			  TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
			else
				local clothesSkin = {
            		['helmet_1'] = -1, ['helmet_2'] 	= 0
        		}
				TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				end
    end)
	else
		SetSeethrough(false)
		ThermalVision = true
		local animDict = 'missfbi4'
		local animName = 'takeoff_mask'

		RequestAnimDict(animDict)

		while not HasAnimDictLoaded(animDict) do
			Wait(10)
		end

		TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 8.0, -8.0, -1, 80, 0, false, false, false)

		    exports["progressBars"]:startUI(1000, "Skidas Thermal...")
			Wait(1000)


		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 then
				local clothesSkin = {
            		['helmet_1'] = -1, ['helmet_2'] = 0
						}
			  TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
			else
				local clothesSkin = {
            		['helmet_1'] = -1, ['helmet_2'] 	= 0
        		}
				TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				end
    end)
	end
end)