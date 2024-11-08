local QBCore = exports['qb-core']:GetCoreObject()

local playerItems = {}

RegisterNetEvent('sky:getfire', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item = 'WEAPON_FIREEXTINGUISHER'
    local count = 1

    if not playerItems[source] then
        playerItems[source] = {}
    end

    if Name(item) then
        TriggerClientEvent('ox_lib:notify', source, {
            title = Translation[Config.Locale]['error1'],
            description = Translation[Config.Locale]['error2'],
            type = 'error'
        })
    else
        playerItems[source][item] = true
        TriggerClientEvent('giveex', source)
        Citizen.Wait(Config.Delay)

        Player.Functions.AddItem(item, count)
    end
end)

RegisterNetEvent('change', function()
    local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
    local item = 'WEAPON_FIREEXTINGUISHER'
    local count = 1

    if Player.Functions.GetItemByName(item) then
        Player.Functions.RemoveItem(item, Player.Functions.GetItemByName(item).count)
        TriggerClientEvent('getnewex', source)
        Citizen.Wait(Config.Delay)
        Player.Functions.AddItem(item, count)
        TriggerClientEvent('ox_lib:notify', _source, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['success3'],
            type = 'inform'
        })
    else
        TriggerClientEvent('ox_lib:notify', _source, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['inform2'],
            type = 'inform'
        })
    end
end)

RegisterNetEvent('sky:remove', function()
    local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
    local item = 'WEAPON_FIREEXTINGUISHER'
    local count = 1

    if Player.Functions.GetItemByName(item) then
        TriggerClientEvent('remex', source)
        Citizen.Wait(Config.Delay)
        Player.Functions.RemoveItem(item, Player.Functions.GetItemByName(item).count)
        TriggerClientEvent('ox_lib:notify', _source, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['remfire1'],
            type = 'inform'
        })
    else
        TriggerClientEvent('ox_lib:notify', _source, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['inform2'],
            type = 'inform'
        })
    end
end)

