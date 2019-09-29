local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

require("OperatorJack.MagickaExpanded-TamrielRebuiltPack.effects.summonEffectSet")
require("OperatorJack.MagickaExpanded-TamrielRebuiltPack.effects.teleportationEffectSet")

local teleportSpellIds = {
  akamora = "OJ_ME_TeleportToAkamora",
  firewatch = "OJ_ME_TeleportToFirewatch",
  helnim = "OJ_ME_TeleportToHelnim",
  necrom = "OJ_ME_TeleportToNecrom",
  oldEbonheart = "OJ_ME_TeleportToOldEbonheart",
  portTelvannis = "OJ_ME_TeleportToPortTelvannis",

  altBosara = "OJ_ME_TeleportToAltBosara",
  balOrya = "OJ_ME_TeleportToBalOrya",
  gahSadrith = "OJ_ME_TeleportToGahSadrith",
  gorne = "OJ_ME_TeleportToGorne",
  llothanis = "OJ_ME_TeleportToLlothanis",
  marog = "OJ_ME_TeleportToMarog",
  meralag = "OJ_ME_TeleportToMeralag",
  telAranyon = "OJ_ME_TeleportToTelAranyon",
  telMothrivra = "OJ_ME_TeleportToTelMothrivra",
  telMuthada = "OJ_ME_TeleportToTelMuthada",
  telOuada = "OJ_ME_TeleportToTelOuada"
}

local summonSpellIds = {
  alfiq = "OJ_ME_SummAlfiq",
  armorCenturion = "OJ_ME_SummArmorCent",
  armorCenturionChampion = "OJ_ME_SummArmorCentChamp",
  draugrHousecarl = "OJ_ME_SummDraugrHsCrl",
  draugrLord = "OJ_ME_SummDraugrLord",
  dridrea = "OJ_ME_SummDridrea",
  dridreaMonarch = "OJ_ME_SummDridreaMonarch",
  frostLich = "OJ_ME_SummFrostLich",
  giant = "OJ_ME_SummGiant",
  goblinShaman = "OJ_ME_SummGoblinShaman",
  greaterLich = "OJ_ME_SummGreaterLich",
  lamia = "OJ_ME_SummLamia",
  mammoth = "OJ_ME_SummMammoth",
  minotaur = "OJ_ME_SummMinotaur",
  mudGolem = "OJ_ME_SummMudGolem",
  parastylus = "OJ_ME_SummParastylus",
  plainStrider = "OJ_ME_SummPlainStrider",
  raki = "OJ_ME_SummRaki",
  sabreCat = "OJ_ME_SummSabreCat",
  siltStrider = "OJ_ME_SummSiltStrider",
  sload = "OJ_ME_SummSload",
  swampTroll = "OJ_ME_SummSwampTroll",
  welkyndSpirit = "OJ_ME_SummWelkSpirit",
  wereboar = "OJ_ME_SummWereBoar",
  velk = "OJ_ME_SummVelk",
  vermai = "OJ_ME_SummVermai",
  trebataur = "OJ_ME_SummTrebataur"
}

local teleportTomes = {
  {
    id = "OJ_ME_TomeTeleAkamora",
    spellId = teleportSpellIds.akamora
  },
  {
    id = "OJ_ME_TomeTeleFirewatch",
    spellId = teleportSpellIds.firewatch
  },
  {
    id = "OJ_ME_TomeTeleHelnim",
    spellId = teleportSpellIds.helnim
  },
  {
    id = "OJ_ME_TomeTeleNecrom",
    spellId = teleportSpellIds.necrom
  },
  {
    id = "OJ_ME_TomeTeleOldEbonheart",
    spellId = teleportSpellIds.oldEbonheart
  },
  {
    id = "OJ_ME_TomeTelePortTelvannis",
    spellId = teleportSpellIds.portTelvannis
  },
  {
    id = "OJ_ME_TomeTeleAltBosara",
    spellId = teleportSpellIds.altBosara
  },
  {
    id = "OJ_ME_TomeTeleBalOrya",
    spellId = teleportSpellIds.balOrya
  },
  {
    id = "OJ_ME_TomeTeleGahSadrith",
    spellId = teleportSpellIds.gahSadrith
  },
  {
    id = "OJ_ME_TomeTeleGorne",
    spellId = teleportSpellIds.gorne
  },
  {
    id = "OJ_ME_TomeTeleLlothanis",
    spellId = teleportSpellIds.llothanis
  },
  {
    id = "OJ_ME_TomeTeleMarog",
    spellId = teleportSpellIds.marog
  },
  {
    id = "OJ_ME_TomeTeleMeralag",
    spellId = teleportSpellIds.meralag
  },
  {
    id = "OJ_ME_TomeTeleTelAranyon",
    spellId = teleportSpellIds.telAranyon
  },
  {
    id = "OJ_ME_TomeTeleTelMothrivra",
    spellId = teleportSpellIds.telMothrivra
  },
  {
    id = "OJ_ME_TomeTeleTelMuthada",
    spellId = teleportSpellIds.telMuthada
  },
  {
    id = "OJ_ME_TomeTeleTelOuada",
    spellId = teleportSpellIds.telOuada
  },
}

