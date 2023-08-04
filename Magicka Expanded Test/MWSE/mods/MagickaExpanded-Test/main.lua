local framework = require("OperatorJack.MagickaExpanded")
if (framework == nil) then
    local function warning()
        tes3.messageBox(
            "[TEST ERROR] Magicka Expanded framework is not installed!" ..
                " You will need to install it to use this mod.")
    end
    event.register(tes3.event.initialized, warning)
    event.register(tes3.event.loaded, warning)
    return
end

-- Add spells to player. --
local function addTestSpells(e)
    framework.functions.addSpellsToPlayer()
    tes3.messageBox(
        "Magicka Expanded: Added all currently loaded spells to player.")
end

-- Filter by the scan code to get Z key presses only.
event.register(tes3.event.keyDown, addTestSpells, {filter = tes3.scanCode.z})
