copholster_enabled = true -- Global value

local weapon_hash = GetHashKey("weapon_combatpistol")
local male_ped = GetHashKey("mp_m_freemode_01")
local female_ped = GetHashKey("mp_f_freemode_01")
-- accessories: no-holster = 15, holster = 130

function table_invert(t)
	 local s={}
	 for k,v in pairs(t) do
		 s[v]=k
	 end
	 return s
end

local m_holsters = { [1] = 3, [6] = 5, [8] = 2, [42] = 43, [110] = 111, [119] = 120 } -- [in holster] = out holster
local f_holsters = { [1] = 3, [6] = 5, [8] = 2, [29] = 30, [81] = 82}
 -- Maps holster with gun to the drawable without

local m_empty_holsters = table_invert(m_holsters) -- Inverse table
local f_empty_holsters = table_invert(f_holsters)

local holsters = { [male_ped] = m_holsters, [female_ped] = f_holsters}
local empty_holsters = { [male_ped] = m_empty_holsters, [female_ped] = f_empty_holsters}

Citizen.CreateThread(function()
	while true do
		if copholster_enabled then
			local ped = GetPlayerPed(-1)
			local ped_hash = GetEntityModel(ped)
			if contains(holsters, ped_hash) and contains (empty_holsters, ped_hash) then
				local holster = GetPedDrawableVariation(ped, 7)
				local holster_texture = GetPedTextureVariation(ped, 7)
				local ped_holsters = holsters[ped_hash]
				local ped_empty_holsters = empty_holsters[ped_hash]

				if GetSelectedPedWeapon(ped) == weapon_hash then
					if contains(ped_holsters, holster) then
						SetPedComponentVariation(ped, 7, ped_holsters[holster], holster_texture, 0)
					end
				else
					if contains(ped_empty_holsters, holster) then
						SetPedComponentVariation(ped, 7, ped_empty_holsters[holster], holster_texture, 0)
					end
				end
			end
		end
		Citizen.Wait(0)
	end
end)

RegisterCommand("copholster", function(source, args)
	local subcommand = args[1]

	if subcommand ~= nil then
		if subcommand == "enable" then
			copholster_enabled = true
			drawNotification("~p~Cop holster enabled.")
		elseif subcommand == "disable" then
			copholster_enabled = false
			drawNotification("~p~Cop holster disabled.")
		end
	end
end)

function contains(set, key)
	return set[key] ~= nil
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end
