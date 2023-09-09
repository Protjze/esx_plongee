ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem('tresor', function(source)
    local _source       = source
    local xPlayer       = ESX.GetPlayerFromId(_source)
    local randomMoney   = math.random(Config.TresorMoney.min, Config.TresorMoney.max)
    local random        = math.random(0,5)
    if (random >= 0 and random <= 4) then
        xPlayer.addMoney(randomMoney)
        xPlayer.removeInventoryItem('tresor', 1)
        xPlayer.showNotification(Config.Notif.tresorWin.msg..randomMoney.."$", Config.Notif.tresorWin.flash, Config.Notif.tresorWin.saveToBrief, Config.Notif.tresorWin.color)
    end
    if (random == 5) then
        xPlayer.showNotification(Config.Notif.tresorVide.msg, Config.Notif.tresorVide.flash, Config.Notif.tresorVide.saveToBrief, Config.Notif.tresorVide.color)
        xPlayer.removeInventoryItem('tresor', 1)
    end
end)
RegisterServerEvent("esx_plongee:giveitem")
AddEventHandler("esx_plongee:giveitem", function(itemName, itemLabel)
    local _source   = source
    local xPlayer   = ESX.GetPlayerFromId(_source)
    local itemCount = 1
    if (itemName == "fish") then
        local random = math.random(1,4)
        itemCount = random
        if xPlayer.canCarryItem(itemName, itemCount) then
            xPlayer.addInventoryItem(itemName, itemCount)
            xPlayer.showNotification(Config.Notif.giveItemFish.msg1..itemLabel..Config.Notif.giveItemFish.msg2..itemCount, Config.Notif.giveItemFish.flash, Config.Notif.giveItemFish.saveToBrief, Config.Notif.giveItemFish.color)
        else  
            xPlayer.showNotification(Config.Notif.inventoryFull.msg, Config.Notif.inventoryFull.flash, Config.Notif.inventoryFull.saveToBrief, Config.Notif.inventoryFull.color)
        end     
    else      
        if xPlayer.canCarryItem(itemName, itemCount) then     
            xPlayer.addInventoryItem(itemName, itemCount)
            xPlayer.showNotification(Config.Notif.giveItem.msg..itemLabel, Config.Notif.giveItem.flash, Config.Notif.giveItem.saveToBrief, Config.Notif.giveItem.color)
        else
            xPlayer.showNotification(Config.Notif.inventoryFull.msg, Config.Notif.inventoryFull.flash, Config.Notif.inventoryFull.saveToBrief, Config.Notif.inventoryFull.color)
        end
    end
end)

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

--If Tenu are deleted
ESX.RegisterUsableItem('tenu_origin', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem('tenu_origin', 1)
    TriggerClientEvent("esx_tenues:settenueorigin", _source)
end)