local summonTomes = {
  {
    id = "OJ_ME_TomeSummAlfiq",
    spellId = summonSpellIds.alfiq
  },
  {
    id = "OJ_ME_TomeSummArmorCent",
    spellId = summonSpellIds.armorCenturion
  },
  {
    id = "OJ_ME_TomeSummArmorCentChamp",
    spellId = summonSpellIds.armorCenturionChampion
  },
  {
    id = "OJ_ME_TomeSummDraugrHsCrl",
    spellId = summonSpellIds.draugrHousecarl
  },
  {
    id = "OJ_ME_TomeSummDraugrLord",
    spellId = summonSpellIds.draugrLord
  },
  {
    id = "OJ_ME_TomeSummDridrea",
    spellId = summonSpellIds.dridrea
  },
  {
    id = "OJ_ME_TomeSummDridreaMonarch",
    spellId = summonSpellIds.dridreaMonarch
  },
  {
    id = "OJ_ME_TomeSummFrostLich",
    spellId = summonSpellIds.frostLich
  },
  {
    id = "OJ_ME_TomeSummGiant",
    spellId = summonSpellIds.giant
  },
  {
    id = "OJ_ME_TomeSummGoblinShaman",
    spellId = summonSpellIds.goblinShaman
  },
  {
    id = "OJ_ME_TomeSummGreaterLich",
    spellId = summonSpellIds.greaterLich
  },
  {
    id = "OJ_ME_TomeSummLamia",
    spellId = summonSpellIds.lamia
  },
  {
    id = "OJ_ME_TomeSummMammoth",
    spellId = summonSpellIds.mammoth
  },
  {
    id = "OJ_ME_TomeSummMinotaur",
    spellId = summonSpellIds.minotaur
  },
  {
    id = "OJ_ME_TomeSummMudGolem",
    spellId = summonSpellIds.mudGolem
  },
  {
    id = "OJ_ME_TomeSummParastylus",
    spellId = summonSpellIds.parastylus
  },
  {
    id = "OJ_ME_TomeSummPlainStrider",
    spellId = summonSpellIds.plainStrider
  },
  {
    id = "OJ_ME_TomeSummRaki",
    spellId = summonSpellIds.raki
  },
  {
    id = "OJ_ME_TomeSummSabreCat",
    spellId = summonSpellIds.sabreCat
  },
  {
    id = "OJ_ME_TomeSummSiltStrider",
    spellId = summonSpellIds.siltStrider
  },
  {
    id = "OJ_ME_TomeSummSload",
    spellId = summonSpellIds.sload
  },
  {
    id = "OJ_ME_TomeSummSwampTroll",
    spellId = summonSpellIds.swampTroll
  },
  {
    id = "OJ_ME_TomeSummWelkyndSpirit",
    spellId = summonSpellIds.welkyndSpirit
  },
  {
    id = "OJ_ME_TomeSummWereboar",
    spellId = summonSpellIds.wereboar
  },
  {
    id = "OJ_ME_TomeSummVelk",
    spellId = summonSpellIds.velk
  },
  {
    id = "OJ_ME_TomeSummVermai",
    spellId = summonSpellIds.vermai
  },
  {
    id = "OJ_ME_TomeSummTrebataur",
    spellId = summonSpellIds.trebataur
  }
}

