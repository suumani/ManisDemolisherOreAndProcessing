-- prototypes/fluids/demolin_fluids.lua
-- ----------------------------
-- Responsibility:
-- Defines core fluids for the Demolin processing chain:
-- - Demolin Solution (main input for boss science)
-- - Demolin Wastewater (high-volume byproduct; intentionally no "final disposal" recipe)
-- ----------------------------
local function make_fluid(args)
  return {
    type = "fluid",
    name = args.name,
    icon = args.icon,
    icon_size = args.icon_size or 64,

    base_color = args.base_color,
    flow_color = args.flow_color,

    default_temperature = args.default_temperature or 25,
    max_temperature = args.max_temperature or 100,

    -- ✅ safest format: J only (no prefixes, no /K)
    heat_capacity = args.heat_capacity or "200J",

    order = args.order,
  }
end

data:extend({
  make_fluid({
    name = "manis-demolin-solution",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-solution.png",
    base_color = { r = 0.20, g = 0.70, b = 0.85 },
    flow_color = { r = 0.20, g = 0.90, b = 1.00 },
    order = "z[demolin]-m[demolin-solution]",
  }),
  make_fluid({
    name = "manis-demolin-wastewater",
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/demolin-wastewater.png",
    base_color = { r = 0.25, g = 0.25, b = 0.25 },
    flow_color = { r = 0.45, g = 0.45, b = 0.45 },
    order = "z[demolin]-n[demolin-wastewater]",
  }),
})