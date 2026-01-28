-- __ManisDemolisherOreAndProcessing__/prototypes/technology/manis_demolisher_cap_down.lua
data:extend({
  {
    type = "technology",
    name = "manis-demolisher-cap-down",

    icon = "__ManisDemolisherOreAndProcessing__/graphics/technology/manis_demolisher_cap_down.png",
    icon_size = 256,

    -- 無限研究
    max_level = "infinite",
    upgrade = true,

    -- “終盤の快適化”なので軽くしない（1000開始、×2）
    unit = {
      count_formula = "1000*2^(L-1)",
      time = 60,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},

        -- Space Age packs（低温まで）
        {"metallurgic-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"cryogenic-science-pack", 1},

        -- このModの追加パック
        {"manis-boss-science-pack", 1},
      }
    },

    -- 研究効果は「スクリプトが level を読む」だけなので effects は空でOK
    effects = {},

    -- 前提は “低温まで到達済み” を自然に要求
    prerequisites = { "cryogenic-science-pack" },

    order = "z[manis]-z[demolisher]-cap-down"
  }
})