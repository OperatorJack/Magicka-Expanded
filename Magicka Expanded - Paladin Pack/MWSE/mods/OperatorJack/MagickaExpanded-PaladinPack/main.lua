local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

require("OperatorJack.MagickaExpanded-PaladinPack.effects.lightDamageEffect")

local spellIds = {
  stendarrsAura = "OJ_ME_StendarrsAuraSpell",
  stendarrsTouch = "OJ_ME_StendarrsTouchSpell"
}

local tomes = {
  {
    id = "OJ_ME_TomeStendarrsAura",
    spellId = spellIds.stendarrsAura
  },
  {
    id = "OJ_ME_TomeStendarrsTouch",
    spellId = spellIds.stendarrsTouch
  }
}

local function registerSpells()
  framework.spells.createBasicSpell({
    id = spellIds.stendarrsAura,
    name = "Stendarr's Aura",
    effect = tes3.effect.lightDamage,
    range = tes3.effectRange.target,
    min = 10,
    max = 10,
    duration = 60,
    radius = 10
  })
  framework.spells.createBasicSpell({
    id = spellIds.stendarrsTouch,
    name = "Stendarr's Touch",
    effect = tes3.effect.lightDamage,
    range = tes3.effectRange.touch,
    min = 10,
    max = 50
  })
  
  framework.tomes.registerTomes(tomes)
end

event.register("MagickaExpanded:Register", registerSpells)