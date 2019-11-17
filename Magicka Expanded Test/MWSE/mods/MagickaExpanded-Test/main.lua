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

-- Register Spells --
local function registerSpells()
	framework.enchantments.createBasicEnchantment({
	id = "OJ_ME_T_Enchantment",
	effect = tes3.effect.mindRip,
	range = tes3.effectRange.target,
	chargeCost = 50,
	maxCharge = 100,
	castType = tes3.enchantmentType.onUse
	})
end
  
 event.register("MagickaExpanded:Register", registerSpells)