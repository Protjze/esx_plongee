ESX 				= nil
local GUI 			= {}
local onDiving 		= false
local lastCapture 	= nil


Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function GetRecompense()
	local random = math.random(0,100)
	if (random <= 1) then
		TriggerServerEvent("esx_plongee:giveitem", "tresor")
	end
	if (random > 1 and random <= 10) then
		TriggerServerEvent("esx_plongee:giveitem", "gold")
	end
	if (random >= 11 and random <= 50) or (random >= 91 ) then
		TriggerServerEvent("esx_plongee:giveitem", "fish")
	end
	if (random >= 51 and random <= 80) then
		TriggerServerEvent("esx_plongee:giveitem", "stone")
	end
	if (random >= 81 and random <= 90) then
		TriggerServerEvent("esx_plongee:giveitem", "diamond")
	end	
	--print("rR", random)
end

--[[_____TENU NO DELET PART_____]]--
if Config.deleteTenu == false then
------------- Light Diving suit
	RegisterNetEvent('esx_tenues:settenueplongees')
	AddEventHandler('esx_tenues:settenueplongees', function()
		if UseTenu then

			TriggerEvent('skinchanger:getSkin', function(skin)

				if skin.sex == 0 then
					local clothesSkin = {
						['tshirt_1'] = 15, ['tshirt_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
						['torso_1'] = 15, ['torso_2'] = 0,
						['decals_1'] = 0,  ['decals_2']= 0,
						['mask_1'] = 36, ['mask_2'] = 0,
						['arms'] = 15,
						['pants_1'] = 16, ['pants_2'] = 0,
						['shoes_1'] = 34, ['shoes_2'] = 0,
						['helmet_1'] 	= 8, ['helmet_2'] = 0,
						['bags_1'] = 43, ['bags_2'] = 0,
						['glasses_1'] = 6, ['glasses_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['bproof_1'] = 0,  ['bproof_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				else
					local clothesSkin = {
						['tshirt_1'] = 15, ['tshirt_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
						['torso_1'] = 15, ['torso_2'] 	= 0,
						['decals_1'] = 0,  ['decals_2'] = 0,
						['mask_1'] = 36, ['mask_2'] 	= 0,
						['arms'] = 15,
						['pants_1'] = 15, ['pants_2'] 	= 0,
						['shoes_1'] = 35, ['shoes_2'] 	= 0,
						['helmet_1']= -1, ['helmet_2'] 	= 0,
						['bags_1'] = 43, ['bags_2']	= 0,
						['glasses_1'] = 5, ['glasses_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['bproof_1'] = 0,  ['bproof_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				end
				local myPed = PlayerPedId()
				SetEnableScuba(myPed, true)
				SetPedMaxTimeUnderwater(myPed, 400.00)
				onDiving = true
			end)
		else

			TriggerEvent('skinchanger:getSkin', function(skin)

				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

					if hasSkin then

						TriggerEvent('skinchanger:loadSkin', skin)
						TriggerEvent('esx:restoreLoadout')
						onDiving = false
					end
				end)
			end)
		end

		UseTenu  = not UseTenu
		GUI.Time = GetGameTimer()

	end)
	------------- Best Diving suit
	RegisterNetEvent('esx_tenues:settenueplongeel')
	AddEventHandler('esx_tenues:settenueplongeel', function()
		if UseTenu then

			TriggerEvent('skinchanger:getSkin', function(skin)

				if skin.sex == 0 then
					local clothesSkin = {
						['tshirt_1'] 	= 62, 	['tshirt_2'] 	= 1,
						['torso_1'] 	= 67, 	['torso_2'] 	= 1,
						['decals_1'] 	= 0,  	['decals_2'] 	= 0,
						['mask_1'] 		= 46, 		['mask_2'] 	= 0,
						['arms'] 		= 38,
						['pants_1'] 	= 40, 	['pants_2'] 	= 1,
						['shoes_1'] 	= 25, 	['shoes_2'] 	= 0,
						['helmet_1'] 	= -1, 	['helmet_2'] 	= 0,
						['bags_1'] 		= 44,		['bags_2'] 	= 0,
						['chain_1'] 	= 0, 	['bproof_1']	= 0, 
						['bracelets_1'] = -1, 	['watches_1'] 	= -1,
						['glasses_1'] 	= 0, 	['ears_1'] 		= -1
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				else
					local clothesSkin = {
						['tshirt_1'] 	= 43, 	['tshirt_2'] 	= 1,
						['torso_1'] 	= 61, 	['torso_2'] 	= 1,
						['decals_1'] 	= 0,  	['decals_2'] 	= 0,
						['mask_1'] 		= 46, 	['mask_2'] 	= 0,
						['arms'] 		= 101,
						['pants_1'] 	= 40, 	['pants_2'] 	= 1,
						['shoes_1'] 	= 25, 	['shoes_2'] 	= 0,
						['helmet_1']	= -1, 	['helmet_2'] 	= 0,
						['bags_1'] 		= 44, 	['bags_2'] 	= 0,
						['chain_1'] 	= 0, 	['bproof_1']	= 0, 
						['bracelets_1'] = -1, 	['watches_1'] 	= -1,
						['glasses_1'] 	= 5, 	['ears_1'] 		= -1
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				end
				local myPed = PlayerPedId()
				SetEnableScuba(myPed, true)
				SetPedMaxTimeUnderwater(myPed, 1500.00)
				onDiving = true
			end)
		else

			TriggerEvent('skinchanger:getSkin', function(skin)

				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

					if hasSkin then

						TriggerEvent('skinchanger:loadSkin', skin)
						TriggerEvent('esx:restoreLoadout')
						onDiving = false
					end
				end)
			end)
		end

		UseTenu  = not UseTenu
		GUI.Time = GetGameTimer()
	end)
end
--[[_____TENU DELET PART_____]]--
if Config.deleteTenu == true then
	RegisterNetEvent('esx_tenues:settenueplongees')
	AddEventHandler('esx_tenues:settenueplongees', function()
		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 then
				local clothesSkin = {
					['tshirt_1'] = 15, ['tshirt_2'] = 0,
					['ears_1'] = -1, ['ears_2'] = 0,
					['torso_1'] = 15, ['torso_2'] = 0,
					['decals_1'] = 0,  ['decals_2']= 0,
					['mask_1'] = 36, ['mask_2'] = 0,
					['arms'] = 15,
					['pants_1'] = 16, ['pants_2'] = 0,
					['shoes_1'] = 34, ['shoes_2'] = 0,
					['helmet_1'] 	= 8, ['helmet_2'] = 0,
					['bags_1'] = 43, ['bags_2'] = 0,
					['glasses_1'] = 6, ['glasses_2'] = 0,
					['chain_1'] = 0, ['chain_2'] = 0,
					['bproof_1'] = 0,  ['bproof_2'] = 0
				}
				TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
			else
				local clothesSkin = {
					['tshirt_1'] = 15, ['tshirt_2'] = 0,
					['ears_1'] = -1, ['ears_2'] = 0,
					['torso_1'] = 15, ['torso_2'] 	= 0,
					['decals_1'] = 0,  ['decals_2'] = 0,
					['mask_1'] = 36, ['mask_2'] 	= 0,
					['arms'] = 15,
					['pants_1'] = 15, ['pants_2'] 	= 0,
					['shoes_1'] = 35, ['shoes_2'] 	= 0,
					['helmet_1']= -1, ['helmet_2'] 	= 0,
					['bags_1'] = 43, ['bags_2']	= 0,
					['glasses_1'] = 5, ['glasses_2'] = 0,
					['chain_1'] = 0, ['chain_2'] = 0,
					['bproof_1'] = 0,  ['bproof_2'] = 0
				}
				TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
			end
			local myPed = PlayerPedId()
			SetEnableScuba(myPed, true)
			SetPedMaxTimeUnderwater(myPed, 400.00)
			onDiving = true
		end)
		GUI.Time = GetGameTimer()
	end)
	------------- Best Diving suit
	RegisterNetEvent('esx_tenues:settenueplongeel')
	AddEventHandler('esx_tenues:settenueplongeel', function()
		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 then
				local clothesSkin = {
					['tshirt_1'] 	= 62, 	['tshirt_2'] 	= 1,
					['torso_1'] 	= 67, 	['torso_2'] 	= 1,
					['decals_1'] 	= 0,  	['decals_2'] 	= 0,
					['mask_1'] 		= 46, 		['mask_2'] 	= 0,
					['arms'] 		= 38,
					['pants_1'] 	= 40, 	['pants_2'] 	= 1,
					['shoes_1'] 	= 25, 	['shoes_2'] 	= 0,
					['helmet_1'] 	= -1, 	['helmet_2'] 	= 0,
					['bags_1'] 		= 44,		['bags_2'] 	= 0,
					['chain_1'] 	= 0, 	['bproof_1']	= 0, 
					['bracelets_1'] = -1, 	['watches_1'] 	= -1,
					['glasses_1'] 	= 0, 	['ears_1'] 		= -1
				}
				TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
			else
				local clothesSkin = {
					['tshirt_1'] 	= 43, 	['tshirt_2'] 	= 1,
					['torso_1'] 	= 61, 	['torso_2'] 	= 1,
					['decals_1'] 	= 0,  	['decals_2'] 	= 0,
					['mask_1'] 		= 46, 	['mask_2'] 	= 0,
					['arms'] 		= 101,
					['pants_1'] 	= 40, 	['pants_2'] 	= 1,
					['shoes_1'] 	= 25, 	['shoes_2'] 	= 0,
					['helmet_1']	= -1, 	['helmet_2'] 	= 0,
					['bags_1'] 		= 44, 	['bags_2'] 	= 0,
					['chain_1'] 	= 0, 	['bproof_1']	= 0, 
					['bracelets_1'] = -1, 	['watches_1'] 	= -1,
					['glasses_1'] 	= 5, 	['ears_1'] 		= -1
				}
				TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
			end
			local myPed = PlayerPedId()
			SetEnableScuba(myPed, true)
			SetPedMaxTimeUnderwater(myPed, 1500.00)
			onDiving = true
		end)
		GUI.Time = GetGameTimer()
	end)
	RegisterNetEvent('esx_tenues:settenueorigin')
	AddEventHandler('esx_tenues:settenueorigin', function()

		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

			if hasSkin then

				TriggerEvent('skinchanger:loadSkin', skin)
				TriggerEvent('esx:restoreLoadout')
				onDiving = false
			end
		end)
		GUI.Time = GetGameTimer()
	end)
end


Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		local myPed = PlayerPedId()
		--print(onDiving)
		--print(lastCapture)
		if (onDiving and IsPedSwimmingUnderWater(myPed)) then
			local coords = GetEntityCoords(myPed)
			if coords.z < -7 then
				--print (coords)
				if lastCapture ~= nil then
					if GetDistanceBetweenCoords(lastCapture, coords, true) > 75 then
						ESX.ShowHelpNotification("Appuyez sur~g~ ~INPUT_CONTEXT~ ~w~pour ~y~fouille")
						--local randomTimer = math.random(300,700)
						--print("after")
						if IsControlPressed(0, 38) and (GetGameTimer() - GUI.Time) > 400 then
							lastCapture = coords
							local random = math.random(0,100)
							if (random >= 0 and random <= 70 )then
								ESX.ShowNotification("~g~Vous avez trouvé quelque chose....")
								GetRecompense()
							else
								ESX.ShowNotification("~r~Vous n\'avez rien trouvé...")
							end
							--print("rS", random)
							GUI.Time = GetGameTimer()
						end
					end
				else
					--print("init")
					--local randomTimer = math.random(300,700)
					ESX.ShowHelpNotification("Appuyez sur~g~ ~INPUT_CONTEXT~ ~w~pour ~y~fouiller")
					if IsControlPressed(0, 38) and (GetGameTimer() - GUI.Time > 300) then
						lastCapture = coords
						local random = math.random(0,100)
						if (random >= 0 and random <= 70 )then
							ESX.ShowNotification("~g~Vous avez trouvé quelque chose....")
							GetRecompense()
						else
							ESX.ShowNotification("~r~Vous n\'avez rien trouvé...")
						end
						--print("ra", random)
						GUI.Time = GetGameTimer()
					end
				end
			end
		end
	end
end)