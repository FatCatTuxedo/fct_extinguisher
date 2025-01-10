local modelex = Config.EX

local optionsex = {
    {
        name = 'fire_menu',
        onSelect = function()
            TriggerServerEvent('ox_extinguisher:process', cache.serverId)
        end,
        icon = 'fa-solid fa-fire-extinguisher',
        iconColor = '#e06666',
        label = Translation[Config.Locale]['target_1'],
        distance = 2.5,
    },
}

exports.ox_target:addModel(modelex, optionsex)

RegisterNetEvent('ox_extinguisher:getnewex')
AddEventHandler('ox_extinguisher:getnewex', function()
    lib.progressBar({
        duration = Config.Delay,
        label = Translation[Config.Locale]['getfire'],
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
    
    TriggerServerEvent("gu_logs:addUntrustedLog", "Fire Extinguisher", "Grabbed a fire extinguisher")
end)

RegisterNetEvent('ox_extinguisher:remex')
AddEventHandler('ox_extinguisher:remex', function()
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
    
    TriggerServerEvent("gu_logs:addUntrustedLog", "Fire Extinguisher", "Returned a fire extinguisher")
end)