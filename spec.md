# __ManisDemolisherOreAndProcessing/spec.md

# Mani's Demolisher Ore And Processing — Specification (spec v0.0.6)

This document records the **design intent, specifications, and agreed principles** of Mani's Demolisher Ore And Processing.  
Its purpose is to preserve decisions, judgment criteria, and priority rules that are **not** described in the README or on the Mod Portal.

---

## 0. Goals and Non-goals

### 0.1 Goals (Purpose)
- To provide content focused on **rewards, production, and UPS improvement**, triggered by defeating boss Demolishers
- To deliver endgame content centered on **production structures, logistics, and compression**, rather than weapon additions
- To avoid forcing grind, reruns, or RNG, and instead make **factory line construction** the primary objective

### 0.2 Non-goals
- To focus on direct weapon upgrades or increases in combat power
- To require repetitive farming or grinding loops
- To introduce an unbounded number of fluids or intermediate products  
  (they are intentionally kept within a manageable range)

---

## 1. Mod Positioning

### 1.1 Required Dependencies
- Manis_lib (shared utilities)
- Manis_definitions (Demolisher definitions)

### 1.2 Optional Dependency
- Mani's Boss Demolisher  
  - If installed, higher-tier Demolin ores (speed / gigantic / king) can be obtained naturally  
  - If not installed, this mod is intentionally limited to production lines centered on **basic Demolin ore**, and any elements that require higher-tier Demolin ores are **not available by design**  
  - Therefore, this mod does **not** aim for “full completion” on its own; higher-tier ores are treated as an extension provided by the boss mod

### 1.3 Role
- The primary reward is not “loot from kills,” but rather **lighter factories and more refined production structures**

---

## 2. Demolin Ore Series (Fixed)

### 2.1 Ore Types
- Demolin Ore (basic)
- Speed Demolin Ore (speedstar)
- Gigantic Demolin Ore (gigantic)
- King Demolin Ore (king)

### 2.2 Drop Policy
- Normal / Speed / Gigantic: probabilistic drops
- King: 100% guaranteed drop
- No forced grinding (supply is achievable through breeding, catalysts, and circulation)

---

## 2.x Demolisher Population Control Research (Added)

### 2.x.1 Scope of Responsibility

This mod introduces **research related to Demolisher population control**,  
but **does not directly enforce or apply any population cap** by itself.

Actual population limits are:
- Calculated and enforced by other mods (e.g. BossDemolisher, BreedingDemolisher, TrueFulgoraConqueror)
- Applied at spawn / virtual materialization points
- Evaluated per planet and per context

This mod’s role is strictly limited to **providing the research unlock and its parameters**.

---

### 2.3.2 Research Definition

- Research name: `manis-demolisher-cap-down`
- Type: Infinite research
- Effect:
  - Reduces the effective Demolisher population cap
  - Reduction is linear per research level
  - Maximum reduction is capped (e.g. −75%)

This research does **not**:
- Remove Demolishers
- Prevent spawns directly
- Apply hard limits inside this mod

---

### 2.3.3 Design Intent

The purpose of this research is to:
- Provide a **production-driven response** to Demolisher pressure
- Allow factory progression and logistics optimization to influence enemy pressure
- Keep population control **decoupled** from combat mechanics

By placing this research in a production-focused mod:
- Combat mods remain focused on threat behavior
- Production mods provide strategic, indirect control
- Responsibility boundaries between mods remain explicit and stable

---

### 2.3.4 Compatibility Policy

- This research is intentionally generic
- Other mods may:
  - Interpret its level differently
  - Apply different minimum caps (e.g. Boss: 10 / Breeding: 50 / Fulgora: 50)
- This mod makes **no assumptions** about how or where the cap is enforced

Any change in cap application logic must be handled by the consuming mod,
not by ManisDemolisherOreAndProcessing itself.

## 3. Demolisher Remains Processing Specification

In this mod, the mining results (`minable.results`) of “remains” entities generated when a Demolisher is defeated  
are overridden during the `data-final-fixes` stage.

### 3.1 Technical Background
- Space Age Demolishers are defined as `segmented-unit`
- Their “corpse” is not a standard `corpse` prototype; instead, it is a **mineable rock-type entity**
  created via `create-entity` in `dying_trigger_effect`
- Accordingly, this mod identifies remains using the following steps:
  1. Analyze the `dying_trigger_effect` of Demolishers (`segmented-unit`)
  2. Extract the `entity_name` specified in `create-entity`
  3. Override the corresponding prototype’s `minable.results`

