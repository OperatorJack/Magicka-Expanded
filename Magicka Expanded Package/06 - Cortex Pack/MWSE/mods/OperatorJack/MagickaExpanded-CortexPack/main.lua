local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

require("OperatorJack.MagickaExpanded-CortexPack.effects.cloneEffect")
require("OperatorJack.MagickaExpanded-CortexPack.effects.mindScanEffect")
require("OperatorJack.MagickaExpanded-CortexPack.effects.mindRipEffect")
require("OperatorJack.MagickaExpanded-CortexPack.effects.soulScryeEffect")
require("OperatorJack.MagickaExpanded-CortexPack.effects.coalesceEffect")

local spellIds = {
  clone = "OJ_ME_Clone",
  mindScan = "OJ_ME_MindScan",
  mindRip = "OJ_ME_MindRip",
  soulScrye = "OJ_ME_SoulScrye",
  coalesce = "OJ_ME_Coalesce"
}

local tomes = {
  {
    id = "OJ_ME_TomeClone",
    spellId = spellIds.clone
  },
  {
    id = "OJ_ME_TomeMindScan",
    spellId = spellIds.mindScan
  },
  {
    id = "OJ_ME_TomeMindRip",
    spellId = spellIds.mindRip
  },
  {
    id = "OJ_ME_TomeSoulScrye",
    spellId = spellIds.soulScrye
  },
  {
    id = "OJ_ME_TomeCoalesce",
    spellId = spellIds.coalesce
  }
}

local function registerSpells()
  framework.spells.createBasicSpell({
    id = spellIds.clone,
    name = "Clone",
    effect = tes3.effect.clone,
    range = tes3.effectRange.target,
    duration = 10,
    min = 10,
    max = 30
  })

  framework.spells.createBasicSpell({
    id = spellIds.mindScan,
    name = "Vondakir's Insight",
    effect = tes3.effect.mindScan,
    range = tes3.effectRange.self,
    duration = 10,
  })

  framework.spells.createBasicSpell({
    id = spellIds.mindRip,
    name = "Vondakir's Intrusion",
    effect = tes3.effect.mindRip,
    range = tes3.effectRange.touch
  })

  framework.spells.createBasicSpell({
    id = spellIds.soulScrye,
    name = "Vondakir's Scrutiny",
    effect = tes3.effect.soulScrye,
    range = tes3.effectRange.self,
    duration = 10,
  })

  framework.spells.createBasicSpell({
    id = spellIds.coalesce,
    name = "Coalesce",
    effect = tes3.effect.coalesce,
    range = tes3.effectRange.target
  })
  
  framework.tomes.registerTomes(tomes)
end

event.register("MagickaExpanded:Register", registerSpells)