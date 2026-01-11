-- prototypes/items/machines.lua
-- ----------------------------
-- Responsibility:
-- Defines placeable items (place_result placeholders) for demolin processing machines.
-- Entities will be defined later (color-variant clones of vanilla machines).
-- ----------------------------
local function make_machine_item(args)
  return {
    type = "item",
    name = args.name,
    icon = args.icon,
    icon_size = args.icon_size or 64,
    stack_size = args.stack_size or 20,

    subgroup = args.subgroup or "production-machine",
    order = args.order,

    place_result = args.place_result,
  }
end

data:extend({
  make_machine_item({
    name = "manis-demolin-water-refinery",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-water-refinery.png",
    order = "z[demolin]-o[demolin-water-refinery]",
    place_result = "manis-demolin-water-refinery", -- entity to be added later
  }),
  make_machine_item({
    name = "manis-demolin-centrifuge",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-centrifuge.png",
    order = "z[demolin]-p[demolin-centrifuge]",
    place_result = "manis-demolin-centrifuge", -- entity to be added later
  }),
})