local function registerSpells()
  framework.spells.createBasicSpell({
    id = teleportSpellIds.akamora,
    name = "Teleport to Akamora",
    effect = tes3.effect.teleportToAkamora,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.firewatch,
    name = "Teleport to Firewatch",
    effect = tes3.effect.teleportToFirewatch,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.helnim,
    name = "Teleport to Helnim",
    effect = tes3.effect.teleportToHelnim,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.necrom,
    name = "Teleport to Necrom",
    effect = tes3.effect.teleportToNecrom,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.oldEbonheart,
    name = "Teleport to Old Ebonheart",
    effect = tes3.effect.teleportToOldEbonheart,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.portTelvannis,
    name = "Teleport to Port Telvannis",
    effect = tes3.effect.teleportToPortTelvannis,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.altBosara,
    name = "Teleport to Alt Bosara",
    effect = tes3.effect.teleportToAltBosara,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.balOrya,
    name = "Teleport to Bal Orya",
    effect = tes3.effect.teleportToBalOrya,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.gahSadrith,
    name = "Teleport to Gah Sadrith",
    effect = tes3.effect.teleportToGahSadrith,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.gorne,
    name = "Teleport to Gorne",
    effect = tes3.effect.teleportToGorne,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.llothanis,
    name = "Teleport to Llothanis",
    effect = tes3.effect.teleportToLlothanis,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.marog,
    name = "Teleport to Marog",
    effect = tes3.effect.teleportToMarog,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.meralag,
    name = "Teleport to Meralag",
    effect = tes3.effect.teleportToMeralag,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.telAranyon,
    name = "Teleport to Tel Aranyon",
    effect = tes3.effect.teleportToTelAranyon,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.telMothrivra,
    name = "Teleport to Tel Mothrivra",
    effect = tes3.effect.teleportToTelMothrivra,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.telMuthada,
    name = "Teleport to Tel Muthada",
    effect = tes3.effect.teleportToTelMuthada,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = teleportSpellIds.telOuada,
    name = "Teleport to Tel Ouada",
    effect = tes3.effect.teleportToTelOuada,
    range = tes3.effectRange.self
  })

  
  framework.spells.createBasicSpell({
    id = summonSpellIds.armorCenturion,
    name = "Summon Armor Centurion",
    effect = tes3.effect.summonArmorCent,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.armorCenturionChampion,
    name = "Summon Armor Centurion Champion",
    effect = tes3.effect.summonArmorCentChamp,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.draugrHousecarl,
    name = "Summon Draugr Housecarl",
    effect = tes3.effect.summonDraugrHsCrl,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.draugrLord,
    name = "Summon Draugr Lord",
    effect = tes3.effect.summonDraugrLord,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.dridrea,
    name = "Summon Dridrea",
    effect = tes3.effect.summonDridrea,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.dridreaMonarch,
    name = "Summon Dridrea Monarch",
    effect = tes3.effect.summonDridreaMonarch,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.frostLich,
    name = "Summon Frost Lich",
    effect = tes3.effect.summonFrostLich,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.giant,
    name = "Summon Giant",
    effect = tes3.effect.summonGiant,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.goblinShaman,
    name = "Summon Goblin Shaman",
    effect = tes3.effect.summonGoblinShaman,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.greaterLich,
    name = "Summon Greater Lich",
    effect = tes3.effect.summonGreaterLich,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.lamia,
    name = "Summon Lamia",
    effect = tes3.effect.summonLamia,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.mammoth,
    name = "Summon Mammoth",
    effect = tes3.effect.summonMammoth,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.minotaur,
    name = "Summon Minotaur",
    effect = tes3.effect.summonMinotaur,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.mudGolem,
    name = "Summon Mud Golem",
    effect = tes3.effect.summonMudGolem,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.parastylus,
    name = "Summon Parastylus",
    effect = tes3.effect.summonParastylus,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.plainStrider,
    name = "Summon Plain Strider",
    effect = tes3.effect.summonPlainStrider,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.raki,
    name = "Summon Raki",
    effect = tes3.effect.summonRaki,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.sabreCat,
    name = "Call Sabre Cat",
    effect = tes3.effect.callSabreCat,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.siltStrider,
    name = "Summon Silt Strider",
    effect = tes3.effect.summonSiltStrider,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.sload,
    name = "Summon Sload",
    effect = tes3.effect.summonSload,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.swampTroll,
    name = "Summon Swamp Troll",
    effect = tes3.effect.summonSwampTroll,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.welkyndSpirit,
    name = "Summon Welkynd Spirit",
    effect = tes3.effect.summonWelkyndSpirit,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.wereboar,
    name = "Call Wereboar",
    effect = tes3.effect.callWereboar,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.velk,
    name = "Summon Velk",
    effect = tes3.effect.summonVelk,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.vermai,
    name = "Summon Vermai",
    effect = tes3.effect.summonVermai,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.trebataur,
    name = "Summon Trebataur",
    effect = tes3.effect.summonTrebataur,
    range = tes3.effectRange.self,
    duration = 30
  })
  framework.spells.createBasicSpell({
    id = summonSpellIds.alfiq,
    name = "Summon Alfiq",
    effect = tes3.effect.summonAlfiq,
    range = tes3.effectRange.self,
    duration = 30
  })
  
  framework.tomes.registerTomes(teleportTomes)
  framework.tomes.registerTomes(summonTomes)
end

event.register("MagickaExpanded:Register", registerSpells)