### 3.2 Compatibility and Future-change Policy (Provisional)
- As the current basic policy, this mod treats **the last evaluated `create-entity`** as the Demolisher’s remains
- If other mods or future Space Age updates change the structure of `dying_trigger_effect`,
  the method used to identify remains may be revised  
  (this behavior is **not** a fixed requirement of this specification)

---

## 4. Ores Obtained from Demolisher Remains

The ores contained in remains vary depending on the Demolisher’s type, size, and variant lineage.

### 4.1 Basic Policy
- Standard Demolishers always yield tungsten ore
- Many individuals also yield a small amount of Demolin ore
- Higher variants (speedstar / gigantic / king) always include their corresponding higher-tier Demolin ores
- Even without Mani's Boss Demolisher installed, basic Demolin ore can still be obtained

### 4.2 Ore Composition (Fixed)
- Ore composition strictly corresponds to the Demolisher’s definition name  
- Blank entries mean “not included”  
- Ore quantities depend **only on the Demolisher’s size and definition name**  
  (no modifiers based on quality, planet, or game progression)

- normal / additional normal variants  
  - Tungsten ore + Demolin ore (amount based on size)

- speedstar variants  
  - Tungsten ore  
  - Demolin ore  
  - Speed Demolin ore

- gigantic variants  
  - Tungsten ore  
  - Demolin ore  
  - Gigantic Demolin ore

- crazy-king variants  
  - Tungsten ore  
  - Demolin ore  
  - Speed / Gigantic / King Demolin ore (all included)

*Note: iron-ore / copper-ore are included only as minor byproducts in some ALT variants.*

---

## 5. Processing and Production Lines (Fixed)

### 5.1 Refining Facilities (Recolored)
- Demolin Ore Aqueous Refinery (based on oil refinery)
- Demolin Ore Centrifuge (based on centrifuge)
- No new animations or models (recoloring only)

### 5.2 Fluids and Byproducts
- Demolin Ore Solution
- Demolin Wastewater
- Existing fluids: water / sulfuric acid / fluoroketone
- The number of fluid types is intentionally limited (around five)

#### 5.2.1 Positioning of Demolin Wastewater
- Demolin wastewater is intentionally produced in large quantities as a byproduct
- It is used as part of Demolin ore circulation (recovery and breeding recipes)
- However, in the early game it is designed to behave as an **inconvenient waste product**  
  (serving as pressure on processing design)
- At this stage of the specification, providing an easy “final disposal” recipe is **not** a primary goal

### 5.3 Breeding and Circulation
- Uranium-style 40→41 breeding mechanics
- Basic Demolin ore recovery routes using wastewater
- The focus is on line construction, not repetitive farming

---

## 6. Smelting and Logistics (Fixed)

### 6.1 Smelting (Casting Furnaces)
- Each Demolin ore + molten iron / molten copper → smelted Demolin material (by tier)

### 6.2 Packaging Materials (Compression-only)
- Smelted Demolin materials → Demolin packages (by tier)
- Used exclusively for compression (not repurposed for other uses)

---

## 7. Science Pack Compression (Fixed)
- Logistics science packs → compressed → high-compression → ultra-compression → ultimate compression
- Compressed packs cannot be researched directly and must always be unpacked into normal science packs
- Purpose of compression: transportation, storage, and UPS improvement
- *Compressed science is designed with space transport and rocket logistics in mind*

---

## 8. Boss Science (Fixed)

### 8.1 Production Conditions
- Demolin Ore Solution + Demolin ore series
- Two production routes:
  - Egg route (lightweight, biological)
  - Wood route (heavy, industrial, Gleba-independent)
  - The wood route is positioned as a supplementary option for early to mid game
  - High-efficiency endgame production assumes the egg route

### 8.2 Tier Efficiency
- Demolin ore: 1
- Speed: 3
- Gigantic: 10
- King: 30

---

## 9. Design Principles (Agreed)
- This mod does not require defeating Demolishers in order to progress at all
- Defeating standard Demolishers alone is sufficient to establish a minimal Demolin ore loop
- Grinding, reruns, and RNG are not forced
- Weapon additions are not a goal
- The greatest reward is **lighter factories and more refined structures**
- UPS, logistics, and space transport are the main arenas of gameplay

---

## 10. Handling of This Specification
- This document takes precedence over the README and Mod Portal descriptions
- When discrepancies arise between implementation and this spec, it must be explicitly decided
  whether to treat the implementation as authoritative or to update the specification

---

## 11. Implementation Comment Policy (Operational Rules)
- Technical background and compatibility policies contained in this spec, which are not suitable for README or Mod Portal descriptions,
  may be summarized in module header comments within implementation files
- This is especially encouraged for logic that overrides prototypes in `data-final-fixes`,
  where the rationale and decision criteria should be preserved in code comments