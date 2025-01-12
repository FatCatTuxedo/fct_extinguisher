local modelex = Config.EX

local optionsex = {
    {
        name = 'fct_ext_menu',
        onSelect = function()
            TriggerServerEvent('fct_extinguisher:process', cache.serverId)
        end,
        icon = 'fa-solid fa-fire-extinguisher',
        iconColor = '#e06666',
        label = Translation[Config.Locale]['target_1'],
        distance = 2.5,
    },
}

exports.ox_target:addModel(modelex, optionsex)

RegisterNetEvent('fct_extinguisher:getnewex')
AddEventHandler('fct_extinguisher:getnewex', function()
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
end)

RegisterNetEvent('fct_extinguisher:remex')
AddEventHandler('fct_extinguisher:remex', function()
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