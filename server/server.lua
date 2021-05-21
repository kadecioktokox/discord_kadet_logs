-- kadeciok#1234
-- nie usuwaj tego!

kadet = nil

local sendStart = true

local avatar = "Link do avataru!"
local name = "Nazwa Servera"
local ip = false
local green 			  = 56108
local grey 				  = 8421504
local red 				  = 16711680
local orange 			  = 16744192
local blue 				  = 2061822
local purple 			  = 11750815

TriggerEvent('kadet:getSharedObject', function(obj) kadet = obj end)

RegisterNetEvent('kadet_discord:getStartupMessage')
AddEventHandler('kadet_discord:getStartupMessage', function(cb)
	cb(sendStart)
end)

--TriggerClientEvent('kadet_notify:clientNotify', source, {text='Tekst Powiadomienia', type='info'})
--TriggerClientEvent('kadet_notify:clientCountdown', source, {text='Tekst Odliczania', time=5000})

--[[
RegisterNetEvent('kadet_discord:test')
AddEventHandler('kadet_discord:test', function()
	-- do server stuff
end)
]]

--[[
kadet.RegisterServerCallback('kadet_discord:testCallback', function(source, cb)
	-- do server stuff
end)
]]

RegisterNetEvent('kadet_discord:connect')
AddEventHandler('kadet_discord:connect', function()
	local weebhook     = "https://discord.com/api/webhooks/"
	local _source      = source
	local _sourceNick  = GetPlayerName(_source)
	local title        = "Wejścia na serwer"
	local color        = green
	local message      = "**".._sourceNick.."** dołączył na serwer"
	local source_info  = tostring(_source)
	local target_info  = false
	local embeds       = get_embed(title, color, message, source_info, target_info)
	PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
	local weebhook     = "https://discord.com/api/webhooks/"
	local _source      = source
	local _sourceNick  = get_nickname(_source)
	local title        = "Wyjście z serwera"
	local color        = red
	local message      = "**".._sourceNick.."** wyszedł z serwera z powodem **"..reason.."**"
	local source_info  = get_info(_source)
	local target_info  = false
	local embeds       = get_embed(title, color, message, source_info, target_info)
	PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
end)
 
