RegisterNetEvent('ox_extinguisher:process', function(source)
    print("triggered by "..source)
    local item = 'WEAPON_FIREEXTINGUISHER'
    local count = 1

    if exports.ox_inventory:GetItemCount(source, item) > 0 then
        TriggerClientEvent('ox_extinguisher:remex', source)
        Citizen.Wait(Config.Delay)
        exports.ox_inventory:RemoveItem(source, item, 1)
        TriggerClientEvent('ox_lib:notify', source, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['remfire1'],
            type = 'inform'
        })
    else
        TriggerClientEvent('ox_extinguisher:getnewex', source)
        Citizen.Wait(Config.Delay)
        exports.ox_inventory:AddItem(source, item, count)
        TriggerClientEvent('ox_lib:notify', source, {
            title = Translation[Config.Locale]['success1'],
            description = Translation[Config.Locale]['success2'],
            type = 'inform'
        })
    end
end)

