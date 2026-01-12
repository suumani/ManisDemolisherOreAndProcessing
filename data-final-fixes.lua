-- data-final-fixes.lua

-- ----------------------------
-- Adds "manis-boss-science-pack" to every lab's inputs.
-- This ensures compatibility with Space Age labs and any other mods that add labs.
-- ----------------------------

local PACK = "manis-boss-science-pack"

local function contains(tbl, value)
  for _, v in ipairs(tbl) do
    if v == value then return true end
  end
  return false
end

if data.raw and data.raw["lab"] then
  for lab_name, lab in pairs(data.raw["lab"]) do
    -- Some labs may not have inputs (rare), so guard.
    if lab and lab.inputs then
      if not contains(lab.inputs, PACK) then
        table.insert(lab.inputs, PACK)
      end
    end
  end
end

-- ------------------------------------------------------------
-- DROP_TABLE (source of truth)
-- values: { tungsten, iron, copper, demolin, speed, gigantic, king }
-- ------------------------------------------------------------
local D = require("__Manis_definitions__/shared/demolisher_names")

local DROP_TABLE = {
  -- normal series
  [D.SMALL]  = { tungsten=17, demolin=3 },
  [D.MEDIUM] = { tungsten=17, demolin=5 },
  [D.BIG]    = { tungsten=17, demolin=7 },

  -- additional normal series
  [D.MANIS_SMALL]  = { tungsten=17, demolin=3 },
  [D.MANIS_MEDIUM] = { tungsten=17, demolin=5 },
  [D.MANIS_BIG]    = { tungsten=17, demolin=7 },

  [D.MANIS_SMALL_ALT]  = { tungsten=3, iron=15, copper=15, demolin=3 },
  [D.MANIS_MEDIUM_ALT] = { tungsten=5, iron=15, copper=15, demolin=5 },
  [D.MANIS_BIG_ALT]    = { tungsten=7, iron=15, copper=15, demolin=7 },

  -- behemoth
  [D.MANIS_BEHEMOTH]     = { tungsten=17, demolin=9 },
  [D.MANIS_BEHEMOTH_ALT] = { tungsten=9, iron=15, copper=15, demolin=9 },

  -- speedstar-demolisher series
  [D.MANIS_SPEEDSTAR_SMALL]    = { tungsten=17, demolin=3, speed=3 },
  [D.MANIS_SPEEDSTAR_MEDIUM]   = { tungsten=17, demolin=5, speed=5 },
  [D.MANIS_SPEEDSTAR_BIG]      = { tungsten=17, demolin=7, speed=7 },
  [D.MANIS_SPEEDSTAR_BEHEMOTH] = { tungsten=17, demolin=9, speed=9 },

  [D.MANIS_SPEEDSTAR_SMALL_ALT]    = { tungsten=3, iron=15, copper=15, demolin=3, speed=3 },
  [D.MANIS_SPEEDSTAR_MEDIUM_ALT]   = { tungsten=5, iron=15, copper=15, demolin=5, speed=5 },
  [D.MANIS_SPEEDSTAR_BIG_ALT]      = { tungsten=7, iron=15, copper=15, demolin=7, speed=7 },
  [D.MANIS_SPEEDSTAR_BEHEMOTH_ALT] = { tungsten=9, iron=15, copper=15, demolin=9, speed=9 },

  -- gigantic-demolisher series
  [D.MANIS_GIGANTIC_SMALL]    = { tungsten=17, demolin=3, gigantic=3 },
  [D.MANIS_GIGANTIC_MEDIUM]   = { tungsten=17, demolin=5, gigantic=5 },
  [D.MANIS_GIGANTIC_BIG]      = { tungsten=17, demolin=7, gigantic=7 },
  [D.MANIS_GIGANTIC_BEHEMOTH] = { tungsten=17, demolin=9, gigantic=9 },

  [D.MANIS_GIGANTIC_SMALL_ALT]    = { tungsten=9, iron=15, copper=15, demolin=3, gigantic=3 },
  [D.MANIS_GIGANTIC_MEDIUM_ALT]   = { tungsten=9, iron=15, copper=15, demolin=5, gigantic=5 },
  [D.MANIS_GIGANTIC_BIG_ALT]      = { tungsten=9, iron=15, copper=15, demolin=7, gigantic=7 },
  [D.MANIS_GIGANTIC_BEHEMOTH_ALT] = { tungsten=9, iron=15, copper=15, demolin=9, gigantic=9 },

  -- crazy-king-demolisher series
  [D.MANIS_CRAZY_KING]     = { tungsten=17, demolin=9, speed=9, gigantic=9, king=9 },
  [D.MANIS_CRAZY_KING_ALT] = { tungsten=9, iron=15, copper=15, demolin=9, speed=9, gigantic=9, king=9 },
}

local function item_exists(name)
  return (data.raw["item"] and data.raw["item"][name])
      or (data.raw["tool"] and data.raw["tool"][name])
      or (data.raw["capsule"] and data.raw["capsule"][name])
end

local function filter_existing_results(results)
  local out = {}
  for _, r in ipairs(results) do
    if r.type == "item" and item_exists(r.name) then
      table.insert(out, r)
    end
  end
  return out
