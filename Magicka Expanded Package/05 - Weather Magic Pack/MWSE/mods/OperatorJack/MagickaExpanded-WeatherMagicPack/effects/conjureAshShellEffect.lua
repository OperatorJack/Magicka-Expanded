local framework = require("OperatorJack.MagickaExpanded")
local nodes = framework.vfx.nodes

tes3.claimSpellEffectId("conjureAshShell", 334)

-- Create damage event handler to block all damage sources while effected by Ash Shell.
--- @param e damageEventData
local function damageCallback(e)
    if (tes3.isAffectedBy({
        effect = tes3.effect.conjureAshShell,
        reference = e.reference
    }) == true) then
        framework.log:debug("Reference affected by Ash Shell. Negating damage.")
        e.damage = 0
        return false
    end
end
event.register(tes3.event.damage, damageCallback, {priority = 1000})

---@type tes3spell|nil
local paralysis = nil

---@param e tes3magicEffectTickEventData
local function onTick(e)
    -- Verify effect conditions are met.
    local caster = e.sourceInstance.caster
    if (caster.cell.isInterior == true) then
        if (caster == tes3.player) then
            tes3.messageBox(
                "You fail to commune with the spirits when not in an ashstorm.")
        end

        framework.log:debug("Attempted casting failed exterior check.")
        e.effectInstance.state = tes3.spellState.retired
    end

    if (tes3.worldController.weatherController.currentWeather.index ~=
        tes3.weather.ash and
        tes3.worldController.weatherController.currentWeather.index ~=
        tes3.weather.blight) then
        if (caster == tes3.player) then
            tes3.messageBox(
                "You fail to commune with the spirits when not in an ashstorm.")
        end

        framework.log:debug("Attempted casting failed weather check.")
        e.effectInstance.state = tes3.spellState.retired
    end

    local target = e.effectInstance.target or e.sourceInstance.target or
                       e.sourceInstance.caster
    paralysis = (paralysis or tes3.getObject("OJ_ME_ConjureAshShellParalysis")) --[[@as tes3spell]]

    local stencilEffects = {
        player1st = "OJ\\ME\\wp\\ashshell_stencil_1st.nif",
        player3rd = "OJ\\ME\\wp\\ashshell_stencil_3rd.nif",
        npc = "OJ\\ME\\wp\\ashshell_stencil_npc.nif"
    }

    if (target) then
        -- Check if the effect is just starting, or if we're reloading a save game and no longer tracking VFX.
        if (e.effectInstance.state == tes3.spellState.working) then -- and not vfxs[e.sourceInstance.serialNumber]) then
            -- Disable controls via paralysis disease.
            if (target.object.spells:contains(paralysis) == false) then
                tes3.addSpell({reference = target, spell = paralysis})
                framework.log:debug("Added paralysis from target.")
            end

            -- Handle special circumstance VFX.
            if target == tes3.player then
                local firstNode = nodes.getOrAttachVfx(tes3.player1stPerson,
                                                       "OJ_ME_AshShellVfx1st",
                                                       stencilEffects.player1st)
                local node = nodes.getOrAttachVfx(target,
                                                  "OJ_ME_AshShellVfx3rd",
                                                  stencilEffects.player3rd)

                nodes.attachStencilProperty(target)
                nodes.showNode(firstNode)
                nodes.showNode(node)

            else
                -- Applies VFX for NPC / Creature
                local node = nodes.getOrAttachVfx(target,
                                                  "OJ_ME_AshShellVfx_NPC",
                                                  stencilEffects.npc)

                nodes.attachStencilProperty(target)
                nodes.showNode(node)

            end
        end

        if (e.effectInstance.state == tes3.spellState.ending) then
            -- Enable player controls. 
            tes3.removeSpell({reference = target, spell = paralysis})
            framework.log:debug("Removed paralysis from target.")

            -- Handle special circumstance VFX.
            if target == tes3.player then
                local firstNode = nodes.getOrAttachVfx(tes3.player1stPerson,
                                                       "OJ_ME_AshShellVfx1st",
                                                       stencilEffects.player1st)
                local node = nodes.getOrAttachVfx(target,
                                                  "OJ_ME_AshShellVfx3rd",
                                                  stencilEffects.player3rd)

                nodes.detachStencilProperty(target)
                nodes.hideNode(firstNode)
                nodes.hideNode(node)

            else
                -- Applies VFX for NPC / Creature
                local node = nodes.getOrAttachVfx(target,
                                                  "OJ_ME_AshShellVfx_NPC",
                                                  stencilEffects.npc)

                nodes.detachStencilProperty(target)
                nodes.hideNode(node)

            end
        end
    else
        framework.log:error("Invalid target! Target not found.")
    end

    -- Trigger into the spell system.
    if (not e:trigger()) then return end
end

local hitId = "oj_me_vfx_ashshell_hit"

local hitVFX = tes3.createObject({
    id = hitId,
    objectType = tes3.objectType.static,
    getIfExists = true,
    mesh = "OJ\\ME\\wp\\ashshell_hit.nif"
})
--- @cast hitVFX tes3static

--[[
    TODO:
    - Add custom icon
    - Add custom stencil VFX
    - Add custom bolt VFX
]]
framework.effects.conjuration.createBasicEffect({
    -- Base information.
    id = tes3.effect.conjureAshShell,
    name = "Conjure Ash Shell",
    description = "Commune with the spirits of nature to conjure an ash shell. Requires being outside and being in an ashstorm. Renders caster invulnerable, but unable to move.",

    -- Basic dials.
    baseCost = 25.0,

    -- Various flags.
    allowEnchanting = false,
    allowSpellmaking = false,
    hasNoMagnitude = true,
    hasNoDuration = false,
    isHarmful = true,
    nonRecastable = true,
    casterLinked = true,
    canCastTouch = true,
    canCastTarget = true,
    canCastSelf = true,

    -- Graphics/sounds.
    hitVFX = hitVFX,
    hasContinuousVFX = true,

    -- Required callbacks.
    onTick = onTick
})
