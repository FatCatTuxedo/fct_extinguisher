local QBCore = exports['qb-core']:GetCoreObject()

local modelex = Config.EX

local optionsex = {
    {
        name = 'fire_menu',
        onSelect = function()
            lib.showContext('fire_menu')
        end,
        icon = 'fa-solid fa-fire-extinguisher',
        iconColor = '#e06666',
        label = Translation[Config.Locale]['target_1'],
        distance = 2.5,
    },
}

exports.ox_target:addModel(modelex, optionsex)

---

lib.registerContext({
    id = 'fire_menu',
    title = Translation[Config.Locale]['menu_header'],
    options = {
        {
            title = Translation[Config.Locale]['menu_1'],
            icon = 'plus',
            iconColor = '#e06666',
            onSelect = function()
                TriggerServerEvent('sky:getfire')
            end,
        },
        {
            title = Translation[Config.Locale]['menu_2'],
            icon = 'right-left',
            iconColor = '#e06666',
            onSelect = function()
                TriggerServerEvent('sky:change')
            end,
        },
    }
})

---

RegisterNetEvent('getnewex')
AddEventHandler('getnewex', function()
    lib.progressBar({
        duration = Config.Delay,
        label = Translation[Config.Locale]['menu_2'],
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = true,
        },
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer'
        },
    })
end)

RegisterNetEvent('giveex')
AddEventHandler('giveex', function()
    if lib.progressBar({
        duration = Config.Delay,
        label = Translation[Config.Locale]['menu_1'],
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = true,
        },
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer'
        },
    }) then
        lib.notify({
            title = Translation[Config.Locale]['success1'],
            description = Translation[Config.Locale]['success2'],
            type = 'success'
        })
    end
end)

RegisterNetEvent('remex')
AddEventHandler('remex', function()
    lib.progressBar({
        duration = Config.Delay,
        label = Translation[Config.Locale]['remfire'],
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = true,
        },
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer'
        },
    })
end)

---

RegisterServerEvent('sky:getfire')
AddEventHandler('sky:getfire', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'weapon_fireextinguisher'
    local count = 1

    if Player.Functions.GetItemByName(item) then
        TriggerClientEvent('ox_lib:notify', src, {
            title = Translation[Config.Locale]['error1'],
            description = Translation[Config.Locale]['error2'],
            type = 'error'
        })
    else
        Player.Functions.AddItem(item, count)
        TriggerClientEvent('giveex', src)
        Citizen.Wait(Config.Delay)
    end
end)

RegisterServerEvent('sky:change')
AddEventHandler('sky:change', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'weapon_fireextinguisher'
    local count = 1

    if Player.Functions.GetItemByName(item) then
        Player.Functions.RemoveItem(item, Player.Functions.GetItemByName(item).amount)
        TriggerClientEvent('getnewex', src)
        Citizen.Wait(Config.Delay)
        Player.Functions.AddItem(item, count)
        TriggerClientEvent('ox_lib:notify', src, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['success3'],
            type = 'inform'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['inform2'],
            type = 'inform'
        })
    end
end)

RegisterServerEvent('sky:remove')
AddEventHandler('sky:remove', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'weapon_fireextinguisher'

    if Player.Functions.GetItemByName(item) then
        TriggerClientEvent('remex', src)
        Citizen.Wait(Config.Delay)
        Player.Functions.RemoveItem(item, Player.Functions.GetItemByName(item).amount)
        TriggerClientEvent('ox_lib:notify', src, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['remfire1'],
            type = 'inform'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['inform2'],
            type = 'inform'
        })
    end
end)


