local default_weapon = GetHashKey('weapon_combatpistol') -- The weapon that the script looks for if one isn't specified for a holster, this is the glock.
--local config = config -- Save configuration from global scope here
local enabled = false
local ped = nil -- Cache the ped
local currentPedData = nil -- Config data for the current ped

-- Helper function to invert tables
function table_invert(t)
  local s={}
  for k,v in pairs(t) do
    s[v]=k
  end
  return s
end



-- Slow loop to determine the player ped and if it is of interest to the algorithm
-- This only needs to be run every 5 seconds or so, as ped changes are infrequent
Citizen.CreateThread(function()
  while true do
    ped = GetPlayerPed(-1)
    local ped_hash = GetEntityModel(ped)
    local enable = false -- We updated the 'enabled' variable in the upper scope with this at the end
    -- Loop over peds in the config
    for ped, data in pairs(config) do
      if GetHashKey(ped) == ped_hash then 
        enable = true -- We now want to make sure that 'enabled' will be true
        currentPedData = data
        break
      end
    end
    enabled = enable
    Citizen.Wait(5000)
  end
end)

-- Faster loop to change holster textures
local last_weapon = nil -- Variable used to save the weapon from the last tick
Citizen.CreateThread(function()
  while true do
    if enabled then -- A ped in the config is in use, so we start checking
      current_weapon = GetSelectedPedWeapon(ped)
      if current_weapon ~= last_weapon then -- The weapon in hand has changed, so we need to check for holsters
        Citizen.Trace('The weapon has changed!')
        
        for component, holsters in pairs(currentPedData.variations) do
          local holsterDrawable = GetPedDrawableVariation(ped, component)
          local holsterTexture = GetPedTextureVariation(ped, component)

          local emptyHolster = holsters[holsterDrawable] -- The corresponding empty holster
          if emptyHolster then
            if current_weapon == default_weapon then
              Citizen.Trace('unholstered')
              SetPedComponentVariation(ped, component, emptyHolster, holsterTexture, 0)
            end
            break
          end

          local filledHolster = table_invert(holsters)[holsterDrawable]
          if filledHolster then
            if current_weapon ~= default_weapon and last_weapon == default_weapon then -- The gun needs to be put back in the holster
              Citizen.Trace('holstered')
              SetPedComponentVariation(ped, component, filledHolster, holsterTexture, 0)
            end
            break
          end

        end
      end
      last_weapon = current_weapon
    end
    Citizen.Wait(200)
  end
end)
