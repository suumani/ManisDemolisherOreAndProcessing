-- prototypes/recipes/machines.lua
-- ----------------------------
-- Responsibility:
-- Defines crafting recipes for demolin processing machines.
-- Entities are added later; these recipes currently produce the machine items.
-- ----------------------------

local function make_recipe(args)
  return {
    type = "recipe",
    name = args.name,
    enabled = args.enabled or false,
    energy_required = args.energy_required or 5,
    ingredients = args.ingredients,
    results = args.results,
    category = args.category, -- typically nil for normal crafting
  }
end

data:extend({
  make_recipe({
    name = "manis-demolin-water-refinery",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "oil-refinery", amount = 1 },
      { type = "item", name = "pipe", amount = 20 },
      { type = "item", name = "steel-plate", amount = 50 },
    },
    results = {
      { type = "item", name = "manis-demolin-water-refinery", amount = 1 },
    },
  }),
  make_recipe({
    name = "manis-demolin-centrifuge",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "centrifuge", amount = 1 },
      { type = "item", name = "advanced-circuit", amount = 20 },
      { type = "item", name = "steel-plate", amount = 50 },
    },
    results = {
      { type = "item", name = "manis-demolin-centrifuge", amount = 1 },
    },
  }),
})