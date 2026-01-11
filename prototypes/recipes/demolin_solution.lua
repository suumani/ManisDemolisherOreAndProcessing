-- prototypes/recipes/demolin_solution.lua
-- ----------------------------
-- Responsibility:
-- Defines Demolin Solution production recipes (4 tiers).
-- Executed in Demolin Water Refinery using the custom category.
-- ----------------------------

local SOLUTION_ICON = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-solution.png"

local function make_recipe(args)
  return {
    type = "recipe",
    name = args.name,
    category = "demolin-water-refining",
    enabled = false,
    energy_required = args.energy_required or 10,

    -- ✅ Required in some environments: provide an icon for the recipe
    icon = SOLUTION_ICON,
    icon_size = 64,

    ingredients = args.ingredients,
    results = args.results,
  }
end

data:extend({
  make_recipe({
    name = "manis-demolin-solution-basic",
    ingredients = {
      { type = "item",  name = "uranium-238", amount = 10 },
      { type = "item",  name = "manis-demolin-ore", amount = 100 },
      { type = "fluid", name = "sulfuric-acid", amount = 500 },
    },
    results = {
      { type = "fluid", name = "manis-demolin-solution", amount = 30 },
      { type = "fluid", name = "manis-demolin-wastewater", amount = 10 },
      { type = "fluid", name = "water", amount = 480 },
    },
  }),

  make_recipe({
    name = "manis-demolin-solution-mid",
    ingredients = {
      { type = "item",  name = "uranium-238", amount = 10 },
      { type = "item",  name = "manis-demolin-ore", amount = 50 },
      { type = "item",  name = "manis-demolin-ore-speed", amount = 10 },
      { type = "fluid", name = "sulfuric-acid", amount = 500 },
    },
    results = {
      { type = "fluid", name = "manis-demolin-solution", amount = 100 },
      { type = "fluid", name = "manis-demolin-wastewater", amount = 50 },
      { type = "fluid", name = "water", amount = 350 },
    },
  }),

  make_recipe({
    name = "manis-demolin-solution-high",
    ingredients = {
      { type = "item",  name = "uranium-238", amount = 10 },
      { type = "item",  name = "manis-demolin-ore", amount = 50 },
      { type = "item",  name = "manis-demolin-ore-gigantic", amount = 10 },
      { type = "fluid", name = "sulfuric-acid", amount = 500 },
    },
    results = {
      { type = "fluid", name = "manis-demolin-solution", amount = 150 },
      { type = "fluid", name = "manis-demolin-wastewater", amount = 150 },
      { type = "fluid", name = "water", amount = 200 },
    },
  }),

  make_recipe({
    name = "manis-demolin-solution-final",
    energy_required = 20,
    ingredients = {
      { type = "item",  name = "uranium-238", amount = 10 },
      { type = "item",  name = "manis-demolin-ore", amount = 10 },
      { type = "item",  name = "manis-demolin-ore-speed", amount = 3 },
      { type = "item",  name = "manis-demolin-ore-gigantic", amount = 1 },
      { type = "item",  name = "manis-demolin-ore-king", amount = 1 },
      { type = "fluid", name = "sulfuric-acid", amount = 1000 },
      { type = "fluid", name = "fluoroketone-cold", amount = 500 },
    },
    results = {
      { type = "fluid", name = "manis-demolin-solution", amount = 800 },
      { type = "fluid", name = "manis-demolin-wastewater", amount = 150 },
      { type = "fluid", name = "water", amount = 50 },
    },
  }),
})