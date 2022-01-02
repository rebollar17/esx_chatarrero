ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_chatarrero:activateService', 'chatarrero', Config.MaxInService)
end

TriggerEvent('esx_society:registerSociety', 'chatarrero', 'chatarrero', 'society_chatarrero', 'society_chatarrero', 'society_chatarrero', {type = 'private'})

if GetCurrentResourceName() == 'esx_chatarrero' then
    ESX.RegisterServerCallback('esx_chatarrero:anycops',function(source, cb)
        local anycops = 0
        local playerList = GetPlayers()
        for i=1, #playerList, 1 do
            local _source = playerList[i]
            local xPlayer = ESX.GetPlayerFromId(_source)
            local playerjob = xPlayer.job.name
            if playerjob == 'police' then
                anycops = anycops + 1
            end
        end
        cb(anycops)
    end)
end

	RegisterServerEvent('esx_chatarrero:puerta')
    AddEventHandler('esx_chatarrero:puerta', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('puerta')
	math.randomseed(GetGameTimer())

	    xPlayer.addInventoryItem('puerta',math.random(0, 1))

end)    

RegisterServerEvent('esx_chatarrero:puerta2')
AddEventHandler('esx_chatarrero:puerta2', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('puerta')
	math.randomseed(GetGameTimer())

        xPlayer.addInventoryItem('puerta',math.random(0, 1))

end)

RegisterServerEvent('esx_chatarrero:moto')
AddEventHandler('esx_chatarrero:moto', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('bateria')
	local xItem1 = xPlayer.getInventoryItem('llanta')
	local xItem2 = xPlayer.getInventoryItem('radio')

	math.randomseed(GetGameTimer())

        xPlayer.addInventoryItem('bateria',math.random(0, 1))

        xPlayer.addInventoryItem('llanta',math.random(0, 2))
	
        xPlayer.addInventoryItem('radio',math.random(0, 1))
end)

RegisterServerEvent('esx_chatarrero:capo')
AddEventHandler('esx_chatarrero:capo', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('capo')
	math.randomseed(GetGameTimer())
	local percent = math.random(1, 10)

        xPlayer.addInventoryItem('capo',math.random(0, 1))

end)

RegisterServerEvent('esx_chatarrero:piezas')
AddEventHandler('esx_chatarrero:piezas', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('bateria')
	local xItem1 = xPlayer.getInventoryItem('airbag')
	local xItem2 = xPlayer.getInventoryItem('radio')

	math.randomseed(GetGameTimer())
		local percent = math.random(1, 10)

        xPlayer.addInventoryItem('bateria',math.random(0, 1))

        xPlayer.addInventoryItem('airbag',math.random(0, 2))

        xPlayer.addInventoryItem('radio',math.random(0, 1))

end)



RegisterServerEvent('esx_chatarrero:llanta')
AddEventHandler('esx_chatarrero:llanta', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('llanta')
	math.randomseed(GetGameTimer())

		xPlayer.addInventoryItem('llanta',math.random(0, 2))

	
end)


RegisterServerEvent('chopNotify')
AddEventHandler('chopNotify', function()
        TriggerClientEvent("chopEnable", source)
    end)


RegisterServerEvent('ChopInProgress')
AddEventHandler('ChopInProgress', function()
        TriggerClientEvent("outlawChopNotify", -1, "")
    end)

RegisterServerEvent('ChoppingInProgressPos')
AddEventHandler('ChoppingInProgressPos', function(gx, gy, gz)
        TriggerClientEvent('Choplocation', -1, gx, gy, gz)
    end)


RegisterServerEvent('esx_chatarrero:sell')
AddEventHandler('esx_chatarrero:sell', function(itemName, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        local price = Config.Itemsprice[itemName]
        local xItem = xPlayer.getInventoryItem(itemName)


    if xItem.count < amount then
            TriggerClientEvent('esx:showNotification', source, _U('not_enough'))
            return
    end

        price = ESX.Math.Round(price * amount)

        if Config.GiveBlack then
            xPlayer.addAccountMoney('black_money', price)
        else
            xPlayer.addMoney(price)
        end

        xPlayer.removeInventoryItem(xItem.name, amount)

        TriggerClientEvent('esx:showNotification', source, _U('sold', amount, xItem.label, ESX.Math.GroupDigits(price)))
    end)