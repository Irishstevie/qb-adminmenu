local banlength = nil
local developermode = false
local showCoords = false
local vehicleDevMode = false
local banreason = 'Unknown'
local kickreason = 'Unknown'

-- Register the event to open the main menu
RegisterNetEvent('qb-admin:client:openMenu', function()
    OpenAdminMenu()
end)

-- Function to open the admin menu
function OpenAdminMenu()
    local adminMenu = {
        {
            header = Lang:t('menu.admin_menu'),
            isMenuHeader = true
        },
        {
            header = Lang:t('menu.admin_options'),
            txt = Lang:t('desc.admin_options_desc'),
            params = {
                event = 'qb-admin:client:openAdminOptionsMenu'
            }
        },
        {
            header = Lang:t('menu.player_management'),
            txt = Lang:t('desc.player_management_desc'),
            params = {
                event = 'qb-admin:client:openPlayerManagementMenu'
            }
        },
        {
            header = Lang:t('menu.server_management'),
            txt = Lang:t('desc.server_management_desc'),
            params = {
                event = 'qb-admin:client:openServerManagementMenu'
            }
        },
        {
            header = Lang:t('menu.vehicles'),
            txt = Lang:t('desc.vehicles_desc'),
            params = {
                event = 'qb-admin:client:openVehicleOptionsMenu'
            }
        },
        {
            header = Lang:t('menu.dealer_list'),
            txt = Lang:t('desc.dealer_desc'),
            params = {
                event = 'qb-admin:client:openDealerListMenu'
            }
        },
        {
            header = Lang:t('menu.developer_options'),
            txt = Lang:t('desc.developer_desc'),
            params = {
                event = 'qb-admin:client:openDeveloperOptionsMenu'
            }
        },
        {
            header = Lang:t('menu.close'),
            txt = '',
            params = {
                event = 'qb-menu:closeMenu'
            }
        }
    }

    exports['qb-menu']:openMenu(adminMenu)
end

-- Function to open the admin options menu
RegisterNetEvent('qb-admin:client:openAdminOptionsMenu', function()
    local adminOptionsMenu = {
        {
            header = Lang:t('menu.admin_options'),
            isMenuHeader = true
        },
        {
            header = Lang:t('menu.noclip'),
            txt = Lang:t('desc.noclip_desc'),
            params = {
                event = 'qb-admin:client:toggleNoClip'
            }
        },
        {
            header = Lang:t('menu.revive'),
            txt = Lang:t('desc.revive_desc'),
            params = {
                event = 'qb-admin:client:revivePlayer'
            }
        },
        {
            header = Lang:t('menu.invisible'),
            txt = Lang:t('desc.invisible_desc'),
            params = {
                event = 'qb-admin:client:toggleInvisibility'
            }
        },
        {
            header = Lang:t('menu.god'),
            txt = Lang:t('desc.god_desc'),
            params = {
                event = 'qb-admin:client:toggleGodMode'
            }
        },
        {
            header = Lang:t('menu.names'),
            txt = Lang:t('desc.names_desc'),
            params = {
                event = 'qb-admin:client:toggleNames'
            }
        },
        {
            header = Lang:t('menu.blips'),
            txt = Lang:t('desc.blips_desc'),
            params = {
                event = 'qb-admin:client:toggleBlips'
            }
        },
        {
            header = Lang:t('menu.spawn_weapons'),
            txt = Lang:t('desc.spawn_weapons_desc'),
            params = {
                event = 'qb-admin:client:openWeaponSpawnerMenu'
            }
        },
        {
            header = Lang:t('menu.close'),
            txt = '',
            params = {
                event = 'qb-menu:closeMenu'
            }
        }
    }

    exports['qb-menu']:openMenu(adminOptionsMenu)
end)

-- Event to handle the toggle of NoClip
RegisterNetEvent('qb-admin:client:toggleNoClip', function()
    ToggleNoClip()
end)

-- Event to handle player revive
RegisterNetEvent('qb-admin:client:revivePlayer', function()
    TriggerEvent('hospital:client:Revive', PlayerPedId())
end)

-- Event to handle toggling invisibility
local invisible = false
RegisterNetEvent('qb-admin:client:toggleInvisibility', function()
    invisible = not invisible
    SetEntityVisible(PlayerPedId(), not invisible, 0)
end)

-- Event to handle toggling god mode
local godmode = false
RegisterNetEvent('qb-admin:client:toggleGodMode', function()
    godmode = not godmode
    SetPlayerInvincible(PlayerId(), godmode)
end)

