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
    icon = args.icon,
    icon_size = 64,

    order = args.order, -- ✅

    ingredients = args.ingredients,
    results = args.results,
  }
end

data:extend({
  make_recipe({
    name = "manis-demolin-pack-base",
    order = "z[demolin]-e[pack]-a[base]",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-pack.png",
    ingredients = {
      { type="item", name="manis-demolin-refined", amount=1 },
      { type="item", name="iron-plate", amount=10 },
      { type="fluid", name="sulfuric-acid", amount=10 },
    },
    results = { { type="item", name="manis-demolin-pack", amount=1 } },
  }),
  make_recipe({
    name = "manis-demolin-pack-speed",
    order = "z[demolin]-e[pack]-b[speed]",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-pack-speed.png",
    ingredients = {
      { type="item", name="manis-demolin-refined-speed", amount=1 },
      { type="item", name="iron-plate", amount=10 },
      { type="fluid", name="sulfuric-acid", amount=10 },
    },
    results = { { type="item", name="manis-demolin-pack-speed", amount=1 } },
  }),
  make_recipe({
    name = "manis-demolin-pack-gigantic",
    order = "z[demolin]-e[pack]-c[gigantic]",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-pack-gigantic.png",
    ingredients = {
      { type="item", name="manis-demolin-refined-gigantic", amount=1 },
      { type="item", name="iron-plate", amount=10 },
      { type="fluid", name="sulfuric-acid", amount=10 },
    },
    results = { { type="item", name="manis-demolin-pack-gigantic", amount=1 } },
  }),
  make_recipe({
    name = "manis-demolin-pack-king",
    order = "z[demolin]-e[pack]-d[king]",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-pack-king.png",
    ingredients = {
      { type="item", name="manis-demolin-refined-king", amount=1 },
      { type="item", name="iron-plate", amount=10 },
      { type="fluid", name="sulfuric-acid", amount=10 },
    },
    results = { { type="item", name="manis-demolin-pack-king", amount=1 } },
  }),
})