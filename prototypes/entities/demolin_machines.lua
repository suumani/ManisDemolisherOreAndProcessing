-- prototypes/entities/demolin_machines.lua
-- ----------------------------
-- Responsibility:
-- Creates placeable machine entities for Demolin processing by cloning vanilla machines.
-- Alpha approach: apply a simple tint to all sprite layers for easy visual identification.
-- ----------------------------

local function must_get_raw(type_name, name)
  local t = data.raw[type_name]
  if not t or not t[name] then
    error(("Missing prototype: data.raw[%q][%q]"):format(type_name, name))
  end
  return t[name]
end

local function clone_entity(base, new_name)
  local e = table.deepcopy(base)
  e.name = new_name
  return e
end

-- ----------------------------
-- Tint utility (alpha)
-- Applies tint broadly to any sprite-ish tables found.
-- This is intentionally "heavy-handed" for identification during alpha.
-- ----------------------------

local function is_sprite_table(tbl)
  if type(tbl) ~= "table" then return false end
  -- Common keys for sprite definitions
  return tbl.filename ~= nil
      or tbl.filenames ~= nil
      or tbl.stripes ~= nil
      or tbl.hr_version ~= nil
end

local function apply_tint_deep(obj, tint, visited)
  if type(obj) ~= "table" then return end
  visited = visited or {}
  if visited[obj] then return end
  visited[obj] = true

  if is_sprite_table(obj) then
    -- Do not overwrite an existing tint if already set (keep intentional tints)
    if obj.tint == nil then
      obj.tint = tint
    end
    -- Also apply to hr_version if present
    if type(obj.hr_version) == "table" then
      if obj.hr_version.tint == nil then
        obj.hr_version.tint = tint
      end
    end
  end

  for _, v in pairs(obj) do
    if type(v) == "table" then
      apply_tint_deep(v, tint, visited)
    end
  end
end

-- ----------------------------
-- Colors (alpha)
-- ----------------------------
local TINT_WATER = { r = 0.25, g = 0.75, b = 1.00, a = 1.0 } -- water-ish cyan
local TINT_CENTR = { r = 0.60, g = 1.00, b = 0.35, a = 1.0 } -- green-ish

-- ----------------------------
-- Demolin Water Refinery (oil-refinery clone)
-- ----------------------------
do
  local base = must_get_raw("assembling-machine", "oil-refinery")
  local ent = clone_entity(base, "manis-demolin-water-refinery")

  ent.minable = ent.minable or {}
  ent.minable.result = "manis-demolin-water-refinery"
  ent.crafting_categories = { "demolin-water-refining" }
  ent.fast_replaceable_group = "manis-demolin-water-refinery"
  ent.localised_name = { "entity-name.manis-demolin-water-refinery" }

  -- Alpha tint
  apply_tint_deep(ent, TINT_WATER)

  data:extend({ ent })
end

-- ----------------------------
-- Demolin Centrifuge (Space Age cryogenic chemical plant clone)
-- ----------------------------
do
  local BASE_CRYO_PLANT = "cryogenic-plant"
  local base = must_get_raw("assembling-machine", BASE_CRYO_PLANT)
  local ent = clone_entity(base, "manis-demolin-centrifuge")

  ent.minable = ent.minable or {}
  ent.minable.result = "manis-demolin-centrifuge"

  ent.crafting_categories = { "demolin-centrifuging" }
  ent.fast_replaceable_group = "manis-demolin-centrifuge"
  ent.localised_name = { "entity-name.manis-demolin-centrifuge" }

  apply_tint_deep(ent, TINT_CENTR)

  data:extend({ ent })
end