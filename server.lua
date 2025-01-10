RegisterNetEvent('ox_extinguisher:process', function()
    local _source = source
    local item = 'WEAPON_FIREEXTINGUISHER'
    local count = 1

    if exports.ox_inventory:GetItemCount(source, item) > 0 then
        TriggerClientEvent('remex', source)
        Citizen.Wait(Config.Delay)
        exports.ox_inventory:RemoveItem(source, item, 1)
        TriggerClientEvent('ox_lib:notify', _source, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['remfire1'],
            type = 'inform'
        })
    else
        TriggerClientEvent('getnewex', source)
        Citizen.Wait(Config.Delay)
        exports.ox_inventory:AddItem(source, item, count)
        TriggerClientEvent('ox_lib:notify', _source, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['inform2'],
            type = 'inform'
        })
    end
end)

