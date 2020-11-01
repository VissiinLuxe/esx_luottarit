ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bulletproof', function(luottari)
    TriggerClientEvent('esx_luotiliivi:pueliivit', luottari)
    local xPlayer = ESX.GetPlayerFromId(luottari)
    local drill = xPlayer.getInventoryItem('bulletproof')

    xPlayer.removeInventoryItem('bulletproof', 1)
    TriggerClientEvent('esx_luotiliivi:pukee', luottari)
end)