-- Event to handle toggling player names
RegisterNetEvent('qb-admin:client:toggleNames', function()
    TriggerEvent('qb-admin:client:toggleNames')
end)

-- Event to handle toggling player blips
RegisterNetEvent('qb-admin:client:toggleBlips', function()
    TriggerEvent('qb-admin:client:toggleBlips')
end)

-- Function to open the player management menu
RegisterNetEvent('qb-admin:client:openPlayerManagementMenu', function()
    local playerManagementMenu = {
        {
            header = Lang:t('menu.player_management'),
            isMenuHeader = true
        },
        -- Add player management options here...
    }

    exports['qb-menu']:openMenu(playerManagementMenu)
end)

-- Function to open the server management menu
RegisterNetEvent('qb-admin:client:openServerManagementMenu', function()
    local serverManagementMenu = {
        {
            header = Lang:t('menu.server_management'),
            isMenuHeader = true
        },
        {
            header = Lang:t('menu.weather_options'),
            txt = Lang:t('desc.weather_desc'),
            params = {
                event = 'qb-admin:client:openWeatherOptionsMenu'
            }
        },
        {
            header = Lang:t('menu.server_time'),
            txt = Lang:t('desc.server_time_desc'),
            params = {
                event = 'qb-admin:client:openTimeOptionsMenu'
            }
        },
        {
            header = Lang:t('menu.close'),
            txt = '',
            params = {
                event = 'qb-menu:closeMenu'
            }
        }
    }

    exports['qb-menu']:openMenu(serverManagementMenu)
end)

-- Function to open the vehicle options menu
RegisterNetEvent('qb-admin:client:openVehicleOptionsMenu', function()
    local vehicleOptionsMenu = {
        {
            header = Lang:t('menu.vehicle_options'),
            isMenuHeader = true
        },
        {
            header = Lang:t('menu.spawn_vehicle'),
            txt = Lang:t('desc.spawn_vehicle_desc'),
            params = {
                event = 'qb-admin:client:openVehicleSpawnerMenu'
            }
        },
        {
            header = Lang:t('menu.fix_vehicle'),
            txt = Lang:t('desc.fix_vehicle_desc'),
            params = {
                event = 'qb-admin:client:fixVehicle'
            }
        },
        {
            header = Lang:t('menu.buy'),
            txt = Lang:t('desc.buy_desc'),
            params = {
                event = 'qb-admin:client:buyVehicle'
            }
        },
        {
            header = Lang:t('menu.remove_vehicle'),
            txt = Lang:t('desc.remove_vehicle_desc'),
            params = {
                event = 'qb-admin:client:removeVehicle'
            }
        },
        {
            header = Lang:t('menu.max_mods'),
            txt = Lang:t('desc.max_mod_desc'),
            params = {
                event = 'qb-admin:client:maxVehicleMods'
            }
        },
        {
            header = Lang:t('menu.close'),
            txt = '',
            params = {
                event = 'qb-menu:closeMenu'
            }
        }
    }

    exports['qb-menu']:openMenu(vehicleOptionsMenu)
end)

-- Function to open the dealer list menu
RegisterNetEvent('qb-admin:client:openDealerListMenu', function()
    local dealerListMenu = {
        {
            header = Lang:t('menu.dealer_list'),
            isMenuHeader = true
        },
        -- Add dealer list options here...
    }

    exports['qb-menu']:openMenu(dealerListMenu)
end)

-- Function to open the developer options menu
RegisterNetEvent('qb-admin:client:openDeveloperOptionsMenu', function()
    local developerOptionsMenu = {
        {
            header = Lang:t('menu.developer_options'),
            isMenuHeader = true
        },
        {
            header = Lang:t('menu.copy_vector3'),
            txt = Lang:t('desc.vector3_desc'),
            params = {
                event = 'qb-admin:client:copyCoords',
                args = { type = 'vector3' }
            }
        },
        {
            header = Lang:t('menu.copy_vector4'),
            txt = Lang:t('desc.vector4_desc'),
            params = {
                event = 'qb-admin:client:copyCoords',
                args = { type = 'vector4' }
            }
        },
        {
            header = Lang:t('menu.copy_heading'),
            txt = Lang:t('desc.copy_heading_desc'),
            params = {
                event = 'qb-admin:client:copyCoords',
                args = { type = 'heading' }
            }
        },
        {
            header = Lang:t('menu.display_coords'),
            txt = Lang:t('desc.display_coords_desc'),
            params = {
                event = 'qb-admin:client:toggleShowCoords'
            }
        },
        {
            header = Lang:t('menu.vehicle_dev_mode'),
            txt = Lang:t('desc.vehicle_dev_mode_desc'),
            params = {
                event = 'qb-admin:client:toggleVehicleDevMode'
            }
        },
        {
            header = Lang:t('menu.hud_dev_mode'),
            txt = Lang:t('desc.hud_dev_mode_desc'),
            params = {
                event = 'qb-admin:client:toggleDevMode'
            }
        },
        {
            header = Lang:t('menu.close'),
            txt = '',
            params = {
                event = 'qb-menu:closeMenu'
            }
        }
    }

    exports['qb-menu']:openMenu(developerOptionsMenu)
end)

