ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('t_mestojenTutkiminen:randomGift')
AddEventHandler('t_mestojenTutkiminen:randomGift', function(Type, ItemName, Maara)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)

    if Type == "weapon" then
        xPlayer.addWeapon(ItemName, Maara)
        TriggerClientEvent('esx:showNotification', source, "Sinä löysit ~b~"..ESX.GetWeaponLabel(ItemName).."~w~, jossa on luoteja ~b~"..Maara)
    elseif Type == "item" then
        xPlayer.addInventoryItem(ItemName, Maara)
        local itemForLabel = xPlayer.getInventoryItem(ItemName)
        TriggerClientEvent('esx:showNotification', source, "Sinä löysit ~b~x"..Maara.." ~w~tavaraa ~b~"..itemForLabel.label)
    elseif Type == "cash" then
        xPlayer.addMoney(Maara)
        TriggerClientEvent('esx:showNotification', source, "Sinä löysit ~g~"..Maara.."€")
    end
end)