local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

require("OperatorJack.MagickaExpanded-SummoningPack.effects.basicSummonEffects")

local spellIds = {
  warDurzog = "OJ_ME_SummWarDurzogSpell",
  goblinGrunt = "OJ_ME_SummGoblinGruntSpell",
  goblinOfficer = "OJ_ME_SummGoblinOfficerSpell",
  goblinWarchief = "OJ_ME_SummGoblinWarchiefSpell",
  hulkingFabricant = "OJ_ME_SummHulkingFabSpell",
  imperfect = "OJ_ME_SummImperfectSpell",
  ascendedSleeper = "OJ_ME_SummAscendedSleeperSpell",
  ashGhoul = "OJ_ME_SummAshGhoulSpell",
  ashZombie = "OJ_ME_SummAshZombieSpell",
  ashSlave = "OJ_ME_SummAshSlaveSpell",
  draugr = "OJ_ME_SummDraugrSpell",
  lich = "OJ_ME_SummLichSpell",
  ogrim = "OJ_ME_SummOgrimSpell",
  spriggran = "OJ_ME_SummSprigganSpell",
  centurionSteam = "OJ_ME_SummCenturionSteamSpell",
  centurionArcher = "OJ_ME_SummCenturionArcherSpell",
  centurionSpider = "OJ_ME_SummCenturionSpiderSpell"
}

local grimoires = {
  [1] = { 
    id = "OJ_ME_GrimoireSummGoblin", 
    spellIds = {
      [1] = spellIds.warDurzog,
      [2] = spellIds.goblinGrunt,
      [3] = spellIds.goblinOfficer,
      [4] = spellIds.goblinWarchief,
    }
  },
  [2] = {
    id = "OJ_ME_GrimoireSumm6thHouse",
    spellIds = {
      [1] = spellIds.ashGhoul,
      [2] = spellIds.ashSlave,
      [3] = spellIds.ashZombie
    }
  },
  [3] = {
    id = "OJ_ME_GrimoireSummUndead",
    spellIds = {
      [1] = spellIds.lich,
      [2] = spellIds.draugr
    }
  },
  [4] = {
    id = "OJ_ME_GrimoireSummCenturion",
    spellIds = {
      [1] = spellIds.centurionArcher,
      [2] = spellIds.centurionSpider
    }
  }
}

local tomes = {
  [1] = {
    id = "OJ_ME_TomeSummWarDurzog",
    spellId = spellIds.warDurzog
  },
  [2] = {
    id = "OJ_ME_TomeSummGoblin",
    spellId = spellIds.goblinGrunt
  },
  [3] = {
    id = "OJ_ME_TomeSummGoblinOfficer",
    spellId = spellIds.goblinOfficer
  },
  [4] = {
    id = "OJ_ME_TomeSummGoblinWarChf",
    spellId = spellIds.goblinWarchief
  },
  [5] = {
    id = "OJ_ME_TomeSummHulkingFbrt",
    spellId = spellIds.hulkingFabricant
  },
  [6] = {
    id = "OJ_ME_TomeSummImperfect",
    spellId = spellIds.imperfect
  },
  [7] = {
    id = "OJ_ME_TomeSummAscdSlper",
    spellId = spellIds.ascendedSleeper
  },
  [8] = {
    id = "OJ_ME_TomeSummAshGhoul",
    spellId = spellIds.ashGhoul
  },
  [9] = {
    id = "OJ_ME_TomeSummAshSlave",
    spellId = spellIds.ashSlave
  },
  [10] = {
    id = "OJ_ME_TomeSummAshZombie",
    spellId = spellIds.ashZombie
  },
  [11] = {
    id = "OJ_ME_TomeSummDraugr",
    spellId = spellIds.draugr
  },
  [12] = {
    id = "OJ_ME_TomeSummLich",
    spellId = spellIds.lich
  },
  [13] = {
    id = "OJ_ME_TomeSummOgrim",
    spellId = spellIds.ogrim
  },
  [14] = {
    id = "OJ_ME_TomeSummSpriggan",
    spellId = spellIds.spriggran
  },
  [15] = {
    id = "OJ_ME_TomeSummCentArcher",
    spellId = spellIds.centurionArcher
  },
  [16] = {
    id = "OJ_ME_TomeSummCentSpdr",
    spellId = spellIds.centurionSpider
  },
  [17] = {
    id = "OJ_ME_TomeSummCentStm",
    spellId = spellIds.centurionSteam
  },
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
    id = spellIds.hulkingFabricant,
    name = "Summon Hulking Fabricant",
    effect = tes3.effect.summonHulkingFabricant,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.imperfect,
    name = "Summon Imperfect",
    effect = tes3.effect.summonImperfect,
    range = tes3.effectRange.self,
    duration = 15
  })
  framework.spells.createBasicSpell({
    id = spellIds.ascendedSleeper,
    name = "Summon Ascended Sleeper",
    effect = tes3.effect.summonAscendedSleeper,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.ashGhoul,
    name = "Summon Ash Ghoul",
    effect = tes3.effect.summonAshGhoul,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.ashZombie,
    name = "Summon Ash Zombie",
    effect = tes3.effect.summonAshZombie,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.ashZombie,
    name = "Summon Ash Slave",
    effect = tes3.effect.summonAshSlave,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.draugr,
    name = "Summon Draugr",
    effect = tes3.effect.summonDraugr,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.lich,
    name = "Summon Lich",
    effect = tes3.effect.summonLich,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.ogrim,
    name = "Summon Ogrim",
    effect = tes3.effect.summonOgrim,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.spriggran,
    name = "Summon Spriggan",
    effect = tes3.effect.summonSpriggan,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.centurionSteam,
    name = "Summon Steam Centurion",
    effect = tes3.effect.summonCenturionSteam,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.centurionArcher,
    name = "Summon Centurion Archer",
    effect = tes3.effect.summonCenturionProjectile,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = spellIds.centurionSpider,
    name = "Summon Centurion Spider",
    effect = tes3.effect.summonCenturionSpider,
    range = tes3.effectRange.self,
    duration = 30
  })

  framework.grimoires.registerGrimoires(grimoires)
  framework.tomes.registerTomes(tomes)
end

event.register("MagickaExpanded:Register", registerSpells)