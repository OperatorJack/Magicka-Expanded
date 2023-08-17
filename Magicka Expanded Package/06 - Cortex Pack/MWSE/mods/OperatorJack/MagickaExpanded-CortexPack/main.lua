local framework = require("OperatorJack.MagickaExpanded")

local spellIds = {
    blink = "OJ_ME_BlinkSpell",
    clone = "OJ_ME_Clone",
    darkShadow = "OJ_ME_DarkShadowSpell",
    veilOfDarkness = "OJ_ME_DarknessSpell",
    mindScan = "OJ_ME_MindScan",
    mindRip = "OJ_ME_MindRip",
    soulScrye = "OJ_ME_SoulScrye",
    coalesce = "OJ_ME_Coalesce",
    permutation = "OJ_ME_Permutation"
}

local tomes = {
    {id = "OJ_ME_TomeBlink", spellId = spellIds.blink, list = "OJ_ME_LeveledList_Rare"},
    {id = "OJ_ME_TomeDarkness", spellId = spellIds.veilOfDarkness, list = "OJ_ME_LeveledList_Rare"},
    {id = "OJ_ME_TomeClone", spellId = spellIds.clone, list = "OJ_ME_LeveledList_Rare"},
    {id = "OJ_ME_TomeMindScan", spellId = spellIds.mindScan, list = "OJ_ME_LeveledList_Rare"},
    {id = "OJ_ME_TomeMindRip", spellId = spellIds.mindRip, list = "OJ_ME_LeveledList_Rare"},
    {id = "OJ_ME_TomeSoulScrye", spellId = spellIds.soulScrye, list = "OJ_ME_LeveledList_Rare"},
    {id = "OJ_ME_TomeCoalesce", spellId = spellIds.coalesce, list = "OJ_ME_LeveledList_Rare"},
    {id = "OJ_ME_TomePermutation", spellId = spellIds.permutation, list = "OJ_ME_LeveledList_Rare"}
}

event.register(tes3.event.initialized, function()
    require("OperatorJack.MagickaExpanded-CortexPack.effects")

    for _, tome in pairs(tomes) do
        local item = tes3.getObject(tome.id)
        local list = tes3.getObject(tome.list) --[[@as tes3leveledItem]]
        list:insert(item, 1)
    end
end)

local function registerSpells()
    framework.spells.createBasicSpell({
        id = spellIds.blink,
        name = "Blink",
        effect = tes3.effect.blink,
        rangeType = tes3.effectRange.target
    })

    framework.spells.createBasicSpell({
        id = spellIds.darkShadow,
        name = "Dark Shadow",
        effect = tes3.effect.darkness,
        rangeType = tes3.effectRange.self,
        min = 20,
        max = 20,
        duration = 10
    })
    framework.spells.createBasicSpell({
        id = spellIds.veilOfDarkness,
        name = "Veil of Darkness",
        effect = tes3.effect.darkness,
        rangeType = tes3.effectRange.target,
        min = 50,
        max = 100,
        duration = 10
    })

    framework.spells.createBasicSpell({
        id = spellIds.clone,
        name = "Clone",
        effect = tes3.effect.clone,
        rangeType = tes3.effectRange.target,
        duration = 10,
        min = 10,
        max = 30
    })

    framework.spells.createBasicSpell({
        id = spellIds.mindScan,
        name = "Vondakir's Insight",
        effect = tes3.effect.mindScan,
        rangeType = tes3.effectRange.self,
        duration = 10
    })

    framework.spells.createBasicSpell({
        id = spellIds.mindRip,
        name = "Vondakir's Intrusion",
        effect = tes3.effect.mindRip,
        rangeType = tes3.effectRange.touch
    })

    framework.spells.createBasicSpell({
        id = spellIds.soulScrye,
        name = "Vondakir's Scrutiny",
        effect = tes3.effect.soulScrye,
        rangeType = tes3.effectRange.self,
        duration = 10
    })

    framework.spells.createBasicSpell({
        id = spellIds.coalesce,
        name = "Coalesce",
        effect = tes3.effect.coalesce,
        rangeType = tes3.effectRange.target
    })

    framework.spells.createBasicSpell({
        id = spellIds.permutation,
        name = "Permutation",
        effect = tes3.effect.permutation,
        rangeType = tes3.effectRange.self,
        duration = 30
    })

    framework.tomes.registerTomes(tomes)
end

event.register("MagickaExpanded:Register", registerSpells)
