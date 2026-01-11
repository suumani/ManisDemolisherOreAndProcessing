-- prototypes/recipes/demolin_packaging.lua
-- ----------------------------
-- Responsibility:
-- Defines packaging material recipes for science compression.
-- Packaging is compression-only by design.
-- ----------------------------

local function make_recipe(args)
  return {
    type = "recipe",
    name = args.name,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = args.energy_required or 5,
    ingredients = args.ingredients,
    results = args.results,
  }
end

data:extend({
  -- Base pack
  make_recipe({
    name = "manis-demolin-pack-base",
    ingredients = {
      { type = "item",  name = "manis-demolin-refined", amount = 1 },
      { type = "item",  name = "iron-plate", amount = 10 },
      { type = "fluid", name = "sulfuric-acid", amount = 10 },
    },
    results = {
      { type = "item", name = "manis-demolin-pack", amount = 1 },
    },
  }),

  -- Speed pack
  make_recipe({
    name = "manis-demolin-pack-speed",
    ingredients = {
      { type = "item",  name = "manis-demolin-refined-speed", amount = 1 },
      { type = "item",  name = "iron-plate", amount = 10 },
      { type = "fluid", name = "sulfuric-acid", amount = 10 },
    },
    results = {
      { type = "item", name = "manis-demolin-pack-speed", amount = 1 },
    },
  }),

  -- Gigantic pack
  make_recipe({
    name = "manis-demolin-pack-gigantic",
    ingredients = {
      { type = "item",  name = "manis-demolin-refined-gigantic", amount = 1 },
      { type = "item",  name = "iron-plate", amount = 10 },
      { type = "fluid", name = "sulfuric-acid", amount = 10 },
    },
    results = {
      { type = "item", name = "manis-demolin-pack-gigantic", amount = 1 },
    },
  }),

  -- King pack
  make_recipe({
    name = "manis-demolin-pack-king",
    ingredients = {
      { type = "item",  name = "manis-demolin-refined-king", amount = 1 },
      { type = "item",  name = "iron-plate", amount = 10 },
      { type = "fluid", name = "sulfuric-acid", amount = 10 },
    },
    results = {
      { type = "item", name = "manis-demolin-pack-king", amount = 1 },
    },
  }),
})