-- prototypes/items/demolin_packaging.lua
-- ----------------------------
-- Responsibility:
-- Defines packaging materials used exclusively for science pack compression.
-- Not intended for other purposes.
-- ----------------------------
local function make_item(args)
  return {
    type = "item",
    name = args.name,
    icon = args.icon,
    icon_size = args.icon_size or 64,
    stack_size = args.stack_size or 200,
    subgroup = args.subgroup or "intermediate-product",
    order = args.order,
  }
end

data:extend({
  make_item({
    name = "manis-demolin-pack",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-pack.png",
    order = "z[demolin]-i[demolin-pack]",
  }),
  make_item({
    name = "manis-demolin-pack-speed",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-pack-speed.png",
    order = "z[demolin]-j[demolin-pack-speed]",
  }),
  make_item({
    name = "manis-demolin-pack-gigantic",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-pack-gigantic.png",
    order = "z[demolin]-k[demolin-pack-gigantic]",
  }),
  make_item({
    name = "manis-demolin-pack-king",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-pack-king.png",
    order = "z[demolin]-l[demolin-pack-king]",
  }),
})