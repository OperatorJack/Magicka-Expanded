local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

require("OperatorJack.MagickaExpanded-SummoningPack.effects.basicSummonEffects")

local spellIds = {
  warDurzog = "OJ_ME_SummonWarDurzogSpell",
  goblinGrunt = "OJ_ME_SummonGoblinGruntSpell",
  goblinOfficer = "OJ_ME_SummonGoblinOfficerSpell",
  goblinWarchief = "OJ_ME_SummonGoblinWarchiefSpell"
}

local grimoires = {
  [1] = { 
    id = "OJ_ME_GrimoireAsh", 
    spellIds = {
      [1] = spellIds.warDurzog,
      [2] = spellIds.goblinGrunt,
      [3] = spellIds.goblinOfficer,
      [4] = spellIds.goblinWarchief,
    }
  },
}

local tomes = {
  [1] = {
    id = "OJ_ME_TomeHulkingFabricant",
    spellId = "OJ_ME_SummonHulkingFabricantSpell"
  }
}

local function registerSpells()
  framework.spells.createBasicSpell({
    id = spellIds.warDurzog,
    name = "Summon War Durzog",
    effect = tes3.effect.summonWarDurzog,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.goblinGrunt,
    name = "Summon Goblin",
    effect = tes3.effect.summonGoblinGrunt,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.goblinOfficer,
    name = "Summon Goblin Officer",
    effect = tes3.effect.summonGoblinOfficer,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.goblinWarchief,
    name = "Summon Goblin Warchief",
    effect = tes3.effect.summonGoblinWarchief,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = "OJ_ME_SummonHulkingFabricantSpell",
    name = "Summon Hulking Fabricant",
    effect = tes3.effect.summonHulkingFabricant,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = "OJ_ME_SummonImperfectSpell",
    name = "Summon Imperfect",
    effect = tes3.effect.summonImperfect,
    range = tes3.effectRange.self,
    duration = 15
  })
  framework.spells.createBasicSpell({
    id = "OJ_ME_SummonAscendedSleeperSpell",
    name = "Summon Ascended Sleeper",
    effect = tes3.effect.summonAscendedSleeper,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = "OJ_ME_SummonDraugrSpell",
    name = "Summon Draugr",
    effect = tes3.effect.summonDraugr,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = "OJ_ME_SummonLichSpell",
    name = "Summon Lich",
    effect = tes3.effect.summonLich,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = "OJ_ME_SummonOgrimSpell",
    name = "Summon Ogrim",
    effect = tes3.effect.summonOgrim,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = "OJ_ME_SummonSprigganSpell",
    name = "Summon Spriggan",
    effect = tes3.effect.summonSpriggan,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = "OJ_ME_SummonCenturionSteamSpell",
    name = "Summon Steam Centurion",
    effect = tes3.effect.summonCenturionSteam,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = "OJ_ME_SummonCenturionProjectileSpell",
    name = "Summon Centurion Archer",
    effect = tes3.effect.summonCenturionProjectile,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = "OJ_ME_SummonCenturionSpiderSpell",
    name = "Summon Centurion Spider",
    effect = tes3.effect.summonCenturionSpider,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = "OJ_ME_SummonAshGhoulSpell",
    name = "Summon Ash Ghoul",
    effect = tes3.effect.summonAshGhoul,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = "OJ_ME_SummonAshZombieSpell",
    name = "Summon Ash Zombie",
    effect = tes3.effect.summonAshZombie,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = "OJ_ME_SummonAshSlaveSpell",
    name = "Summon Ash Slave",
    effect = tes3.effect.summonAshSlave,
    range = tes3.effectRange.self,
    duration = 30
  })

  framework.grimoires.registerGrimoire(grimoires)
  framework.tomes.registerTomes(tomes)
end

event.register("MagickaExpanded:Register", registerSpells)