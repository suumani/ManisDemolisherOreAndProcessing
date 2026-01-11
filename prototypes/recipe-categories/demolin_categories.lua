-- prototypes/recipe-categories/demolin_categories.lua
-- ----------------------------
-- Responsibility:
-- Defines custom crafting categories for Demolin processing.
-- ----------------------------

data:extend({
  {
    type = "recipe-category",
    name = "demolin-water-refining",
  },
  {
    type = "recipe-category",
    name = "demolin-centrifuging", -- 先に用意（後で使う）
  },
})