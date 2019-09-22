local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

tes3.claimSpellEffectId("lunarDamage", 322)

local function getCurrentMoonPhase()
    local masserPhase = tes3.worldController.weatherController.masser.phase
    local secundaPhase = tes3.worldController.weatherController.secunda.phase
    return masserPhase + secundaPhase
end

local function getModifierForMoonPhase(phase)
    return 1 + (phase / 8.0)
end

local function calculateLunarDamageAmount(e)
    -- Retrieve the current effect instance.
    local effect = framework.functions.getEffectFromEffectOnEffectEvent(e, tes3.effect.lunarDamage)
    
    -- Calculate the base magnitude.
	local magnitude = framework.functions.getCalculatedMagnitudeFromEffect(effect)

    local phase = getCurrentMoonPhase()

    local modifier = getModifierForMoonPhase(phase)

    return magnitude * modifier
end

local function onLunarDamageTick(e)
    -- Trigger event system.
    if (not e.trigger()) then
        return
    end

	-- Get the target's mobile actor.
	local mobile = e.effectInstance.target.mobile

    -- Calculate the damage.
    local damage = calculateLunarDamageAmount(e)

    -- Apply the damage.
    e.effectInstance.target.mobile:applyHealthDamage(damage)
end

local function addLunarDamageEffect()
    framework.effects.destruction.createBasicEffect({
        -- Base Information
        id = tes3.effect.lunarDamage,
        name = "Lunar Damage",
        description = "Using the power of Messer and Secunda, inflicts lunar damage upon the caster's targets. Damage scales with the phases of the moon.",

        -- Basic dials.
        baseCost = 4,
        speed = 1.1,

        -- Various flags.
		allowEnchanting = true,
		allowSpellmaking = true,
		canCastSelf = true,
		canCastTarget = true,
		canCastTouch = true,
		hasContinuousVFX = true,
		isHarmful = true,

        -- Graphics/sounds.      
        lighting = { 255 / 255, 255 / 255, 255 / 255 },
        
        -- Required callbacks.
        onTick = onLunarDamageTick,
    })
end

event.register("magicEffectsResolved", addLunarDamageEffect)