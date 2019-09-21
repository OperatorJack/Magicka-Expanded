local framework = include("OperatorJack.MagickaExpanded.magickaExpanded")

require("OperatorJack.MagickaExpanded-WeatherMagicPack.effects.weatherEffectSet")

local weatherSpellIds = {
  weatherBlizzard = "OJ_ME_WeatherBlizzard",
  weatherSnow = "OJ_ME_WeatherSnow",
  weatherThunder = "OJ_ME_WeatherThunder",
  weatherAsh = "OJ_ME_WeatherAsh",
  weatherBlight = "OJ_ME_WeatherBlight",
  weatherClear = "OJ_ME_WeatherClear",
  weatherCloudy = "OJ_ME_WeatherCloudy",
  weatherFoggy = "OJ_ME_WeatherFoggy",
  weatherOvercast = "OJ_ME_WeatherOvercast",
  weatherRain = "OJ_ME_WeatherRain"
}

local weatherTomes = {
  {
    id = "OJ_ME_TomeWeatherBlizzard",
    spellId = weatherSpellIds.weatherBlizzard
  },
  {
    id = "OJ_ME_TomeWeatherSnow",
    spellId = weatherSpellIds.weatherSnow
  },
  {
    id = "OJ_ME_TomeWeatherThunder",
    spellId = weatherSpellIds.weatherThunder
  },
  {
    id = "OJ_ME_TomeWeatherAsh",
    spellId = weatherSpellIds.weatherAsh
  },
  {
    id = "OJ_ME_TomeWeatherBlight",
    spellId = weatherSpellIds.weatherBlight
  },
  {
    id = "OJ_ME_TomeWeatherClear",
    spellId = weatherSpellIds.weatherClear
  },
  {
    id = "OJ_ME_TomeWeatherCloudy",
    spellId = weatherSpellIds.weatherCloudy
  },
  {
    id = "OJ_ME_TomeWeatherFoggy",
    spellId = weatherSpellIds.weatherFoggy
  },
  {
    id = "OJ_ME_TomeWeatherOvercast",
    spellId = weatherSpellIds.weatherOvercast
  },
  {
    id = "OJ_ME_TomeWeatherRain",
    spellId = weatherSpellIds.weatherRain
  }
}

local function registerSpells()
  framework.spells.createBasicSpell({
    id = weatherSpellIds.weatherBlizzard,
    name = "Winter's Embrace",
    effect = tes3.effect.weatherBlizzard,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = weatherSpellIds.weatherSnow,
    name = "Winter's Touch",
    effect = tes3.effect.weatherSnow,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = weatherSpellIds.weatherThunder,
    name = "Kyne's Wraith",
    effect = tes3.effect.weatherThunderstorm,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = weatherSpellIds.weatherAsh,
    name = "Ash Storm",
    effect = tes3.effect.weatherAsh,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = weatherSpellIds.weatherBlight,
    name = "Blight's Scourge",
    effect = tes3.effect.weatherBlight,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = weatherSpellIds.weatherClear,
    name = "Calming Caress",
    effect = tes3.effect.weatherClear,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = weatherSpellIds.weatherCloudy,
    name = "Clouding Sensation",
    effect = tes3.effect.weatherCloudy,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = weatherSpellIds.weatherFoggy,
    name = "Murky Veil",
    effect = tes3.effect.weatherFoggy,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = weatherSpellIds.weatherOvercast,
    name = "Grey Shroud",
    effect = tes3.effect.weatherOvercast,
    range = tes3.effectRange.self
  })
  framework.spells.createBasicSpell({
    id = weatherSpellIds.weatherRain,
    name = "Veloth's Tears",
    effect = tes3.effect.weatherRain,
    range = tes3.effectRange.self
  })
  
  framework.tomes.registerTomes(weatherTomes)
end

event.register("MagickaExpanded:Register", registerSpells)