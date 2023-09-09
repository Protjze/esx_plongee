ESX = exports["es_extended"]:getSharedObject()

local GUI 			= {}
local onDiving, startActivity = false, false
local lastCapture 	= nil


function GetRecompense()
	ESX.ShowNotification(Config.Notif.duringSearch.msg, Config.Notif.duringSearch.flash, Config.Notif.duringSearch.saveToBrief, Config.Notif.duringSearch.color)
	FreezeEntityPosition(PlayerPedId(), true)
	Citizen.Wait(Config.TimeToSearch)
	local random = math.random(0,100)
	if (random <= 1) then -- Chance 1 
		TriggerServerEvent("esx_plongee:giveitem", Config.Item.i1.name, Config.Item.i1.label)
	end
	if (random > 1 and random <= 10) then -- Chance 2
		TriggerServerEvent("esx_plongee:giveitem", Config.Item.i2.name, Config.Item.i2.label)
	end
	if (random >= 11 and random <= 50) or (random >= 91 ) then -- Chance 3
		TriggerServerEvent("esx_plongee:giveitem", Config.Item.i3.name, Config.Item.i3.label)
	end
	if (random >= 51 and random <= 80) then -- Chance 4
		TriggerServerEvent("esx_plongee:giveitem", Config.Item.i4.name, Config.Item.i4.label)
	end
	if (random >= 81 and random <= 90) then -- Chance 4 
		TriggerServerEvent("esx_plongee:giveitem", Config.Item.i5.name, Config.Item.i5.label)
	end
end

--[[_____TENU NO DELET PART_____]]--
if Config.deleteTenu == false then
------------- Light Diving suit
	RegisterNetEvent('esx_tenues:settenueplongees')
	AddEventHandler('esx_tenues:settenueplongees', function()
		if UseTenu then
			TriggerEvent('skinchanger:getSkin', function(skin)
				if skin.sex == 0 then
					local clothesSkin = Config.Tenu.leger.male
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				else
					local clothesSkin = Config.Tenu.leger.female
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				end
				local myPed = PlayerPedId()
				SetEnableScuba(myPed, true)
				SetPedMaxTimeUnderwater(myPed, Config.TimeDiving.leger)
				onDiving, startActivity = true, true
				StartActivity()
			end)
		else
			TriggerEvent('skinchanger:getSkin', function(skin)
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)
					if hasSkin then
						TriggerEvent('skinchanger:loadSkin', skin)
						TriggerEvent('esx:restoreLoadout')
						onDiving, startActivity = false, false
						StartActivity()
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
					local clothesSkin = Config.Tenu.lourd.male
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				else
					local clothesSkin = Config.Tenu.lourd.female
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				end
				local myPed = PlayerPedId()
				SetEnableScuba(myPed, true)
				SetPedMaxTimeUnderwater(myPed, Config.TimeDiving.lourd)
				onDiving, startActivity = true, true
				StartActivity()
			end)
		else
			TriggerEvent('skinchanger:getSkin', function(skin)
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)
					if hasSkin then
						TriggerEvent('skinchanger:loadSkin', skin)
						TriggerEvent('esx:restoreLoadout')
						onDiving, startActivity = false, false
						StartActivity()
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
				local clothesSkin = Config.Tenu.leger.male
				TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
			else
				local clothesSkin = Config.Tenu.leger.female
				TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
			end
			local myPed = PlayerPedId()
			SetEnableScuba(myPed, true)
			SetPedMaxTimeUnderwater(myPed, Config.TimeDiving.leger)
			onDiving, startActivity = true, true
			StartActivity()
		end)
		GUI.Time = GetGameTimer()
	end)
	------------- Best Diving suit
	RegisterNetEvent('esx_tenues:settenueplongeel')
	AddEventHandler('esx_tenues:settenueplongeel', function()
		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 then
				local clothesSkin = Config.Tenu.lourd.male
				TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
			else
				local clothesSkin = Config.Tenu.lourd.female
				TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
			end
			local myPed = PlayerPedId()
			SetEnableScuba(myPed, true)
			SetPedMaxTimeUnderwater(myPed, Config.TimeDiving.lourd)
			onDiving, startActivity = true, true
			StartActivity()
		end)
		GUI.Time = GetGameTimer()
	end)
	RegisterNetEvent('esx_tenues:settenueorigin')
	AddEventHandler('esx_tenues:settenueorigin', function()
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)
			if hasSkin then
				TriggerEvent('skinchanger:loadSkin', skin)
				TriggerEvent('esx:restoreLoadout')
				onDiving, startActivity = false, false
				StartActivity()
			end
		end)
		GUI.Time = GetGameTimer()
	end)
end

function StartActivity()
	if startActivity then
		Citizen.CreateThread(function ()
			while startActivity do
				Citizen.Wait(0)
				local myPed = PlayerPedId()
				if (onDiving and IsPedSwimmingUnderWater(myPed)) then
					local coords = GetEntityCoords(myPed)
					if coords.z < -7 then
						if lastCapture ~= nil then
							if GetDistanceBetweenCoords(lastCapture, coords, true) > 75 then
								ESX.ShowHelpNotification(Config.Notif.search.msg, Config.Notif.search.thisFrame, Config.Notif.search.beep, Config.Notif.search.duration)
								if IsControlPressed(0, 38) and (GetGameTimer() - GUI.Time) > 400 then
									lastCapture = coords
									local random = math.random(0,100)
									if (random >= 0 and random <= 70 )then
										GetRecompense()
										FreezeEntityPosition(PlayerPedId(), false)
									else
										ESX.ShowNotification(Config.Notif.noFound.msg, Config.Notif.noFound.flash, Config.Notif.noFound.saveToBrief, Config.Notif.noFound.color)
									end
									GUI.Time = GetGameTimer()
								end
							end
						else
							ESX.ShowHelpNotification(Config.Notif.search.msg, Config.Notif.search.thisFrame, Config.Notif.search.beep, Config.Notif.search.duration)
							if IsControlPressed(0, 38) and (GetGameTimer() - GUI.Time > 300) then
								lastCapture = coords
								local random = math.random(0,100)
								if (random >= 0 and random <= 70 )then
									GetRecompense()
									FreezeEntityPosition(PlayerPedId(), false)
								else
									ESX.ShowNotification(Config.Notif.noFound.msg, Config.Notif.noFound.flash, Config.Notif.noFound.saveToBrief, Config.Notif.noFound.color)
								end
								GUI.Time = GetGameTimer()
							end
						end
					end
				end
			end
		end)
	else
		startActivity = false
		return
	end
end
