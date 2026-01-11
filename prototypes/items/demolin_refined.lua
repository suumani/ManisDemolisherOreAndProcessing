-- prototypes/items/demolin_refined.lua
-- ----------------------------
-- Responsibility:
-- Defines refined demolin products (tiered) used for packaging and downstream recipes.
-- ----------------------------
local function make_item(args)
  return {
    type = "item",
    name = args.name,
    icon = args.icon,
    icon_size = args.icon_size or 64,
    stack_size = args.stack_size or 100,
    subgroup = args.subgroup or "intermediate-product",
    order = args.order,
  }
end

data:extend({
  make_item({
    name = "manis-demolin-refined",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-refined.png",
    order = "z[demolin]-e[demolin-refined]",
  }),
  make_item({
    name = "manis-demolin-refined-speed",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-refined-speed.png",
    order = "z[demolin]-f[demolin-refined-speed]",
  }),
  make_item({
    name = "manis-demolin-refined-gigantic",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-refined-gigantic.png",
    order = "z[demolin]-g[demolin-refined-gigantic]",
  }),
  make_item({
    name = "manis-demolin-refined-king",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-refined-king.png",
    order = "z[demolin]-h[demolin-refined-king]",
  }),
})