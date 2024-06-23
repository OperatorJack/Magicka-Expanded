local framework = require("OperatorJack.MagickaExpanded")
local nodes = framework.vfx.nodes

tes3.claimSpellEffectId("conjurePalmLightning", 432)

---@param target tes3reference
---@param damage number
---@param position tes3vector3|nil
local function applyDamage(target, damage, position)
    target.mobile:applyDamage({damage = damage, resistAttribute = tes3.effectAttribute.resistShock})
    tes3.createVisualEffect({
        position = position or target.position,
        object = "VFX_LightningHit",
        lifespan = 1.0
    })
end

---@param e attackHitEventData
local function onAttack(e)
    if (e.targetReference and
        tes3.isAffectedBy({reference = e.reference, effect = tes3.effect.conjurePalmLightning})) then
        local magnitude = tes3.getEffectMagnitude({
            reference = e.reference,
            effect = tes3.effect.conjurePalmLightning
        })

        applyDamage(e.targetReference, magnitude)

        tes3.removeEffects({reference = e.reference, effect = tes3.effect.conjurePalmLightning})
    end
end

event.register(tes3.event.attackHit, onAttack)

local vfx = {}
local vfxFirstPerson = {}

---@param e tes3magicEffectTickEventData
local function onTick(e)
    local reference = e.sourceInstance.caster

    if (e.effectInstance.state == tes3.spellState.working and not vfx[e.sourceInstance.serialNumber]) then
        -- Attach VFX to hand.
        local node = nodes.getOrAttachVfx(reference, "lightn_bolt", "OJ\\ME\\lightn_bolt.nif",
                                          "Weapon Bone")

        if (node) then
            node.scale = 0.7 + (e.effectInstance.magnitude / 100)
            node.appCulled = false
            node:update({controllers = true})
            node:updateEffects()
            vfx[e.sourceInstance.serialNumber] = node
        end

        if (reference == tes3.player) then
            local firstPersonNode = nodes.getOrAttachVfx(tes3.player1stPerson, "lightn_bolt",
                                                         "OJ\\ME\\lightn_bolt.nif", "Weapon Bone")

            if (firstPersonNode) then
                firstPersonNode.scale = 0.7 + (e.effectInstance.magnitude / 100)
                firstPersonNode.appCulled = false
                firstPersonNode:update({controllers = true})
                firstPersonNode:updateEffects()
                vfxFirstPerson[e.sourceInstance.serialNumber] = firstPersonNode
            end
        end

    end
    if (e.effectInstance.state == tes3.spellState.ending and vfx[e.sourceInstance.serialNumber]) then
        -- Remove VFX from hand.
        local node = vfx[e.sourceInstance.serialNumber]
        nodes.hideNode(node)
        vfx[e.sourceInstance.serialNumber] = nil
    end
    if (e.effectInstance.state == tes3.spellState.ending and
        vfxFirstPerson[e.sourceInstance.serialNumber]) then
        -- Remove VFX from hand.
        local node = vfxFirstPerson[e.sourceInstance.serialNumber]
        nodes.hideNode(node)
        vfxFirstPerson[e.sourceInstance.serialNumber] = nil
    end

    e:trigger()
end

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
    onTick = onTick
})
