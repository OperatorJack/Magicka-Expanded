local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

require("OperatorJack.MagickaExpanded-LoreFriendlyPack.effects.banishDaedraEffect")
require("OperatorJack.MagickaExpanded-LoreFriendlyPack.effects.basicBoundWeaponEffects")
require("OperatorJack.MagickaExpanded-LoreFriendlyPack.effects.basicBoundArmorEffects")
require("OperatorJack.MagickaExpanded-LoreFriendlyPack.effects.darknessEffect")

local spellIds = {
  banishDaedra = "OJ_ME_BanishDaedraSpell",
  veilOfDarkness = "OJ_ME_DarknessSpell",
  boundGreaves = "OJ_ME_BoundGreavesSpell",
  boundPauldrons = "OJ_ME_BoundPauldronsSpell",
  boundClaymore = "OJ_ME_BoundClaymoreSpell",
  boundClub = "OJ_ME_BoundClubSpell",
  boundDaiKatana = "OJ_ME_BoundDaiKatanaSpell",
  boundKatana = "OJ_ME_BoundKatanaSpell",
  boundShortSword = "OJ_ME_BoundShortswordSpell",
  boundStaff = "OJ_ME_BoundStaffSpell",
  boundTanto = "OJ_ME_BoundTantoSpell",
  boundWakizashi = "OJ_ME_BoundWakizashiSpell",
  boundWarAxe = "OJ_ME_BoundWarAxeSpell",
  boundWarhammer = "OJ_ME_BoundWarhammerSpell"
}

local tomes = {
  [1] = {
    id = "OJ_ME_TomeBanishDaedra",
    spellId = spellIds.banishDaedra
  }, 
  [2] = {
    id = "OJ_ME_TomeDarkness",
    spellId = spellIds.veilOfDarkness
  }, 
  [3] = {
    id = "OJ_ME_TomeBoundGreaves",
    spellId = spellIds.boundGreaves
  }, 
  [4] = {
    id = "OJ_ME_TomeBoundPauldrons",
    spellId = spellIds.boundPauldrons
  }, 
  [5] = {
    id = "OJ_ME_TomeBoundClaymore",
    spellId = spellIds.boundClaymore
  }, 
  [6] = {
    id = "OJ_ME_TomeBoundClub",
    spellId = spellIds.boundClub
  }, 
  [7] = {
    id = "OJ_ME_TomeBoundDaiKatana",
    spellId = spellIds.boundDaiKatana
  }, 
  [8] = {
    id = "OJ_ME_TomeBoundKatana",
    spellId = spellIds.boundKatana
  }, 
  [9] = {
    id = "OJ_ME_TomeBoundShortsword",
    spellId = spellIds.boundShortSword
  }, 
  [10] = {
    id = "OJ_ME_TomeBoundStaff",
    spellId = spellIds.boundStaff
  }, 
  [11] = {
    id = "OJ_ME_TomeBoundTanto",
    spellId = spellIds.boundTanto
  }, 
  [12] = {
    id = "OJ_ME_TomeBoundWakizashi",
    spellId = spellIds.boundWakizashi
  }, 
  [13] = {
    id = "OJ_ME_TomeBoundWaraxe",
    spellId = spellIds.boundWarAxe
  }, 
  [14] = {
    id = "OJ_ME_TomeBoundWarhammer",
    spellId = spellIds.boundWarhammer
  }, 
}

local function registerSpells()
	framework.spells.createBasicSpell({
    id = spellIds.banishDaedra,
    name = "Banish Daedra",
    effect = tes3.effect.banishDaedra,
    range = tes3.effectRange.touch,
    min = 30,
    max = 50
  })
	framework.spells.createBasicSpell({
    id = spellIds.veilOfDarkness,
    name = "Veil of Darkness",
    effect = tes3.effect.darkness,
    range = tes3.effectRange.target,
    duration = 10
  })
  framework.spells.createBasicSpell({
    id = spellIds.boundGreaves,
    name = "Bound Greaves",
    effect = tes3.effect.boundGreaves,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createComplexSpell({
    id = spellIds.boundPauldrons,
    name = "Bound Pauldrons",
    effects =
      {
        [1] = {
          id =tes3.effect.boundLeftPauldron,
          range = tes3.effectRange.self,
          duration = 30
        },
        [2] = {
          id =tes3.effect.boundRightPauldron,
          range = tes3.effectRange.self,
          duration = 30
        }
      }
  })
  framework.spells.createBasicSpell({
    id = spellIds.boundClaymore,
    name = "Bound Claymore",
    effect = tes3.effect.boundClaymore,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.boundClub,
    name = "Bound Club",
    effect = tes3.effect.boundClub,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.boundDaiKatana,
    name = "Bound Dai-Katana",
    effect = tes3.effect.boundDaiKatana,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.boundKatana,
    name = "Bound Katana",
    effect = tes3.effect.boundKatana,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.boundShortSword,
    name = "Bound Shortsword",
    effect = tes3.effect.boundShortSword,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.boundStaff,
    name = "Bound Staff",
    effect = tes3.effect.boundStaff,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.boundTanto,
    name = "Bound Tanto",
    effect = tes3.effect.boundTanto,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.boundWakizashi,
    name = "Bound Wakizashi",
    effect = tes3.effect.boundWakizashi,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.boundWarAxe,
    name = "Bound War Axe",
    effect = tes3.effect.boundWarAxe,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.boundWarhammer,
    name = "Bound Warhammer",
    effect = tes3.effect.boundWarhammer,
    range = tes3.effectRange.self,
    duration = 30
  })

  framework.tomes.registerTomes(tomes)
end

event.register("MagickaExpanded:Register", registerSpells)