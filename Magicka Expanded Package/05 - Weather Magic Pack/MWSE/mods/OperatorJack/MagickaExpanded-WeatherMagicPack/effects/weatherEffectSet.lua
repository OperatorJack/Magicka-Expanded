local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

tes3.claimSpellEffectId("weatherBlizzard", 312)
tes3.claimSpellEffectId("weatherSnow", 313)
tes3.claimSpellEffectId("weatherThunderstorm", 314)
tes3.claimSpellEffectId("weatherAsh", 315)
tes3.claimSpellEffectId("weatherBlight", 316)
tes3.claimSpellEffectId("weatherClear", 317)
tes3.claimSpellEffectId("weatherCloudy", 318)
tes3.claimSpellEffectId("weatherFoggy", 319)
tes3.claimSpellEffectId("weatherOvercast", 320)
tes3.claimSpellEffectId("weatherRain", 321)


local function getDescription(weather)
    return "This effect changes the weather to ".. weather .."."
end
local function addWeatherEffects()
	framework.effects.alteration.createBasicWeatherEffect({
		id = tes3.effect.weatherBlizzard,
		name = "Weather: Blizzard",
		description = getDescription("a Blizzard"),
		baseCost = 150,
		weather = tes3.weather.blizzard
	})
	framework.effects.alteration.createBasicWeatherEffect({
		id = tes3.effect.weatherSnow,
		name = "Weather: Snow",
		description = getDescription("Snow"),
		baseCost = 150,
		weather = tes3.weather.snow
	})
	framework.effects.alteration.createBasicWeatherEffect({
		id = tes3.effect.weatherThunderstorm,
		name = "Weather: Thunderstorm",
		description = getDescription("Thunderstorms"),
		baseCost = 150,
		weather = tes3.weather.thunder
	})
	framework.effects.alteration.createBasicWeatherEffect({
		id = tes3.effect.weatherAsh,
		name = "Weather: Ashstorm",
		description = getDescription("an Ash storm"),
		baseCost = 150,
		weather = tes3.weather.ash
	})
	framework.effects.alteration.createBasicWeatherEffect({
		id = tes3.effect.weatherBlight,
		name = "Weather: Blightstorm",
		description = getDescription("a Blight storm"),
		baseCost = 150,
		weather = tes3.weather.blight
	})
	framework.effects.alteration.createBasicWeatherEffect({
		id = tes3.effect.weatherClear,
		name = "Weather: Clear",
		description = getDescription("a clear sky"),
		baseCost = 150,
		weather = tes3.weather.clear
	})
	framework.effects.alteration.createBasicWeatherEffect({
		id = tes3.effect.weatherCloudy,
		name = "Weather: Cloudy",
		description = getDescription("a cloudy sky"),
		baseCost = 150,
		weather = tes3.weather.cloudy
	})
	framework.effects.alteration.createBasicWeatherEffect({
		id = tes3.effect.weatherFoggy,
		name = "Weather: Foggy",
		description = getDescription("a foggy sky"),
		baseCost = 150,
		weather = tes3.weather.foggy
	})
	framework.effects.alteration.createBasicWeatherEffect({
		id = tes3.effect.weatherOvercast,
		name = "Weather: Overcast",
		description = getDescription("an overcast sky"),
		baseCost = 150,
		weather = tes3.weather.overcast
	})
	framework.effects.alteration.createBasicWeatherEffect({
		id = tes3.effect.weatherRain,
		name = "Weather: Rain",
		description = getDescription("a moderate rain"),
		baseCost = 150,
		weather = tes3.weather.rain
	})
end

event.register("magicEffectsResolved", addWeatherEffects)