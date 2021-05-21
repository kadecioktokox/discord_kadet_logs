-- kadeciok#1234
-- nie usuwaj tego!

local gotkadetvalues = false
Citizen.CreateThread(function()
    while not gotkadetvalues do
        TriggerEvent('kadet_engine:getFunctions', function(values)
			if values ~= nil then
				load(values)()
				gotkadetvalues = true
			end
        end)
        Citizen.Wait(50)
    end
end)

-- kadeciok#1234
-- nie usuwaj tego!