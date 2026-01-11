-- data.lua
-- ----------------------------
-- Entry point for data stage.
-- Loads prototype definitions in a stable, incremental order.
-- ----------------------------

require("prototypes.recipe-categories.demolin_categories")

require("prototypes.items.demolin_ores")
require("prototypes.items.demolin_refined")
require("prototypes.items.demolin_packaging")
require("prototypes.items.machines")
require("prototypes.items.boss_science_pack")
require("prototypes.items.science_compressed")

require("prototypes.fluids.demolin_fluids")

-- Entities must exist before recipes are browsed in UI (and before place_result is used).
require("prototypes.entities.demolin_machines")

require("prototypes.recipes.machines")
require("prototypes.recipes.demolin_solution")
require("prototypes.recipes.demolin_breeding")
require("prototypes.recipes.demolin_recovery")
require("prototypes.recipes.demolin_smelting")
require("prototypes.recipes.demolin_packaging")
require("prototypes.recipes.boss_science_pack")
require("prototypes.recipes.science_compression")

require("prototypes.technologies.demolin_tech")