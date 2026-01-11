-- prototypes/items/boss_science_pack.lua
-- ----------------------------
-- Responsibility:
-- Defines the Boss Science Pack as a tool item used for research.
-- ----------------------------

data:extend({
  {
    type = "tool",
    name = "manis-boss-science-pack",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/boss-science-pack.png",
    icon_size = 64,

    subgroup = "science-pack",
    order = "z[demolin]-q[boss-science-pack]",

    stack_size = 200,
    durability = 1, -- science packs typically use durability=1 and are consumed by research
  }
})