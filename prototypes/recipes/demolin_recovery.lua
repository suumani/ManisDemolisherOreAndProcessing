-- prototypes/recipes/demolin_recovery.lua
-- ----------------------------
-- Responsibility:
-- Defines base Demolin ore recovery loop using Demolin Wastewater.
-- Runs in Chemical Plant category ("chemistry").
-- ----------------------------

data:extend({
  {
    type = "recipe",
    name = "manis-demolin-ore-recovery",
    category = "chemistry",
    enabled = false,
    energy_required = 10,
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-ore.png",
    icon_size = 64,

    order = "z[demolin]-c[recovery]-a[loop]", -- ✅

    ingredients = {
      { type="item", name="manis-demolin-ore", amount=5 },
      { type="fluid", name="manis-demolin-wastewater", amount=1300 },
      { type="fluid", name="sulfuric-acid", amount=300 },
    },
    results = {
      { type="item", name="manis-demolin-ore", amount=6 },
      { type="fluid", name="manis-demolin-wastewater", amount=400 },
      { type="fluid", name="water", amount=1200 },
    },
  }
})