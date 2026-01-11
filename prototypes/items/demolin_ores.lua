-- prototypes/items/demolin_ores.lua
-- ----------------------------
-- Responsibility:
-- Defines the 4 tiers of Demolin ores as items.
-- These are core resources used by later recipes (solution, breeding, smelting, boss science).
-- ----------------------------

local function make_ore_item(args)
  return {
    type = "item",
    name = args.name,
    icon = args.icon,
    icon_size = args.icon_size or 64,
    stack_size = args.stack_size or 100,

    -- Keep it simple for now. We can later introduce a dedicated subgroup/order.
    subgroup = args.subgroup or "raw-resource",
    order = args.order or "z[demolin]-a[base]",

    -- If you want these to be affected by productivity modules etc later, keep as item.
  }
end

data:extend({
  make_ore_item({
    name = "manis-demolin-ore",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-ore.png",
    order = "z[demolin]-a[demolin-ore]",
  }),
  make_ore_item({
    name = "manis-demolin-ore-speed",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-ore-speed.png",
    order = "z[demolin]-b[demolin-ore-speed]",
  }),
  make_ore_item({
    name = "manis-demolin-ore-gigantic",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-ore-gigantic.png",
    order = "z[demolin]-c[demolin-ore-gigantic]",
  }),
  make_ore_item({
    name = "manis-demolin-ore-king",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-ore-king.png",
    order = "z[demolin]-d[demolin-ore-king]",
  }),
})