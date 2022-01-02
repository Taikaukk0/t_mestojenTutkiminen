ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function Text3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.38, 0.38)
    SetTextFont(4)
	SetTextDropShadow()
    SetTextOutline()
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.024+ factor, 0.03, 21, 21, 21, 110)
end

Citizen.CreateThread(function()
    local wait = 1000 -- WTF KEVENEEKÖ
    while true do
        for k,v in pairs(Cfg.Mestat) do
            local ped = PlayerPedId()
            local pc = GetEntityCoords(ped)
            local dist = #(pc - v.Pos)

            if dist <= Cfg.Markers.Drawdistance then
                if Cfg.Markers.MarkersEnabled then
                    wait = 5
                    DrawMarker(Cfg.Markers.Type, v.Pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Cfg.Markers.Size, Cfg.Markers.Size, Cfg.Markers.Size * 1.5, Cfg.Markers.Color.r, Cfg.Markers.Color.g, Cfg.Markers.Color.b, 100, false, false, 2, true, false, false, false)
                end

                if dist <= Cfg.Markers.Size * 1.5 then
                    wait = 5
                    Text3D(pc.x, pc.y, pc.z, tostring(v.Text))

                    if IsControlJustReleased(0, 38) then
                        SetEntityHeading(ped, v.Heading)

                        TriggerEvent("mythic_progbar:client:progress", {
                            name = "unique_action_name",
                            duration = tonumber(v.Kesto * 1000),
                            label = "Tutkitaan kohdetta...",
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true
                            },
                            animation = {
                                task = "PROP_HUMAN_BUM_BIN"
                            }
                        }, function(status)
                            if not status then
                                local amountOfPossibleGifts = tonumber(#v.Rewards)
                                local randomGiftNumber = math.random(1, amountOfPossibleGifts)
                                local chosenGift = v.Rewards[randomGiftNumber]

                                TriggerServerEvent('t_mestojenTutkiminen:randomGift', chosenGift.Type, chosenGift.ItemName, chosenGift.Maara)
                                print("Type: "..chosenGift.Type.."\nItemName: "..chosenGift.ItemName.."\nMäärä: "..chosenGift.Maara)
                            end
                        end)
                    end
                end
            end
        end
        Citizen.Wait(wait)
    end
end)