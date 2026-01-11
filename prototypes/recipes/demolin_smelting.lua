-- prototypes/recipes/demolin_smelting.lua
-- ----------------------------
-- Responsibility:
-- Defines smelting recipes for Demolin ores using Foundry-compatible category.
-- Inputs: Demolin ore + molten iron/copper
-- Outputs: tiered refined demolin items.
-- ----------------------------

local function make_recipe(args)
  return {
    type = "recipe",
    name = args.name,
    category = "metallurgy",
    enabled = false,
    energy_required = args.energy_required or 10,
    icon = args.icon,
    icon_size = 64,

    order = args.order, -- ✅

    ingredients = args.ingredients,
    results = args.results,
  }
end

data:extend({
  make_recipe({
    name = "manis-demolin-smelt-base",
    order = "z[demolin]-d[smelt]-a[base]",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-refined.png",
    ingredients = {
      { type="item", name="manis-demolin-ore", amount=1 },
      { type="fluid", name="molten-iron", amount=20 },
      { type="fluid", name="molten-copper", amount=10 },
    },
    results = { { type="item", name="manis-demolin-refined", amount=1 } },
  }),
  make_recipe({
    name = "manis-demolin-smelt-speed",
    order = "z[demolin]-d[smelt]-b[speed]",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-refined-speed.png",
    ingredients = {
      { type="item", name="manis-demolin-ore-speed", amount=1 },
      { type="fluid", name="molten-iron", amount=20 },
      { type="fluid", name="molten-copper", amount=10 },
    },
    results = { { type="item", name="manis-demolin-refined-speed", amount=1 } },
  }),
  make_recipe({
    name = "manis-demolin-smelt-gigantic",
    order = "z[demolin]-d[smelt]-c[gigantic]",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-refined-gigantic.png",
    ingredients = {
      { type="item", name="manis-demolin-ore-gigantic", amount=1 },
      { type="fluid", name="molten-iron", amount=20 },
      { type="fluid", name="molten-copper", amount=10 },
    },
    results = { { type="item", name="manis-demolin-refined-gigantic", amount=1 } },
  }),
  make_recipe({
    name = "manis-demolin-smelt-king",
    order = "z[demolin]-d[smelt]-d[king]",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-refined-king.png",
    ingredients = {
      { type="item", name="manis-demolin-ore-king", amount=1 },
      { type="fluid", name="molten-iron", amount=20 },
      { type="fluid", name="molten-copper", amount=10 },
    },
    results = { { type="item", name="manis-demolin-refined-king", amount=1 } },
  }),
})
