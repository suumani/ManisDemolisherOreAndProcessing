-- prototypes/technologies/demolin_tech.lua
-- ----------------------------
-- Responsibility:
-- Defines technologies to unlock demolin machines and science compression tiers.
-- Compression tech effects are generated automatically to avoid huge boilerplate.
-- ----------------------------

-- ----------------------------
-- Science pack lists (must match prototypes/recipes/science_compression.lua)
-- ----------------------------
local SCIENCE_PACKS = {
  { key = "automation",      base_item = "automation-science-pack" },
  { key = "logistic",        base_item = "logistic-science-pack" },
  { key = "military",        base_item = "military-science-pack" },
  { key = "chemical",        base_item = "chemical-science-pack" },
  { key = "production",      base_item = "production-science-pack" },
  { key = "utility",         base_item = "utility-science-pack" },
  { key = "space",           base_item = "space-science-pack" },

  -- Space Age packs
  { key = "metallurgic",     base_item = "metallurgic-science-pack" },
  { key = "agricultural",    base_item = "agricultural-science-pack" },
  { key = "electromagnetic", base_item = "electromagnetic-science-pack" },
  { key = "cryogenic",       base_item = "cryogenic-science-pack" },
  { key = "promethium",      base_item = "promethium-science-pack" },

  -- This mod
  { key = "boss",            base_item = "manis-boss-science-pack" },
}

local STAGES = {
  "compressed",
  "high-compressed",
  "ultra-compressed",
  "ultimate",
}

local function tech_unlock_effects_for_stage(stage_key)
  -- Unlock both compress and unpack recipes for every supported science pack for the given stage.
  local effects = {}
  for _, s in ipairs(SCIENCE_PACKS) do
    table.insert(effects, { type = "unlock-recipe", recipe = ("manis-compress-%s-%s"):format(s.key, stage_key) })
    table.insert(effects, { type = "unlock-recipe", recipe = ("manis-unpack-%s-%s"):format(s.key, stage_key) })
  end
  return effects
end

-- ----------------------------
-- Packs
-- ----------------------------
local PACKS_CORE = {
  { "automation-science-pack", 1 },
  { "logistic-science-pack", 1 },
  { "chemical-science-pack", 1 },
  { "production-science-pack", 1 },
  { "utility-science-pack", 1 },
  { "space-science-pack", 1 },
  { "metallurgic-science-pack", 1 }, -- Space Age
}

local function packs_with_boss(count_each)
  local packs = {}
  for _, p in ipairs(PACKS_CORE) do
    table.insert(packs, { p[1], count_each })
  end
  table.insert(packs, { "manis-boss-science-pack", count_each })
  return packs
end

local function packs_with_boss_one_each()
  local packs = {}
  for _, p in ipairs(PACKS_CORE) do
    table.insert(packs, { p[1], 1 })
  end
  table.insert(packs, { "manis-boss-science-pack", 1 })
  return packs
end

-- ----------------------------
-- Technology helper
-- ----------------------------
local function make_tech(args)
  local unit = {
    ingredients = args.ingredients,
    time = args.time or 60,
  }

  if args.count_formula then
    unit.count_formula = args.count_formula
  else
    unit.count = args.count
  end

  return {
    type = "technology",
    name = args.name,
    icon = args.icon,
    icon_size = args.icon_size or 256,
    prerequisites = args.prerequisites or {},
    unit = unit,
    effects = args.effects or {},
    order = args.order or "z[demolin]-a",
    max_level = args.max_level, -- optional
  }
end

