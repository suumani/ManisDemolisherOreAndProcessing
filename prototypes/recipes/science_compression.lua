-- prototypes/recipes/science_compression.lua
-- ----------------------------
-- Responsibility:
-- Defines compression/unpacking recipes for all supported science packs.
-- Compression uses demolin packaging items (tiered):
--   base -> speed -> gigantic -> king
-- ----------------------------

local SCIENCE_PACKS = {
  { key = "automation",      base_item = "automation-science-pack" },
  { key = "logistic",        base_item = "logistic-science-pack" },
  { key = "military",        base_item = "military-science-pack" },
  { key = "chemical",        base_item = "chemical-science-pack" },
  { key = "production",      base_item = "production-science-pack" },
  { key = "utility",         base_item = "utility-science-pack" },
  { key = "space",           base_item = "space-science-pack" },

  { key = "metallurgic",     base_item = "metallurgic-science-pack" },
  { key = "agricultural",    base_item = "agricultural-science-pack" },
  { key = "electromagnetic", base_item = "electromagnetic-science-pack" },
  { key = "cryogenic",       base_item = "cryogenic-science-pack" },
  { key = "promethium",      base_item = "promethium-science-pack" },

  { key = "boss",            base_item = "manis-boss-science-pack" },
}

local STAGES = {
  { key = "compressed",       pack = "manis-demolin-pack",          prev = nil },
  { key = "high-compressed",  pack = "manis-demolin-pack-speed",    prev = "compressed" },
  { key = "ultra-compressed", pack = "manis-demolin-pack-gigantic", prev = "high-compressed" },
  { key = "ultimate",         pack = "manis-demolin-pack-king",     prev = "ultra-compressed" },
}

local function compressed_item_name(stage_key, science_key)
  return ("manis-%s-%s-pack"):format(stage_key, science_key)
end

local function make_recipe(name, ingredients, results, energy)
  return {
    type = "recipe",
    name = name,
    enabled = false,
    energy_required = energy or 5,

    ingredients = ingredients,
    results = results,
  }
end

local recipes = {}

for _, s in ipairs(SCIENCE_PACKS) do
  -- ----------------------------
  -- Compression (10 -> 1) x4 stages
  -- ----------------------------
  for i, st in ipairs(STAGES) do
    local input_name = (i == 1) and s.base_item or compressed_item_name(STAGES[i-1].key, s.key)
    local output_name = compressed_item_name(st.key, s.key)

    table.insert(recipes, make_recipe(
      ("manis-compress-%s-%s"):format(s.key, st.key),
      {
        { type = "item", name = input_name, amount = 10 },
        { type = "item", name = st.pack, amount = 1 },
      },
      {
        { type = "item", name = output_name, amount = 1 },
      },
      5
    ))
  end

  -- ----------------------------
  -- Unpacking (1 -> 10) x4 stages
  -- ultimate -> ultra -> high -> compressed -> base
  -- ----------------------------
  for i = #STAGES, 1, -1 do
    local st = STAGES[i]
    local input_name = compressed_item_name(st.key, s.key)

    local output_name
    if i == 1 then
      output_name = s.base_item
    else
      output_name = compressed_item_name(STAGES[i-1].key, s.key)
    end

    table.insert(recipes, make_recipe(
      ("manis-unpack-%s-%s"):format(s.key, st.key),
      {
        { type = "item", name = input_name, amount = 1 },
      },
      {
        { type = "item", name = output_name, amount = 10 },
      },
      2
    ))
  end
end

data:extend(recipes)