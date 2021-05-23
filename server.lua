ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-------------Light Diving suit
ESX.RegisterUsableItem('plongee1', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_tenues:settenueplongees', _source)   
    if Config.deleteTenu then
        xPlayer.removeInventoryItem('plongee1', 1)
        xPlayer.addInventoryItem('tenu_origin', 1)
    end
end)

-------------diving suit
ESX.RegisterUsableItem('plongee2', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_tenues:settenueplongeel', _source) 
    if Config.deleteTenu then
       xPlayer.removeInventoryItem('plongee2', 1)
       xPlayer.addInventoryItem('tenu_origin', 1)
    end
end)


ESX.RegisterUsableItem('tenu_origin', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if Config.deleteTenu == true then
        xPlayer.removeInventoryItem('tenu_origin', 1)
        TriggerClientEvent("esx_tenues:settenueorigin", _source)
    end
end)


ESX.RegisterUsableItem('tresor', function(source)
    local _source       = source
    local xPlayer       = ESX.GetPlayerFromId(_source)
    --Random
    local random        = math.random(0,20)
    local randomMoney   = math.random(500, 500000)
    local randomDiamond = math.random(1,10)
    local randomGold    = math.random(2,12)
    --GetMultipleGive
    local ComboCount    = (randomDiamond + randomGold)
    local ComboItem     = ('gold' and 'diamond')
    --GetRandom
    local CountDiamond  = randomDiamond
    local CountGold     = randomGold
    if  xPlayer.canSwapItem('tresor', 1, ComboItem, ComboCount) then
        if (random >= 0 and random <= 2) then
            --print(ComboItem, ComboCount)
            --print("slect", CountGold, CountDiamond)
            xPlayer.addInventoryItem('gold', CountGold)
            xPlayer.addInventoryItem('diamond', CountDiamond)
            xPlayer.addMoney(randomMoney)
            xPlayer.removeInventoryItem('tresor', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', _source, '~r~Pas de place dans l\'inventaire')
    end
    if xPlayer.canSwapItem('tresor', 1, 'gold', CountGold) then
        if (random >= 3 and random <= 6) or (random >= 13 and random <= 19) then
            xPlayer.addInventoryItem('gold', CountGold)
            xPlayer.removeInventoryItem('tresor', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', _source, '~r~Pas de place dans l\'inventaire')
    end
    if (random >= 7 and random <= 9) then
        xPlayer.addMoney(randomMoney)
        xPlayer.removeInventoryItem('tresor', 1)
    end
    if xPlayer.canSwapItem('tresor', 1, 'diamond', CountDiamond) then
        if (random >= 10 and random <= 12) then
            xPlayer.addInventoryItem('diamond', CountDiamond)
            xPlayer.removeInventoryItem('tresor', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', _source, '~r~Pas de place dans l\'inventaire')
    end
    if (random == 20) then
        TriggerClientEvent('esx:showNotification', _source, '~r~Le coffre est vide!')
    end
end)

RegisterServerEvent("esx_plongee:giveitem")
AddEventHandler("esx_plongee:giveitem", function(itemName)
    local _source   = source
    local xPlayer   = ESX.GetPlayerFromId(_source)
    local itemCount = 1
    if xPlayer.canCarryItem(itemName, itemCount) then
        if (item == "fish") then
            local random = math.random(1,4)
            local itemCount = random
            xPlayer.addInventoryItem(itemName, itemCount)
        else
            xPlayer.addInventoryItem(itemName, itemCount)
        end
    else
        TriggerClientEvent('esx:showNotification', _source, '~r~Pas de place dans l\'inventaire')
    end
end)
