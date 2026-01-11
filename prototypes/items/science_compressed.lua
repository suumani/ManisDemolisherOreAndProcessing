-- prototypes/items/science_compressed.lua
-- ----------------------------
-- Responsibility:
-- Defines compressed science packs as plain items (NOT tools).
-- This ensures compressed packs are NOT recognized as science packs by labs/research.
-- ----------------------------

local STAGES = {
  { key = "compressed",      order = "a" },
  { key = "high-compressed", order = "b" },
  { key = "ultra-compressed",order = "c" },
  { key = "ultimate",        order = "d" },
}

-- Target science packs:
-- Base game + Space Age + this mod's boss science.
local SCIENCE_PACKS = {
  { key = "automation",      base_item = "automation-science-pack" },
  { key = "logistic",        base_item = "logistic-science-pack" },
  { key = "military",        base_item = "military-science-pack" },
  { key = "chemical",        base_item = "chemical-science-pack" },
  { key = "production",      base_item = "production-science-pack" },
  { key = "utility",         base_item = "utility-science-pack" },
  { key = "space",           base_item = "space-science-pack" },

  -- Space Age packs
  { key = "metallurgic",     base_item = "metallurgic-science-pack" },
  { key = "agricultural",    base_item = "agricultural-science-pack" },
  { key = "electromagnetic", base_item = "electromagnetic-science-pack" },
  { key = "cryogenic",       base_item = "cryogenic-science-pack" },
  { key = "promethium",      base_item = "promethium-science-pack" },

  -- This mod
  { key = "boss",            base_item = "manis-boss-science-pack" },
}

local function make_compressed_item(science_key, stage_key, order_stage)
  return {
    type = "item",
    name = ("manis-%s-%s-pack"):format(stage_key, science_key),
    icon = "__ManisDemolisherOreAndProcessing__/graphics/icons/science/" .. stage_key .. "-" .. science_key .. "-science-pack.png",
    icon_size = 64,

    stack_size = 200,
    subgroup = "intermediate-product",
    order = ("z[demolin]-r[science]-"..order_stage.."[%s-%s]"):format(stage_key, science_key),
  }
end

local items = {}

for _, s in ipairs(SCIENCE_PACKS) do
  for _, st in ipairs(STAGES) do
    table.insert(items, make_compressed_item(s.key, st.key, st.order))
  end
end

data:extend(items)