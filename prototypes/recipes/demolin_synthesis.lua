-- prototypes/recipes/demolin_synthesis.lua
-- ----------------------------
-- Responsibility:
-- Defines heavy synthesis recipes for ores that are not intended to be obtained by boss drops.
-- Executed in Demolin Centrifuge via the custom category "demolin-centrifuging".
-- ----------------------------
local function make_recipe(args)
  return {
    type = "recipe",
    name = args.name,
    category = "demolin-centrifuging",
    enabled = false,
    energy_required = args.energy_required or 120, -- ★激重

    icon = args.icon,
    icon_size = 64,

    order = args.order,

    ingredients = args.ingredients,
    results = args.results,
  }
end

data:extend({
  -- Gigant Demolin Ore synthesis
  make_recipe({
    name = "manis-demolin-synth-gigantic",
    order = "z[demolin]-c[synth]-c[gigantic]",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-ore-gigantic.png",
    ingredients = {
      { type="item",  name="tungsten-ore",          amount=400 },
      { type="item",  name="manis-demolin-ore",     amount=400 },
      { type="item",  name="manis-demolin-ore-speed", amount=100 },
      { type="fluid", name="sulfuric-acid",         amount=800 },
    },
    results = {
      { type="item",  name="manis-demolin-ore-gigantic", amount=3 },
      { type="fluid", name="manis-demolin-wastewater",   amount=700 },
      { type="fluid", name="water",                      amount=100 },
    },
  }),

  -- King Demolin Ore synthesis
  make_recipe({
    name = "manis-demolin-synth-king",
    order = "z[demolin]-c[synth]-d[king]",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-ore-king.png",
    ingredients = {
      { type="item",  name="manis-demolin-ore",          amount=400 },
      { type="item",  name="manis-demolin-ore-gigantic", amount=400 },
      { type="item",  name="manis-demolin-ore-speed",    amount=100 },
      { type="fluid", name="sulfuric-acid",              amount=800 },
    },
    results = {
      -- ★重要：キング鉱石を出す（巨大鉱石3ではない）
      { type="item",  name="manis-demolin-ore-king",     amount=1 },
      { type="fluid", name="manis-demolin-wastewater",   amount=900 },
      { type="fluid", name="water",                      amount=100 },
    },
  }),
})