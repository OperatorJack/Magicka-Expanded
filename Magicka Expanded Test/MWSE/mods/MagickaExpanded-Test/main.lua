local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")
if (framework == nil) then
    local function warning()
        tes3.messageBox(
            "[TEST ERROR] Magicka Expanded framework is not installed!"
            .. " You will need to install it to use this mod."
        )
    end
    event.register("initialized", warning)
    event.register("loaded", warning)
    return
end

-- Add spells to player. --
local function loaded()
    framework.common.addTestSpellsToPlayer()
    
    tes3.messageBox("Magicka Expanded: Added all currently loaded spells to player.")
end
event.register("loaded", loaded)


-- Register Spells --
local function registerSpells()
    return
end
  
 event.register("MagickaExpanded:Register", registerSpells)