end

local function build_results_from_table(base_name)
  local row = DROP_TABLE[base_name]
  if not row then
    return nil
  end

  local results = {}

  local function add_item(item_name, amount)
    if amount and amount > 0 and item_exists(item_name) then
      table.insert(results, { type="item", name=item_name, amount=amount })
    end
  end

  add_item("tungsten-ore", row.tungsten)
  add_item("iron-ore", row.iron)
  add_item("copper-ore", row.copper)

  add_item("manis-demolin-ore", row.demolin)
  add_item("manis-demolin-ore-speed", row.speed)
  add_item("manis-demolin-ore-gigantic", row.gigantic)
  add_item("manis-demolin-ore-king", row.king)

  return results
end

-- ----------------------------
-- Demolisher remains ("<base_name>-corpse") drops override
-- Space Age demolisher creates an entity on death, not a real "corpse" prototype.
-- ----------------------------


local function set_minable_results(proto, mining_time, results)
  if type(proto.minable) ~= "table" then proto.minable = {} end
  proto.minable.mining_time = mining_time or proto.minable.mining_time or 3
  proto.minable.results = results
end

local ok, D = pcall(require, "__Manis_definitions__/shared/demolisher_names")
if not ok or type(D) ~= "table" or type(D.ALL) ~= "table" then
  log("DEMOLIN: demolisher_names missing; remains patch skipped")
  return
end

-- Classify by name (same as before)
local function is_speedstar(name) return name:find("speedstar", 1, true) ~= nil end
local function is_gigantic(name)  return name:find("gigantic",  1, true) ~= nil end
local function is_king(name)      return name:find("king",      1, true) ~= nil end

local function size_key(name)
  if name:find("behemoth", 1, true) ~= nil then return "behemoth" end
  if name:find("small",    1, true) ~= nil then return "small" end
  if name:find("medium",   1, true) ~= nil then return "medium" end
  if name:find("big",      1, true) ~= nil then return "big" end
  return "medium"
end

-- Tune later
local BASE_AMT  = { small = 12, medium = 20, big = 30, behemoth = 45 }
local SPEED_AMT = { small = 1,  medium = 2,  big = 3,  behemoth = 5 }
local GIGA_AMT  = { small = 1,  medium = 2,  big = 3,  behemoth = 5 }
local KING_AMT  = { small = 0,  medium = 0,  big = 0,  behemoth = 1 }
local MINING_TIME = { small = 2, medium = 3, big = 4, behemoth = 5 }

local function build_results(demo_name)
  local s = size_key(demo_name)
  local results = {}

  table.insert(results, { type="item", name="manis-demolin-ore", amount = BASE_AMT[s] or 20 })

  if is_speedstar(demo_name) then
    table.insert(results, { type="item", name="manis-demolin-ore-speed", amount = SPEED_AMT[s] or 2 })
  end
  if is_gigantic(demo_name) then
    table.insert(results, { type="item", name="manis-demolin-ore-gigantic", amount = GIGA_AMT[s] or 2 })
  end
  if is_king(demo_name) then
    local k = KING_AMT[s] or 1
    if k > 0 then
      table.insert(results, { type="item", name="manis-demolin-ore-king", amount = k })
    end
  end

  return filter_existing_results(results), (MINING_TIME[s] or 3)
end

local function extract_remains_name_from_dying_effect(su)
  local eff = su.dying_trigger_effect
  if type(eff) ~= "table" then return nil end

  -- dying_trigger_effect は配列で複数エフェクトが入る
  for _, e in ipairs(eff) do
    if type(e) == "table" and e.type == "create-entity" and type(e.entity_name) == "string" then
      return e.entity_name
    end
  end
  return nil
end

local function find_remains_proto(remains_name)
  -- The "corpse" created is usually a minable entity, not data.raw["corpse"].
  local candidates = {
    "simple-entity-with-owner",
    "simple-entity-with-force",
    "simple-entity",
    "corpse", -- keep as fallback
  }
  for _, tn in ipairs(candidates) do
    local t = data.raw[tn]
    if t and t[remains_name] then
      return tn, t[remains_name]
    end
  end
  return nil, nil
end

local patched = 0
local missing_remains = 0
local missing_proto = 0
local missing_table = 0

for _, base_name in ipairs(D.ALL) do
  local su = data.raw["segmented-unit"] and data.raw["segmented-unit"][base_name]
  if su then
    local remains_name = extract_remains_name_from_dying_effect(su)

    -- フォールバック（公式系列ならこれで当たる）
    if not remains_name then
      remains_name = base_name .. "-corpse"
    end

    local tn, proto = find_remains_proto(remains_name)
    if proto then
      local results = build_results_from_table(base_name) -- ←あなたのDROP_TABLE版
      if results and #results > 0 then
        set_minable_results(proto, 3, results)
        patched = patched + 1
      end
    else
      missing_remains = missing_remains + 1
      -- 必要なら一時ログ：
      -- log("DEMOLIN: remains not found: " .. tostring(base_name) .. " -> " .. tostring(remains_name))
    end
  end
end

log("DEMOLIN: patched remains=" .. patched .. " missing_remains=" .. missing_remains)