function playerUpdate()
    local sleep = 0
    if LocalPlayer.state.isLoggedIn then
        sleep = (1000 * 60) * QBCore.Config.UpdateInterval
        TriggerServerEvent('QBCore:UpdatePlayer')
    end
    SetTimeout(sleep, playerUpdate)
end
playerUpdate()

function vitalsTickEvent()
    if LocalPlayer.state.isLoggedIn then
       if (QBCore.PlayerData.metadata['hunger'] <= 0 or QBCore.PlayerData.metadata['thirst'] <= 0) and not QBCore.PlayerData.metadata['isdead'] then
          local ped = PlayerPedId()
          local currentHealth = GetEntityHealth(ped)
          local decreaseThreshold = math.random(5, 10)
          SetEntityHealth(ped, currentHealth - decreaseThreshold)
       end
    end
    SetTimeout(QBCore.Config.StatusInterval, vitalsTickEvent)
end
vitalsTickEvent()