RegisterNetEvent("kadet_discordlog:logs")
AddEventHandler("kadet_discordlog:logs", function (event ,value1 ,value2 ,value3 ,value4 ,value5 ,value6 ,value7 ,value8 ,value9 ,value10 ,value11 ,value12 ,value13 ,value14 ,value15 ,value16 ,value18 ,value19 ,value20)
	if event == "kill_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = source
		local _target      = value2
		local _sourceNick  = get_nickname(_source)
		local title        = "Zabójstwa"
		local color        = red
		local message      = "**".._sourceNick.."** "..value1
		local source_info  = get_info(_source)
		local target_info  = get_info(_target)
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "suicide_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = source
		local _sourceNick  = get_nickname(_source)
		local title        = "Samobójstwa"
		local color        = red
		local message      = "**".._sourceNick.."** "..value1
		local source_info  = get_info(_source)
		local target_info  = false
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "trunkIn_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _sourceNick  = get_nickname(_source)
		local title        = "Wsadzanie do bagażnika"
		local color        = blue
		local message      = "**".._sourceNick.."** wsadził do bagażnika **"..value2.." x"..value3.."**"
		local source_info  = get_info(_source)
		local target_info  = false
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "trunkOut_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _sourceNick  = get_nickname(_source)
		local title        = "Wyciaganie z bagażnika"
		local color        = blue
		local message      = "**".._sourceNick.."** wyciagnał z bagażnika **"..value2.." x"..value3.."**"
		local source_info  = get_info(_source)
		local target_info  = false
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })

	elseif event == "buyWeapon_log" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _sourceNick  = get_nickname(_source)
		local title        = "Kupno Broni (Legalny Sklep)"
		local color        = green
		local message      = "**".._sourceNick.."** kupił **"..value2.."** za **"..value3.."$**"
		local source_info  = get_info(_source)
		local target_info  = false
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "buyDarkWeapon_log" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _sourceNick  = get_nickname(_source)
		local title        = "Kupno Broni (Legalny Sklep)"
		local color        = red
		local message      = "**".._sourceNick.."** kupił **"..value2.."** w nielegalnym sklepie za **"..value3.."$**"
		local source_info  = get_info(_source)
		local target_info  = false
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "handcuffItem_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _target      = value2
		local _sourceNick  = get_nickname(_source)
		local _targetNick  = get_nickname(_target)
		local title        = "Przeszukiwanie Przedmioty"
		local color        = grey
		local message      = "**".._sourceNick.."** zabrał od **".._targetNick.."** "..value3.." **x"..value4.."**"
		local source_info  = get_info(_source)
		local target_info  = get_info(_target)
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })

	elseif event == "handcuffMoney_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _target      = value2
		local _sourceNick  = get_nickname(_source)
		local _targetNick  = get_nickname(_target)
		local title        = value3
		local color        = grey
		local message      = "**".._sourceNick.."** zabrał od **".._targetNick.."** "..value3.." **x"..value4.."**"
		local source_info  = get_info(_source)
		local target_info  = get_info(_target)
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
		
	elseif event == "handcuffWeapon_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _target      = value2
		local _sourceNick  = get_nickname(_source)
		local _targetNick  = get_nickname(_target)
		local title        = "Przeszukiwanie Broń"
		local color        = red
		local message      = "**".._sourceNick.."** zabrał od **".._targetNick.." "..value3.."** z amunicją **"..value4.."**"
		local source_info  = get_info(_source)
		local target_info  = get_info(_target)
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "report_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _sourceNick  = get_nickname(_source)
		local title        = "Zgłoszenia"
		local color        = 0xff0d0d
		local message      = "**".._sourceNick.."** napisał **"..value2.."**"
		local source_info  = get_info(_source)
		local target_info  = false
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "admin_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _sourceNick  = get_nickname(_source)
		local title        = "Admin LOG"
		local color        = 0xff0d0d
		local message      = "**".._sourceNick.."** napisał **"..value2.."**"
		local source_info  = get_info(_source)
		local target_info  = false
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "chat_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _sourceNick  = get_nickname(_source)
		local title        = "Chat"
		local color        = value3
		local message      = "**".._sourceNick.."** napisał **"..value2.."**"
		local source_info  = get_infoBypass(_source)
		local target_info  = false
		if source_info ~= nil then
			local embeds       = get_embed(title, color, message, source_info, target_info)
			PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
		end
	elseif event == "defibRevive_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = source
		local _target      = value1
		local _sourceNick  = get_nickname(_source)
		local _targetNick  = get_nickname(_target)
		local title        = "Podniszenie Defibrylatorem"
		local color        = red
		local message      = "**".._sourceNick.."** podniósł gracza **".._targetNick.."** przy pomocy **Defibrylatora**"
		local source_info  = get_info(_source)
		local target_info  = get_info(_target)
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "blacklist_weapon" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = source
		local _sourceNick  = get_nickname(_source)
		local title        = "Blacklist-Weapon"
		local color        = red
		local message      = "**".._sourceNick.."** miał przy sobie **"..value1.."**\n@everyone"
		local source_info  = get_info(_source)
		local target_info  = false
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "faktury" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _target      = value2
		local _sourceNick  = get_nickname(_source)
		local _targetNick  = get_nickname(_target)
		local title        = "Wystawianie Faktur"
		local color        = red
		local message      = "**".._sourceNick.."** wyswił fakturę dla **".._targetNick.." za "..value3.."** dla frakcji **"..value4.."** na kwotę **"..value5.."$**"
		local source_info  = get_info(_source)
		local target_info  = get_info(_target)
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "wyplacanie" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _sourceNick  = get_nickname(_source)
		local title        = "Wypłacanie z konta frakcji"
		local color        = red
		local message      = "**".._sourceNick.."** wypłacił z konta **"..value2.."** kwotę **"..value3.."**"
		local source_info  = get_info(_source)
		local target_info  = false
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "wplacanie" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _sourceNick  = get_nickname(_source)
		local title        = "Wpłacanie na konto frakcji"
		local color        = red
		local message      = "**".._sourceNick.."** wpłacił na konto **"..value2.."** kwotę **"..value3.."**"
		local source_info  = get_info(_source)
		local target_info  = false
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "przedmioty_przekazywanie" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _target      = value2
		local _sourceNick  = get_nickname(_source)
		local _targetNick  = get_nickname(_target)
		local title        = "Przedmioty przekazywanie"
		local color        = red
		local message      = "**".._sourceNick.."** przekazał dla gracza **".._targetNick.."** przedmiot **"..value3.."** w ilości **"..value4.."**"
		local source_info  = get_info(_source)
		local target_info  = get_info(_target)
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "przedmioty_gotowka" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _target      = value2
		local _sourceNick  = get_nickname(_source)
		local _targetNick  = get_nickname(_target)
		local title        = "Gotówka przekazywanie"
		local color        = red
		local message      = "**".._sourceNick.."** przekazał dla gracza **".._targetNick.."** gotówkę w ilości **"..value3.."$**"
		local source_info  = get_info(_source)
		local target_info  = get_info(_target)
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "przedmioty_gotowka_black" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _target      = value2
		local _sourceNick  = get_nickname(_source)
		local _targetNick  = get_nickname(_target)
		local title        = "Gotówka (brudna) przekazywanie"
		local color        = red
		local message      = "**".._sourceNick.."** przekazał dla gracza **".._targetNick.."** brudną gotówkę w ilości **"..value3.."$**"
		local source_info  = get_info(_source)
		local target_info  = get_info(_target)
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "przedmioty_bron" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _target      = value2
		local _sourceNick  = get_nickname(_source)
		local _targetNick  = get_nickname(_target)
		local title        = "Bronie przekazywanie"
		local color        = red
		local message      = "**".._sourceNick.."** przekazał dla gracza **".._targetNick.."** broń **"..value3.."** z amunicją **x"..value4.."**"
		local source_info  = get_info(_source)
		local target_info  = get_info(_target)
		local embeds       = get_embed(title, color, message, source_info, target_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "twitter_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local login      = value2
		local tweet      = value3
		local _sourceNick  = get_nickname(_source)
		local title        = "Nowy Tweet"
		local color        = blue
		local message      = "**".._sourceNick.."** Napisał/a Tweeta **"..tweet.."** z konta **"..login.."**"
		local source_info  = get_info(_source)
		local embeds       = get_embed(title, color, message, source_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "police_garage_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local plate      = value2
		local state      = value3
		local _sourceNick  = get_nickname(_source)
		local title        = "Akcja Garażu LSPD"
		local color        = blue
		local message      = "**".._sourceNick.."** "
		if state == 'garage_police' then
			message = message.." Schował/a pojazd **"..plate.."** do garażu policyjnego."
			else
			message = message.." Wyjął/ęła pojazd **"..plate.."** z garażu policyjnego."
		end
		local source_info  = get_info(_source)
		local embeds       = get_embed(title, color, message, source_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "police_impound_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local plate      = value2
		local _sourceNick  = get_nickname(_source)
		local title        = "Akcja Garażu Policyjnego"
		local color        = blue
		local message      = "**".._sourceNick.."** ".." Wyjął/ęła pojazd **"..plate.."** z parkingu policyjnego."
		local source_info  = get_info(_source)
		local embeds       = get_embed(title, color, message, source_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "residence_stash" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _action      = value2
		local _item        = value3
		local _count       = value4
		local _sourceNick  = get_nickname(_source)
		local title        = "Szafki w rezydencjach"
		local color        = blue
		local message      = "**".._sourceNick.."** ".._action.."** szafki w rezydencji przedmiot ".._item.." w ilości ".._count
		local source_info  = get_info(_source)
		local embeds       = get_embed(title, color, message, source_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "society_stash" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _action      = value2
		local _item        = value3
		local _count       = value4
		local _society     = value5
		local _sourceNick  = get_nickname(_source)
		local title        = "Szafki w organizacjach/biiznesach"
		local color        = blue
		local message      = "**".._sourceNick.."** ".._action.."** szafki organizacji ".._society.." przedmiot ".._item.." w ilości ".._count
		local source_info  = get_info(_source)
		local embeds       = get_embed(title, color, message, source_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "darkchat" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _text        = value2
		local _cat         = value3
		local _sourceNick  = get_nickname(_source)
		local title        = "Darkchat"
		local color        = blue
		local message      = "**".._sourceNick.."** napisał/a: ".._text.." w kategorii ".._cat
		local source_info  = get_info(_source)
		local embeds       = get_embed(title, color, message, source_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "darkmarket" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _title       = value2
		local _sourceNick  = get_nickname(_source)
		local title        = "Darkchat"
		local color        = blue
		local message      = "**".._sourceNick.."** napisał/a ogłoszenie: ".._title
		local source_info  = get_info(_source)
		local embeds       = get_embed(title, color, message, source_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "vehicle_shop_logs" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _label       = value2
		local _plate       = value3
		local _price       = value4
		local _sourceNick  = get_nickname(_source)
		local title        = "Kupno pojazdu"
		local color        = blue
		local message      = "**".._sourceNick.."** kupił/a pojazd **".._label.."** o numerach **".._plate.."** za **".._price.."$**"
		local source_info  = get_info(_source)
		local embeds       = get_embed(title, color, message, source_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "casino_roulette" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _text        = value2
		local _sourceNick  = get_nickname(_source)
		local title        = "Ruletka"
		local color        = blue
		local message      = "**".._sourceNick.."** ".._text
		local source_info  = get_info(_source)
		local embeds       = get_embed(title, color, message, source_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "casino_blackjack" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _text        = value2
		local _sourceNick  = get_nickname(_source)
		local title        = "Blackjack"
		local color        = blue
		local message      = "**".._sourceNick.."** ".._text
		local source_info  = get_info(_source)
		local embeds       = get_embed(title, color, message, source_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	elseif event == "casino_slots" then
		local weebhook     = "https://discord.com/api/webhooks/"
		local _source      = value1
		local _text        = value2
		local _sourceNick  = get_nickname(_source)
		local title        = "Sloty"
		local color        = blue
		local message      = "**".._sourceNick.."** ".._text
		local source_info  = get_info(_source)
		local embeds       = get_embed(title, color, message, source_info)
		PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
	else
		print("[^DISCORD^7] Brak funkcji dla eventu ^2"..tostring(event).."^7")
	end
end)

-- PRZECHWYTYWANIE CHATU

AddEventHandler('chatMessage', function(author, color, message)
	local _source = author
	local color = nil
	local prefix = string.sub(message, 1, 3)
	if prefix == '/me' then
		color = 0xf157ff
		TriggerEvent("kadet_discordlog:logs", "chat_logs", _source, message, color)
	elseif prefix == '/do' then
		color = 0x465be3
		TriggerEvent("kadet_discordlog:logs", "chat_logs", _source, message, color)
	elseif prefix == '/ad' then
		color = 0xf0c400
		TriggerEvent("kadet_discordlog:logs", "chat_logs", _source, message, color)
	elseif prefix == '/twt' then
		color = 0xf0c400
		TriggerEvent("kadet_discordlog:logs", "chat_logs", _source, message, color)
	else
		prefix = string.sub(message, 1, 7)
		if prefix == '/report' then
			color = 0xe34646
			TriggerEvent("kadet_discordlog:logs", "report_logs", _source, message)
		else
			prefix = string.sub(message, 1, 6)
			if prefix == '/reply' then
				color = 0xff0d0d
				TriggerEvent("kadet_discordlog:logs", "admin_logs", _source, message)
			else
				prefix = string.sub(message, 1, 5)
				if prefix == '/kick' then
					color = 0xff0d0d
					TriggerEvent("kadet_discordlog:logs", "admin_logs", _source, message)
				else
					prefix = string.sub(message, 1, 1)
					if prefix == '/' then
						color = 0x00fffb
						TriggerEvent("kadet_discordlog:logs", "chat_logs", _source, message, color)
					else
						color = grey
						TriggerEvent("kadet_discordlog:logs", "chat_logs", _source, message, color)
					end
				end
			end
		end
	end
end)

-- FUNKCJE DO POBIERANIA DANYCH

function get_embed(title, color, message, source_info, target_info)
	local embeds = nil
		if target_info == false or target_info == nil then
			embeds = {
				{
					["title"]               = title,
					["type"]                = "rich",
					["color"]               = color,
					["description"]         = message,
					["footer"] = {
						["text"]            = get_time(),
						["icon_url"]        = avatar,
					},
					["fields"] = {
						{
							["name"]        = "Wykonawca",
							["value"]       = source_info,
							["inline"]      = true,
						}
					}
				}
			}
		else
			embeds = {
				{
					["title"]               = title,
					["type"]                = "rich",
					["color"]               = color,
					["description"]         = message,
					["footer"] = {
						["text"]            = get_time(),
						["icon_url"]        = avatar,
					},
					["fields"] = {
						{
							["name"]        = "Wykonawca",
							["value"]       = source_info,
							["inline"]      = true,
						},
						{
							["name"]        = 'Druga osoba',
							["value"]       = target_info,
							["inline"]      = true,
						},
					}
				}
			}
		end
	if embeds == nil then
		embeds = "Błąd pobierania danych"
	end
	return embeds
end

function get_discord(player)
	local discordID = nil
	local _player = player
    for k,value in pairs(GetPlayerIdentifiers(_player))do   
        if string.sub(value, 1, string.len("discord:")) == "discord:" then
            discordID = value
        end
    end
    if not discordID then
    	discordID = "BRAK"
    end
    local discordID = string.gsub(discordID, "discord:", "")
    return discordID
end

function get_steam(player)
	local steamHEX = nil
	local _player = player
    for k,value in pairs(GetPlayerIdentifiers(_player))do   
        if string.sub(value, 1, string.len("steam:")) == "steam:" then
            steamHEX = value
        end
    end
    if not steamHEX then
    	steamHEX = "BRAK"
    end
    return steamHEX
end

function get_nickname(player)
	local nick_name = nil
	local _player = player
	local nick_name = GetPlayerName(_player)
	if nick_name == nil then
		nick_name = "BRAK"
	end
	return nick_name
end

function get_playerIP(player)
	local playerIP = nil
	local _player = player
	local playerIP = GetPlayerEndpoint(_player)
	if playerIP == nil then
		playerIP = "BRAK"
	end
    return playerIP
end

function get_time()
	local czas = os.date( "%H:%M:%S - %d/%m/%Y")
    return czas
end
function get_info(player)
	local player_info = nil
	local _player = player
	if ip == true then
		player_info = "<@"..get_discord(_player)..">```Nick: "..get_nickname(_player).."\nID: ".._player.."\nDISCORD: "..get_discord(_player).."\nSTEAM: "..get_steam(_player).."\nIP: "..get_playerIP(_player).."```"
	else
		player_info = "<@"..get_discord(_player)..">```Nick: "..get_nickname(_player).."\nID: ".._player.."\nDISCORD: "..get_discord(_player).."\nSTEAM: "..get_steam(_player).."```"
	end
	if player_info == nil then
		player_info = "BRAK"
	end
	return player_info
end
function get_infoBypass(player)
	local player_info = nil
	local _player = player
	if get_steam(_player) ~= 'steam:' and get_discord(_player) ~= 'discord:' then
		if ip == true then
			player_info = "<@"..get_discord(_player)..">```Nick: "..get_nickname(_player).."\nID: ".._player.."\nDISCORD: "..get_discord(_player).."\nSTEAM: "..get_steam(_player).."\nIP: "..get_playerIP(_player).."```"
		else
			player_info = "<@"..get_discord(_player)..">```Nick: "..get_nickname(_player).."\nID: ".._player.."\nDISCORD: "..get_discord(_player).."\nSTEAM: "..get_steam(_player).."```"
		end
		if player_info == nil then
			player_info = "BRAK"
		end
	end
	return player_info
end

function get_info_min(player)
	local player_info = nil
	local _player = player
	local player_info = "<@"..get_discord(_player)..">```Nick: "..get_nickname(_player).."\nID: ".._player.."\nDISCORD: "..get_discord(_player).."\n```"
	if player_info == nil then
		player_info = "BRAK"
	end
	return player_info
end

function sendToDiscordUruchom(text)
	local weebhook = "https://discord.com/api/webhooks/"
	local embeds = {
		{
			["title"]= tostring(text),
			["type"]="rich",
			["color"] =0xFF2929,
		}
	}
	PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({ username = 'BlueSideRP.pl',embeds = embeds,avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
end

if sendStart then sendToDiscordUruchom('Serwer **BlueSide** został uruchomiony!\n\n*Ale fajnie! Cały chat tylko dla mnie!*') end

RegisterNetEvent('kadet_discord:generalWebhook')
AddEventHandler('kadet_discord:generalWebhook', function(text)
	print(text)
	--sendToDiscordUruchom(text)
end)

-- kadeciok#1234
-- nie usuwaj tego!