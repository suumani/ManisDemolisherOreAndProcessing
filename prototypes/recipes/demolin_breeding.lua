-- prototypes/recipes/demolin_breeding.lua
-- ----------------------------
-- Responsibility:
-- Defines 40?41 breeding recipes for higher-tier Demolin ores.
-- Executed in Demolin Centrifuge via the custom category "demolin-centrifuging".
-- ----------------------------

local ICON_SPEED    = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-ore-speed.png"
local ICON_GIGANTIC = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-ore-gigantic.png"
local ICON_KING     = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-ore-king.png"

local function make_recipe(args)
  return {
    type = "recipe",
    name = args.name,
    category = "demolin-centrifuging",
    enabled = false,
    energy_required = args.energy_required or 20,

    -- ? Required: recipe icon
    icon = args.icon,
    icon_size = 64,

    ingredients = args.ingredients,
    results = args.results,
  }
end

data:extend({
  -- Base 40?41 (Tungsten catalyst)
  make_recipe({
    name = "manis-demolin-breed-base-40to41",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-ore.png",
    ingredients = {
      { type = "item",  name = "tungsten-ore", amount = 40 },
      { type = "item",  name = "manis-demolin-ore", amount = 40 },
      { type = "fluid", name = "sulfuric-acid", amount = 500 },
    },
    results = {
      { type = "item",  name = "manis-demolin-ore", amount = 41 },
      { type = "fluid", name = "sulfuric-acid", amount = 100 },
      { type = "fluid", name = "manis-demolin-wastewater", amount = 300 },
      { type = "fluid", name = "water", amount = 100 },
    },
  }),
  
  -- Speed 40?41
  make_recipe({
    name = "manis-demolin-breed-speed-40to41",
    icon = ICON_SPEED,
    ingredients = {
      { type = "item",  name = "manis-demolin-ore", amount = 5 },
      { type = "item",  name = "manis-demolin-ore-speed", amount = 40 },
      { type = "fluid", name = "sulfuric-acid", amount = 500 },
    },
    results = {
      { type = "item",  name = "manis-demolin-ore", amount = 3 },
      { type = "item",  name = "manis-demolin-ore-speed", amount = 41 },
      { type = "fluid", name = "sulfuric-acid", amount = 300 },
      { type = "fluid", name = "manis-demolin-wastewater", amount = 100 },
      { type = "fluid", name = "water", amount = 100 },
    },
  }),

  -- Gigantic 40?41
  make_recipe({
    name = "manis-demolin-breed-gigantic-40to41",
    icon = ICON_GIGANTIC,
    ingredients = {
      { type = "item",  name = "manis-demolin-ore", amount = 5 },
      { type = "item",  name = "manis-demolin-ore-gigantic", amount = 40 },
      { type = "fluid", name = "sulfuric-acid", amount = 1500 },
    },
    results = {
      { type = "item",  name = "manis-demolin-ore", amount = 3 },
      { type = "item",  name = "manis-demolin-ore-gigantic", amount = 41 },
      { type = "fluid", name = "sulfuric-acid", amount = 400 },
      { type = "fluid", name = "manis-demolin-wastewater", amount = 800 },
      { type = "fluid", name = "water", amount = 300 },
    },
  }),

  -- King 40?41
  make_recipe({
    name = "manis-demolin-breed-king-40to41",
    icon = ICON_KING,
    ingredients = {
      { type = "item",  name = "manis-demolin-ore", amount = 2 },
      { type = "item",  name = "manis-demolin-ore-speed", amount = 5 },
      { type = "item",  name = "manis-demolin-ore-gigantic", amount = 8 },
      { type = "item",  name = "manis-demolin-ore-king", amount = 40 },
      { type = "fluid", name = "sulfuric-acid", amount = 2500 },
    },
    results = {
      { type = "item",  name = "manis-demolin-ore-king", amount = 41 },
      { type = "fluid", name = "sulfuric-acid", amount = 300 },
      { type = "fluid", name = "manis-demolin-wastewater", amount = 100 },
      { type = "fluid", name = "water", amount = 100 },
    },
  }),
})