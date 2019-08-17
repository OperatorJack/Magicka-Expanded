local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

require("OperatorJack.MagickaExpanded-DAndDPack.effects.blinkEffect")

local spellIds = {
  blink = "OJ_ME_BlinkSpell"
}

local tomes = {
  [1] = {
    id = "OJ_ME_TomeBlink",
    spellId = spellIds.blink
  },
}

local function registerSpells()
  framework.spells.createBasicSpell({
    id = spellIds.blink,
    name = "Blink",
    effect = tes3.effect.blink,
    range = tes3.effectRange.target
  })
  
  framework.tomes.registerTomes(tomes)
end

event.register("MagickaExpanded:Register", registerSpells)