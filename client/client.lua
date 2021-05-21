-- kadeciok#1234
-- nie usuwaj tego!

kadet = nil

Citizen.CreateThread(function()
	while kadet == nil do
		TriggerEvent('kadet:getSharedObject', function(obj) kadet = obj end)
		Citizen.Wait(0)
	end
end)

--TriggerEvent('kadet_notify:clientNotify', {text='Tekst Powiadomienia', type='info'})
--TriggerEvent('kadet_notify:clientCountdown', {text='Tekst Odliczania', time=5000})

--[[
RegisterNetEvent('kadet_discord:test')
AddEventHandler('kadet_discord:test', function()
	-- do stuff
end)
]]

--[[
kadet.TriggerServerCallback('kadet_discord:testCallback', function(result)
	-- do stuff
end)
]]

-- kadeciok#1234
-- nie usuwaj tego!