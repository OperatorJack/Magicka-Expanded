local framework = require("OperatorJack.MagickaExpanded.magickaExpanded")

tes3.claimSpellEffectId("thunderbolt", 323)

---@param target tes3reference
---@param distance number
---@param position tes3vector3|nil
local function applyDamage(target, distance, position)
    local damage = math.max(math.max(math.random(10, 80) - (distance / 4), 0),
                            50)
    target.mobile:applyDamage({
        damage = math.random(10, 40),
        resistAttribute = tes3.effectAttribute.resistShock
    })
    tes3.createVisualEffect({
        position = position or target.position,
        object = "VFX_LightningArea",
        lifespan = 1.0
    })
end

local effects = {}

---@param e tes3magicEffectCollisionEventData
local function onThunderboltCollision(e)
    if e.collision then
        -- Verify effect conditions are met.
        local caster = e.sourceInstance.caster
        if (caster.cell.isInterior == true) then
            if (caster == tes3.player) then
                tes3.messageBox(
                    "You fail to commune with the spirits when not in a thunderstorm.")
            end
            return
        end

        if (tes3.worldController.weatherController.currentWeather.index ~=
            tes3.weather.thunder) then
            if (caster == tes3.player) then
                tes3.messageBox(
                    "You fail to commune with the spirits when not in a thunderstorm.")
            end
            return
        end

        local distanceLimit = 400
        local position = e.collision.point:copy()

        local lightning = require(
                              "OperatorJack.MagickaExpanded-WeatherMagicPack.utils.lightning")
        local strength = math.random(5, 15) / 10
        lightning.createLightningStrike(position, strength, true)

        local randomSound = math.random(0, 4)
        local soundId = string.format("OJ_ME_Thunderclap%s", randomSound)
        tes3.playSound({reference = tes3.player, sound = soundId})

        -- Add a mechanic to the thunderbolt mesh.
        local actors = framework.functions.getActorsNearTargetPosition(
                           caster.cell, position, distanceLimit)
        local spell = tes3.getObject("OJ_ME_ThunderBoltEffect")

        for _, actor in pairs(actors) do
            applyDamage(actor, caster.position:distance(actor.position))

            actor.mobile:startCombat(caster.mobile)

            if (caster == tes3.player and not effects[e.sourceInstance.id]) then
                local result = tes3.triggerCrime({
                    criminal = caster,
                    type = tes3.crimeType.attack,
                    victim = actor
                })

                if (result == true) then
                    effects[e.sourceInstance.id] = true
                end
            end

        end

    end
end

local function addThunderboltEffect()
    framework.effects.conjuration.createBasicEffect({
        -- Base information.
        id = tes3.effect.thunderbolt,
        name = "Thunderbolt",
        description = "Conjure a large thunderbolt down from above. Requires being outside and being in a thunderstorm. Thunderbolts will damage and stun affected targets.",

        -- Basic dials.
        baseCost = 25.0,
        speed = 2,

        -- Various flags.
        allowEnchanting = true,
        allowSpellmaking = true,
        hasNoMagnitude = true,
        hasNoDuration = true,
        canCastTarget = true,

        -- Graphics/sounds.
        hitVFX = "VFX_LightningHit",
        areaVFX = "VFX_LightningArea",
        boltVFX = "OJ_ME_LightningBoltVFX",
        castVFX = "VFX_LightningCast",
        particleTexture = "vfx_electric.dds",

        -- Required callbacks.
        onCollision = onThunderboltCollision
    })
end

event.register("magicEffectsResolved", addThunderboltEffect)
