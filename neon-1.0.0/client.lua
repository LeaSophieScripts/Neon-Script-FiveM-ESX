local neonEnabled = false

function ToggleNeon()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped then
        neonEnabled = not neonEnabled

        for i = 0, 3 do
            SetVehicleNeonLightEnabled(vehicle, i, neonEnabled)
        end

        ESX.ShowNotification(neonEnabled and "~g~Unterbodenbeleuchtung aktiviert." or "~r~Unterbodenbeleuchtung deaktiviert.")
    else
        ESX.ShowNotification("~r~Du musst Fahrer eines Fahrzeugs sein.")
    end
end

RegisterCommand("neon", function()
    ToggleNeon()
end, false)
