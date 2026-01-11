-- prototypes/recipes/demolin_smelting.lua
-- ----------------------------
-- Responsibility:
-- Defines smelting recipes for Demolin ores using Foundry-compatible category.
-- Inputs: Demolin ore + molten iron/copper
-- Outputs: tiered refined demolin items.
-- ----------------------------
local ICON_BASE     = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-refined.png"
local ICON_SPEED    = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-refined-speed.png"
local ICON_GIGANTIC = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-refined-gigantic.png"
local ICON_KING     = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-refined-king.png"

local function make_recipe(args)
  return {
    type = "recipe",
    name = args.name,

    -- ✅ Foundry supports "metallurgy" (Space Age)
    category = "metallurgy",

    enabled = false,
    energy_required = args.energy_required or 10,

    -- ✅ recipe icon required in your environment
    icon = args.icon,
    icon_size = 64,

    ingredients = args.ingredients,
    results = args.results,
  }
end

data:extend({
  make_recipe({
    name = "manis-demolin-smelt-base",
    icon = ICON_BASE,
    ingredients = {
      { type = "item",  name = "manis-demolin-ore", amount = 1 },
      { type = "fluid", name = "molten-iron", amount = 20 },
      { type = "fluid", name = "molten-copper", amount = 10 },
    },
    results = {
      { type = "item", name = "manis-demolin-refined", amount = 1 },
    },
  }),

  make_recipe({
    name = "manis-demolin-smelt-speed",
    icon = ICON_SPEED,
    ingredients = {
      { type = "item",  name = "manis-demolin-ore-speed", amount = 1 },
      { type = "fluid", name = "molten-iron", amount = 20 },
      { type = "fluid", name = "molten-copper", amount = 10 },
    },
    results = {
      { type = "item", name = "manis-demolin-refined-speed", amount = 1 },
    },
  }),

  make_recipe({
    name = "manis-demolin-smelt-gigantic",
    icon = ICON_GIGANTIC,
    ingredients = {
      { type = "item",  name = "manis-demolin-ore-gigantic", amount = 1 },
      { type = "fluid", name = "molten-iron", amount = 20 },
      { type = "fluid", name = "molten-copper", amount = 10 },
    },
    results = {
      { type = "item", name = "manis-demolin-refined-gigantic", amount = 1 },
    },
  }),

  make_recipe({
    name = "manis-demolin-smelt-king",
    icon = ICON_KING,
    ingredients = {
      { type = "item",  name = "manis-demolin-ore-king", amount = 1 },
      { type = "fluid", name = "molten-iron", amount = 20 },
      { type = "fluid", name = "molten-copper", amount = 10 },
    },
    results = {
      { type = "item", name = "manis-demolin-refined-king", amount = 1 },
    },
  }),
})