-- Event to copy coordinates to clipboard
RegisterNetEvent('qb-admin:client:copyCoords', function(data)
    CopyToClipboard(data.type)
end)

-- Event to handle toggling showing coordinates
RegisterNetEvent('qb-admin:client:toggleShowCoords', function()
    ToggleShowCoordinates()
end)

-- Event to handle toggling vehicle developer mode
RegisterNetEvent('qb-admin:client:toggleVehicleDevMode', function()
    ToggleVehicleDeveloperMode()
end)

-- Event to handle toggling developer mode
RegisterNetEvent('qb-admin:client:toggleDevMode', function()
    developermode = not developermode
    TriggerEvent('qb-admin:client:ToggleDevmode')
    SetPlayerInvincible(PlayerId(), developermode)
end)

-- Functions to handle different developer options
function CopyToClipboard(dataType)
    local ped = PlayerPedId()
    if dataType == 'vector3' then
        local coords = GetEntityCoords(ped)
        local x = QBCore.Shared.Round(coords.x, 2)
        local y = QBCore.Shared.Round(coords.y, 2)
        local z = QBCore.Shared.Round(coords.z, 2)
        SendNUIMessage({
            string = string.format('vector3(%s, %s, %s)', x, y, z)
        })
        QBCore.Functions.Notify(Lang:t('success.coords_copied'), 'success')
    elseif dataType == 'vector4' then
        local coords = GetEntityCoords(ped)
        local x = QBCore.Shared.Round(coords.x, 2)
        local y = QBCore.Shared.Round(coords.y, 2)
        local z = QBCore.Shared.Round(coords.z, 2)
        local heading = GetEntityHeading(ped)
        local h = QBCore.Shared.Round(heading, 2)
        SendNUIMessage({
            string = string.format('vector4(%s, %s, %s, %s)', x, y, z, h)
        })
        QBCore.Functions.Notify(Lang:t('success.coords_copied'), 'success')
    elseif dataType == 'heading' then
        local heading = GetEntityHeading(ped)
        local h = QBCore.Shared.Round(heading, 2)
        SendNUIMessage({
            string = h
        })
        QBCore.Functions.Notify(Lang:t('success.heading_copied'), 'success')
    end
end

function ToggleShowCoordinates()
    local x = 0.4
    local y = 0.025
    showCoords = not showCoords
    CreateThread(function()
        while showCoords do
            local coords = GetEntityCoords(PlayerPedId())
            local heading = GetEntityHeading(PlayerPedId())
            local c = {}
            c.x = QBCore.Shared.Round(coords.x, 2)
            c.y = QBCore.Shared.Round(coords.y, 2)
            c.z = QBCore.Shared.Round(coords.z, 2)
            heading = QBCore.Shared.Round(heading, 2)
            Wait(0)
            Draw2DText(string.format('~w~' .. Lang:t('info.ped_coords') .. '~b~ vector4(~w~%s~b~, ~w~%s~b~, ~w~%s~b~, ~w~%s~b~)', c.x, c.y, c.z, heading), 4, { 66, 182, 245 }, 0.4, x + 0.0, y + 0.0)
        end
    end)
end

