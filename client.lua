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
                TriggerServerEvent('sky:process')
            end,
        },
        {
            title = Translation[Config.Locale]['menu_2'],
            icon = 'right-left',
            iconColor = '#e06666',
            onSelect = function()
                TriggerServerEvent('sky:process')
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