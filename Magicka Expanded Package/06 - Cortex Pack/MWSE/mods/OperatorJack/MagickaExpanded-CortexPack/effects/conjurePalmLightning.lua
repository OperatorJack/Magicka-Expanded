local framework = require("OperatorJack.MagickaExpanded")
local tick = require("OperatorJack.MagickaExpanded.utils.onTickHandlers")

tes3.claimSpellEffectId("conjurePalmLightning", 432)

--[[
    TODO:
    - Add custom icon
    - Add custom bolt VFX
]]
framework.effects.conjuration.createBasicEffect({
    -- Base information.
    id = tes3.effect.conjurePalmLightning,
    name = "Conjure Palm Lightning",
    description = "Commune with the spirits of nature to conjure a ball of lightning in your hand.",

    -- Basic dials.
    baseCost = 5.0,

    -- Various flags.
    allowEnchanting = false,
    allowSpellmaking = false,
    hasNoMagnitude = false,
    hasNoDuration = false,
    canCastTarget = false,
    canCastTouch = false,
    canCastSelf = true,
    casterLinked = true,
    appliesOnce = true,
    isHarmful = true,
    nonRecastable = true,

    -- Graphics/sounds.
    hitVFX = framework.data.ids.objects.static.vfxEmpty,
    areaVFX = framework.data.ids.objects.static.vfxEmpty,
    boltVFX = framework.data.ids.objects.static.vfxEmpty,
    castVFX = "VFX_LightningCast",
    particleTexture = "vfx_electric.dds",

    -- Required callbacks.
    onTick = function(e)
        tick.onPalmEffectTick({
            effect = tes3.effect.conjurePalmLightning,
            resistAttribute = tes3.effectAttribute.resistShock,
            tickEventData = e,
            vfxRootNodeName = "oj_me_palm_shock",
            vfxPath = "OJ\\ME\\cp\\vfx_palm_shock.nif",
            vfxHitObjectId = "VFX_LightningHit"
        })
    end
})
