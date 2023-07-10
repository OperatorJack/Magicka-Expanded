local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")
if (framework == nil) then
    local function warning()
        tes3.messageBox(
            "[TEST ERROR] Magicka Expanded framework is not installed!" ..
                " You will need to install it to use this mod.")
    end
    event.register("initialized", warning)
    event.register("loaded", warning)
    return
end

-- Add spells to player. --
function addTestSpells(e)
    framework.functions.addSpellsToPlayer()
    tes3.messageBox(
        "Magicka Expanded: Added all currently loaded spells to player.")
end

-- Filter by the scan code to get Z key presses only.
event.register("keyDown", addTestSpells, {filter = tes3.scanCode.z})
