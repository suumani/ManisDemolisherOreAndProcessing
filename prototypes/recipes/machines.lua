-- prototypes/recipes/machines.lua
-- ----------------------------
-- Responsibility:
-- Defines crafting recipes for demolin processing machines.
-- Entities are added later; these recipes currently produce the machine items.
-- ----------------------------

local TEST_ICON = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-ore.png"
local TEST_ICON_SIZE = 64

local function make_recipe(args)
  return {
    type = "recipe",
    name = args.name,
    enabled = args.enabled or false,
    energy_required = args.energy_required or 5,
    icon = args.icon or TEST_ICON,
    icon_size = args.icon_size or TEST_ICON_SIZE,

    order = args.order, -- ✅

    ingredients = args.ingredients,
    results = args.results,
  }
end

data:extend({
  make_recipe({
    name = "manis-demolin-water-refinery",
    order = "z[demolin]-h[machine]-a[water-refinery]",
    ingredients = {
      { type="item", name="oil-refinery", amount=1 },
      { type="item", name="pipe", amount=20 },
      { type="item", name="steel-plate", amount=50 },
    },
    results = { { type="item", name="manis-demolin-water-refinery", amount=1 } },
  }),
  make_recipe({
    name = "manis-demolin-centrifuge",
    order = "z[demolin]-h[machine]-b[centrifuge]",
    ingredients = {
      { type="item", name="centrifuge", amount=1 },
      { type="item", name="advanced-circuit", amount=20 },
      { type="item", name="steel-plate", amount=50 },
    },
    results = { { type="item", name="manis-demolin-centrifuge", amount=1 } },
  }),
})
