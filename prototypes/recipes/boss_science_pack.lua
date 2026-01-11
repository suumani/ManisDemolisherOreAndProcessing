-- prototypes/recipes/boss_science_pack.lua
-- ----------------------------
-- Responsibility:
-- Defines Boss Science Pack production recipes.
-- - Egg route: 4 tiers
-- - Wood route: 2 tiers (basic/mid only)
-- Executed in assembling machines (default crafting category).
-- ----------------------------

local function make_recipe(args)
  return {
    type = "recipe",
    name = args.name,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = args.energy_required or 10,
    ingredients = args.ingredients,
    results = args.results,
  }
end

data:extend({
  -- ----------------------------
  -- Egg route (Biological)
  -- ----------------------------
  make_recipe({
    name = "manis-boss-science-egg-basic",
    ingredients = {
      { type = "fluid", name = "manis-demolin-solution", amount = 1000 },
      { type = "item",  name = "biter-egg", amount = 1 },
      { type = "item",  name = "pentapod-egg", amount = 1 },
      { type = "item",  name = "raw-fish", amount = 1 },
      { type = "item",  name = "manis-demolin-ore", amount = 10 },
    },
    results = {
      { type = "item", name = "manis-boss-science-pack", amount = 1 },
    },
  }),

  make_recipe({
    name = "manis-boss-science-egg-mid",
    ingredients = {
      { type = "fluid", name = "manis-demolin-solution", amount = 1000 },
      { type = "item",  name = "biter-egg", amount = 1 },
      { type = "item",  name = "pentapod-egg", amount = 1 },
      { type = "item",  name = "raw-fish", amount = 1 },
      { type = "item",  name = "manis-demolin-ore-speed", amount = 10 },
    },
    results = {
      { type = "item", name = "manis-boss-science-pack", amount = 3 },
    },
  }),

  make_recipe({
    name = "manis-boss-science-egg-high",
    ingredients = {
      { type = "fluid", name = "manis-demolin-solution", amount = 1000 },
      { type = "item",  name = "biter-egg", amount = 1 },
      { type = "item",  name = "pentapod-egg", amount = 1 },
      { type = "item",  name = "raw-fish", amount = 1 },
      { type = "item",  name = "manis-demolin-ore-gigantic", amount = 10 },
    },
    results = {
      { type = "item", name = "manis-boss-science-pack", amount = 10 },
    },
  }),

  make_recipe({
    name = "manis-boss-science-egg-final",
    energy_required = 20,
    ingredients = {
      { type = "fluid", name = "manis-demolin-solution", amount = 1000 },
      { type = "item",  name = "biter-egg", amount = 1 },
      { type = "item",  name = "pentapod-egg", amount = 1 },
      { type = "item",  name = "raw-fish", amount = 1 },
      { type = "item",  name = "manis-demolin-ore-king", amount = 10 },
    },
    results = {
      { type = "item", name = "manis-boss-science-pack", amount = 30 },
    },
  }),

  -- ----------------------------
  -- Wood route (Industrial / Gleba-independent)
  -- (Basic/Mid only)
  -- ----------------------------
  make_recipe({
    name = "manis-boss-science-wood-basic",
    ingredients = {
      { type = "fluid", name = "manis-demolin-solution", amount = 1000 },
      { type = "item",  name = "wood", amount = 500 },
      { type = "item",  name = "manis-demolin-ore", amount = 20 },
    },
    results = {
      { type = "item", name = "manis-boss-science-pack", amount = 1 },
    },
  }),

  make_recipe({
    name = "manis-boss-science-wood-mid",
    ingredients = {
      { type = "fluid", name = "manis-demolin-solution", amount = 1000 },
      { type = "item",  name = "wood", amount = 1500 },
      { type = "item",  name = "manis-demolin-ore-speed", amount = 20 },
    },
    results = {
      { type = "item", name = "manis-boss-science-pack", amount = 3 },
    },
  }),
})