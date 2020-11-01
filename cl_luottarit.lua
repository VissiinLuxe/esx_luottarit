ESX          = nil
luottari = false


Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx_luotiliivi:pueliivit')
AddEventHandler('esx_luotiliivi:pueliivit', function()
luottari = true
TriggerEvent('esx_luotiliivi:pukee')
Citizen.Wait(3000)
TriggerEvent('esx_luotiliivi:pukee')
 Citizen.Wait(2500)
ESX.ShowNotification('Käytit luotiliivit') -- FIN
--ESX.ShowNotification('You wore a bulletproof vest') -- ENG
 luottari = false
  if GetPedArmour(GetPlayerPed(-1)) == 100 then
  else
    SetPedArmour(GetPlayerPed(-1), 0)
    ClearPedBloodDamage(GetPlayerPed(-1))
    ResetPedVisibleDamage(GetPlayerPed(-1))
    ClearPedLastWeaponDamage(GetPlayerPed(-1))
    ResetPedMovementClipset(GetPlayerPed(-1), 0)

    TriggerServerEvent('esx_luotiliivi:poistaliivit')
    TriggerEvent('skinchanger:getSkin', function(skin)

      if skin.sex == 0 then
       TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 27,  ['bproof_2'] = 5})
        SetPedArmour(GetPlayerPed(-1), 100)
      else
        TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 27,  ['bproof_2'] = 5})
        SetPedArmour(GetPlayerPed(-1), 100)

      end

    end)
  end

end)








Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if luottari then
			DisableControlAction(1, 32, true )
			DisableControlAction(1, 30, true )
			DisableControlAction(1, 31, true )
			DisableControlAction(1, 34, true )
			DisableControlAction(1, 25, true )
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(1, 73, true)
			DisableControlAction(1, 23, true)
			DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
			DisablePlayerFiring(ped, true) -- Disable weapon firing

		else
			Citizen.Wait(500)
		end
	end
end)


RegisterNetEvent('esx_luotiliivi:pukee')
AddEventHandler('esx_luotiliivi:pukee', function()
    local ped = PlayerPedId()
    local giveAnim = "move_f@hiking"
    RequestAnimDict(giveAnim)
    while not HasAnimDictLoaded(giveAnim) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(ped, giveAnim, "idle_intro", 8.0, 8.0, -1, 50, 0, false, false, false)
    Citizen.Wait(6090)
    ClearPedTasks(ped)
end)