-- ----------------------------
-- Tech definitions
-- ----------------------------
data:extend({
  -- ----------------------------
  -- Demolin Water Refinery
  -- ----------------------------
  make_tech({
    name = "manis-demolin-water-refinery",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/technology/demolin-water-refinery.png",
    order = "z[demolin]-a[water-refinery]",
    icon_size = 64,
    count = 1000,
    ingredients = PACKS_CORE,
    prerequisites = {},
    effects = {
      { type = "unlock-recipe", recipe = "manis-demolin-water-refinery" },

      { type = "unlock-recipe", recipe = "manis-demolin-solution-basic" },
      { type = "unlock-recipe", recipe = "manis-demolin-solution-mid" },
      { type = "unlock-recipe", recipe = "manis-demolin-solution-high" },
      { type = "unlock-recipe", recipe = "manis-demolin-solution-final" },
    },
  }),

  -- ----------------------------
  -- Demolin Centrifuge
  -- ----------------------------
  make_tech({
    name = "manis-demolin-centrifuge",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/technology/demolin-centrifuge.png",
    order = "z[demolin]-b[centrifuge]",

    count = 1000,
    ingredients = PACKS_CORE,
    prerequisites = { "manis-demolin-water-refinery" },
    effects = {
      { type = "unlock-recipe", recipe = "manis-demolin-centrifuge" },

      -- breeding
      { type = "unlock-recipe", recipe = "manis-demolin-breed-base-40to41" },
      { type = "unlock-recipe", recipe = "manis-demolin-breed-speed-40to41" },
      { type = "unlock-recipe", recipe = "manis-demolin-breed-gigantic-40to41" },
      { type = "unlock-recipe", recipe = "manis-demolin-breed-king-40to41" },

      -- recovery loop
      { type = "unlock-recipe", recipe = "manis-demolin-ore-recovery" },

      -- smelting
      { type = "unlock-recipe", recipe = "manis-demolin-smelt-base" },
      { type = "unlock-recipe", recipe = "manis-demolin-smelt-speed" },
      { type = "unlock-recipe", recipe = "manis-demolin-smelt-gigantic" },
      { type = "unlock-recipe", recipe = "manis-demolin-smelt-king" },

      -- packaging
      { type = "unlock-recipe", recipe = "manis-demolin-pack-base" },
      { type = "unlock-recipe", recipe = "manis-demolin-pack-speed" },
      { type = "unlock-recipe", recipe = "manis-demolin-pack-gigantic" },
      { type = "unlock-recipe", recipe = "manis-demolin-pack-king" },

      -- boss science pack production
      { type = "unlock-recipe", recipe = "manis-boss-science-egg-basic" },
      { type = "unlock-recipe", recipe = "manis-boss-science-egg-mid" },
      { type = "unlock-recipe", recipe = "manis-boss-science-egg-high" },
      { type = "unlock-recipe", recipe = "manis-boss-science-egg-final" },
      { type = "unlock-recipe", recipe = "manis-boss-science-wood-basic" },
      { type = "unlock-recipe", recipe = "manis-boss-science-wood-mid" },
    },
  }),

  -- ----------------------------
  -- Compression tiers
  -- ----------------------------
  make_tech({
    name = "manis-demolin-compression-basic",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/technology/demolin-compression-basic.png",
    order = "z[demolin]-c[compression-basic]",

    count = 1000,
    ingredients = packs_with_boss(1000),
    prerequisites = { "manis-demolin-centrifuge" },
    effects = tech_unlock_effects_for_stage("compressed"),
  }),

  make_tech({
    name = "manis-demolin-compression-speed",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/technology/demolin-compression-speed.png",
    order = "z[demolin]-d[compression-speed]",

    count = 2000,
    ingredients = packs_with_boss(2000),
    prerequisites = { "manis-demolin-compression-basic" },
    effects = tech_unlock_effects_for_stage("high-compressed"),
  }),

  make_tech({
    name = "manis-demolin-compression-gigantic",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/technology/demolin-compression-gigantic.png",
    order = "z[demolin]-e[compression-gigantic]",

    count = 4000,
    ingredients = packs_with_boss(4000),
    prerequisites = { "manis-demolin-compression-speed" },
    effects = tech_unlock_effects_for_stage("ultra-compressed"),
  }),

  make_tech({
    name = "manis-demolin-compression-king",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/technology/demolin-compression-king.png",
    order = "z[demolin]-f[compression-king]",

    count = 8000,
    ingredients = packs_with_boss(8000),
    prerequisites = { "manis-demolin-compression-gigantic" },
    effects = tech_unlock_effects_for_stage("ultimate"),
  }),

  -- ----------------------------
  -- Completion / Thanks
  -- ----------------------------
  make_tech({
    name = "manis-demolin-thanks-for-clearing",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/technology/demolin-thanks.png",
    order = "z[demolin]-z[thanks]",

    prerequisites = { "manis-demolin-compression-king" },

    -- ✅ 1回きりで 100万（count上限回避）
    count_formula = "1000000",
    ingredients = packs_with_boss_one_each(),
    time = 60,

    effects = {
      { type = "nothing", effect_description = { "technology-effect-quality.nothing" } },
    },
  }),
})