function ToggleVehicleDeveloperMode()
    local x = 0.4
    local y = 0.888
    vehicleDevMode = not vehicleDevMode
    CreateThread(function()
        while vehicleDevMode do
            local ped = PlayerPedId()
            Wait(0)
            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                local netID = VehToNet(vehicle)
                local hash = GetEntityModel(vehicle)
                local modelName = GetLabelText(GetDisplayNameFromVehicleModel(hash))
                local eHealth = GetVehicleEngineHealth(vehicle)
                local bHealth = GetVehicleBodyHealth(vehicle)
                Draw2DText(Lang:t('info.vehicle_dev_data'), 4, { 66, 182, 245 }, 0.4, x + 0.0, y + 0.0)
                Draw2DText(string.format(Lang:t('info.ent_id') .. '~b~%s~s~ | ' .. Lang:t('info.net_id') .. '~b~%s~s~', vehicle, netID), 4, { 255, 255, 255 }, 0.4, x + 0.0, y + 0.025)
                Draw2DText(string.format(Lang:t('info.model') .. '~b~%s~s~ | ' .. Lang:t('info.hash') .. '~b~%s~s~', modelName, hash), 4, { 255, 255, 255 }, 0.4, x + 0.0, y + 0.050)
                Draw2DText(string.format(Lang:t('info.eng_health') .. '~b~%s~s~ | ' .. Lang:t('info.body_health') .. '~b~%s~s~', QBCore.Shared.Round(eHealth, 2), QBCore.Shared.Round(bHealth, 2)), 4, { 255, 255, 255 }, 0.4, x + 0.0, y + 0.075)
            end
        end
    end)
end

function Draw2DText(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1], colour[2], colour[3], 255)
    BeginTextCommandDisplayText('STRING')
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentSubstringPlayerName(content)
    EndTextCommandDisplayText(x, y)
end

-- Functions for Weather and Time options
RegisterNetEvent('qb-admin:client:openWeatherOptionsMenu', function()
    local weatherOptionsMenu = {
        {
            header = Lang:t('menu.weather_conditions'),
            isMenuHeader = true
        },
        {
            header = Lang:t('weather.extra_sunny'),
            txt = Lang:t('weather.extra_sunny_desc'),
            params = {
                event = 'qb-admin:client:setWeather',
                args = { weather = 'EXTRASUNNY' }
            }
        },
        {
            header = Lang:t('weather.clear'),
            txt = Lang:t('weather.clear_desc'),
            params = {
                event = 'qb-admin:client:setWeather',
                args = { weather = 'CLEAR' }
            }
        },
        -- Add more weather options here...
        {
            header = Lang:t('menu.close'),
            txt = '',
            params = {
                event = 'qb-menu:closeMenu'
            }
        }
    }

    exports['qb-menu']:openMenu(weatherOptionsMenu)
end)

RegisterNetEvent('qb-admin:client:setWeather', function(data)
    TriggerServerEvent('qb-weathersync:server:setWeather', data.weather)
    QBCore.Functions.Notify(Lang:t('weather.weather_changed', { value = data.weather }), 'success')
end)

RegisterNetEvent('qb-admin:client:openTimeOptionsMenu', function()
    local timeOptionsMenu = {
        {
            header = Lang:t('menu.server_time'),
            isMenuHeader = true
        },
        {
            header = Lang:t('menu.set_time'),
            txt = Lang:t('menu.set_time_desc'),
            params = {
                event = 'qb-admin:client:setTime'
            }
        },
        {
            header = Lang:t('menu.close'),
            txt = '',
            params = {
                event = 'qb-menu:closeMenu'
            }
        }
    }

    exports['qb-menu']:openMenu(timeOptionsMenu)
end)

RegisterNetEvent('qb-admin:client:setTime', function()
    local dialog = {
        {
            type = 'number',
            isRequired = true,
            label = Lang:t('menu.time'),
            name = 'time',
            min = 0,
            max = 23
        }
    }

    QBCore.Functions.Input('Set Time', dialog, function(inputs)
        if inputs then
            local time = tonumber(inputs.time)
            TriggerServerEvent('qb-weathersync:server:setTime', time, time)
            QBCore.Functions.Notify(Lang:t('time.changed', { time = time }), 'success')
        end
    end)
end)

-- Function to open the weapon spawner menu
RegisterNetEvent('qb-admin:client:openWeaponSpawnerMenu', function()
    local weaponMenu = {
        {
            header = Lang:t('menu.spawn_weapons'),
            isMenuHeader = true
        }
    }

    for _, v in pairs(QBCore.Shared.Weapons) do
        table.insert(weaponMenu, {
            header = v.label,
            txt = Lang:t('desc.spawn_weapons_desc'),
            params = {
                event = 'qb-admin:client:giveWeapon',
                args = { weapon = v.name }
            }
        })
    end

    table.insert(weaponMenu, {
        header = Lang:t('menu.close'),
        txt = '',
        params = {
            event = 'qb-menu:closeMenu'
        }
    })

    exports['qb-menu']:openMenu(weaponMenu)
end)

RegisterNetEvent('qb-admin:client:giveWeapon', function(data)
    TriggerServerEvent('qb-admin:giveWeapon', data.weapon)
    QBCore.Functions.Notify(Lang:t('success.spawn_weapon'), 'success')
end)
