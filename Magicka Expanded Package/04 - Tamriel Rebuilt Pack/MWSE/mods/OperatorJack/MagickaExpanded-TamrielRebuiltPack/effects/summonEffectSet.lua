local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

tes3.claimSpellEffectId("summonArmorCent", 267)
tes3.claimSpellEffectId("summonArmorCentChamp", 268)
tes3.claimSpellEffectId("summonDraugrHsCrl", 269)
tes3.claimSpellEffectId("summonDraugrLord", 270)
tes3.claimSpellEffectId("summonDridrea", 271)
tes3.claimSpellEffectId("summonDridreaMonarch", 272)
tes3.claimSpellEffectId("summonFrostLich", 273)
tes3.claimSpellEffectId("summonGiant", 274)
tes3.claimSpellEffectId("summonGoblinShaman", 275)
tes3.claimSpellEffectId("summonGreaterLich", 276)
tes3.claimSpellEffectId("summonLamia", 277)
tes3.claimSpellEffectId("summonMammoth", 278)
tes3.claimSpellEffectId("summonMinotaur", 279)
tes3.claimSpellEffectId("summonMudGolem", 280)
tes3.claimSpellEffectId("summonParastylus", 281)
tes3.claimSpellEffectId("summonPlainStrider", 282)
tes3.claimSpellEffectId("summonRaki", 283)
tes3.claimSpellEffectId("callSabreCat", 284)
tes3.claimSpellEffectId("summonSiltStrider", 285)
tes3.claimSpellEffectId("summonSload", 286)
tes3.claimSpellEffectId("summonSwampTroll", 287)
tes3.claimSpellEffectId("summonWelkyndSpirit", 288)
tes3.claimSpellEffectId("summonWereboar", 289)
tes3.claimSpellEffectId("summonVelk", 290)
tes3.claimSpellEffectId("summonVermai", 291)
tes3.claimSpellEffectId("summonTrebataur", 292)

local function getCallDescription(creatureName)
	return "This effect calls a " .. creatureName .. " from nature."..
    " It appears six feet in front of the caster and attacks any entity that attacks the caster until"..
    " the effect ends or the summoning is killed. At death, or when the effect ends, the summoning"..
    " disappears, returning to nature."
end

local function getDescription(creatureName)
    return "This effect summons a ".. creatureName .." from Oblivion."..
    " It appears six feet in front of the caster and attacks any entity that attacks the caster until"..
    " the effect ends or the summoning is killed. At death, or when the effect ends, the summoning"..
    " disappears, returning to Oblivion. If summoned in town, the guards will attack you and the summoning on sight."
end

local function addSummoningEffects()
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonArmorCent,
		name = "Summon Armor Centurion",
		description = getDescription("Armor Centurion"),
		baseCost = 30,
		creatureId = "T_Dwe_Cre_CentArmor_03"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonArmorCentChamp,
		name = "Summon Armor Centurion Champion",
		description = getDescription("Armor Centurion Champion"),
		baseCost = 50,
		creatureId = "T_Dwe_Cre_CentArmor_06"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonDraugrHsCrl,
		name = "Summon Draugr Housecarl",
		description = getDescription("Draugr Housecarl"),
		baseCost = 70,
		creatureId = "T_Sky_Und_DrgrHousc_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonDraugrLord,
		name = "Summon Draugr Lord",
		description = getDescription("Draugr Lord"),
		baseCost = 80,
		creatureId = "T_Sky_Und_DrgrLor_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonDridrea,
		name = "Summon Dridrea",
		description = getDescription("Dridrea"),
		baseCost = 75,
		creatureId = "T_Dae_Cre_Drid_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonDridreaMonarch,
		name = "Summon Dridrea Monarch",
		description = getDescription("Dridrea Monarch"),
		baseCost = 85,
		creatureId = "T_Dae_Cre_DridBs_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonFrostLich,
		name = "Summon Frost Lich",
		description = getDescription("Frost Lich"),
		baseCost = 70,
		creatureId = "T_Sky_Und_LichFr_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonGiant,
		name = "Summon Giant",
		description = getDescription("Giant"),
		baseCost = 60,
		creatureId = "T_Sky_Cre_Giant_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonGoblinShaman,
		name = "Summon Goblin Shaman",
		description = getDescription("Goblin Shaman"),
		baseCost = 50,
		creatureId = "T_Mw_Cre_GobShm_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonGreaterLich,
		name = "Summon Greater Lich",
		description = getDescription("Greater Lich"),
		baseCost = 150,
		creatureId = "T_Glb_Und_LichGr_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonLamia,
		name = "Summon Lamia",
		description = getDescription("Lamia"),
		baseCost = 45,
		creatureId = "T_Glb_Cre_Lami_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonMammoth,
		name = "Summon Mammoth",
		description = getDescription("Mammoth"),
		baseCost = 60,
		creatureId = "T_Sky_Fau_Mamm_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonMinotaur,
		name = "Summon Minotaur",
		description = getDescription("Minotaur"),
		baseCost = 90,
		creatureId = "T_Cyr_Cre_Mino_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonMudGolem,
		name = "Summon Mud Golem",
		description = getDescription("Mud Golem"),
		baseCost = 26,
		creatureId = "T_Glb_Cre_GolmM_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonParastylus,
		name = "Summon Parastylus",
		description = getDescription("Parastylus"),
		baseCost = 21,
		creatureId = "T_Mw_Fau_Para_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonPlainStrider,
		name = "Summon Plain Strider",
		description = getDescription("Plain Strider"),
		baseCost = 40,
		creatureId = "T_Mw_Fau_Plstrid_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonRaki,
		name = "Summon Raki",
		description = getDescription("Raki"),
		baseCost = 30,
		creatureId = "T_Sky_Fau_Raki_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.callSabreCat,
		name = "Call Sabre Cat",
		description = getCallDescription("Sabre Cat"),
		baseCost = 55,
		creatureId = "T_Sky_Fau_SabCat_02"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonSiltStrider,
		name = "Summon Silt Strider",
		description = getDescription("Silt Strider"),
		baseCost = 45,
		creatureId = "T_Mw_Fau_Slstrid_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonSload,
		name = "Summon Sload",
		description = getDescription("Sload"),
		baseCost = 55,
		creatureId = "T_Glb_Cre_Sloa_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonSwampTroll,
		name = "Summon Swamp Troll",
		description = getDescription("Swamp Troll"),
		baseCost = 25,
		creatureId = "T_Mw_Fau_TrllSw_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonWelkyndSpirit,
		name = "Summon Welkynd Spirit",
		description = getDescription("Welkynd Spirit"),
		baseCost = 30,
		creatureId = "T_Ayl_Cre_WelkSpr_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonWereboar,
		name = "Summon Wereboar",
		description = getDescription("Wereboar"),
		baseCost = 60,
		creatureId = "T_Glb_Cre_Wereboar_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonVelk,
		name = "Summon Velk",
		description = getDescription("Velk"),
		baseCost = 15,
		creatureId = "T_Mw_Fau_Velk_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonVermai,
		name = "Summon Vermai",
		description = getDescription("Vermai"),
		baseCost = 25,
		creatureId = "T_Dae_Cre_Verm_01"
	})
	framework.effects.conjuration.createBasicSummoningEffect({
		id = tes3.effect.summonTrebataur,
		name = "Summon Trebataur",
		description = getDescription("Trebataur"),
		baseCost = 130,
		creatureId = "T_Cyr_Cre_Mino_02"
	})
end

event.register("magicEffectsResolved", addSummoningEffects)