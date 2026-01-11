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