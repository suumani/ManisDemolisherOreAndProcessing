# Mani's Demolisher Ore And Processing — Specification (spec)

This document records the **design intent, specifications, and agreed decisions** of Mani's Demolisher Ore And Processing.
It preserves decisions and priorities that are not fully described in the README/Mod Portal.

---

## 0. Purpose and Non-goals

### 0.1 Purpose
- Provide endgame content focused on **rewards, production chains, and UPS improvements**, triggered by boss demolisher kills.
- Deliver endgame value through **factory structure, logistics, and compression**, not through new weapons.
- Avoid forcing grind/loops; make “building lines” the main gameplay.

### 0.2 Non-goals
- Not primarily about combat power boosts or new weaponry.
- Not designed around mandatory repeated farming.
- Avoid unbounded growth of fluids/intermediates; keep the set manageable.

---

## 1. Positioning

### 1.1 Dependencies (required)
- Manis_lib
- Manis_definitions
- Mani's Boss Demolisher
- Not standalone.

### 1.2 Role
- The main reward is “a lighter factory / a more refined structure”.

---

## 2. Demolin ore tiers (fixed)
- Demolin Ore (base)
- Speed Demolin Ore (speedstar)
- Gigantic Demolin Ore (gigantic)
- King Demolin Ore (king)

Drop policy:
- Base/speed/gigantic: probabilistic drops
- King: 100% drop
- No forced grinding; supply is supported by breeding/looping routes.

---

## 3. Processing chain (fixed)
- Refining buildings are color variants (no new models/animations)
- Fluids/byproducts are intentionally limited (~5 types)
- Centrifuge-style 40→41 breeding and wastewater recovery loops

---

## 4. Smelting & logistics (fixed)
- Smelting using molten iron/copper → refined demolin products (tiered)
- Packaging materials exist only for compression purposes

---

## 5. Science compression (fixed)
- Science packs are compressed in stages.
- Compressed packs cannot be researched directly; they must be unpacked.
- Goal: transport, storage, UPS improvements.

---

## 6. Boss science (fixed)
- Requires demolin solution + demolin ore tiers
- Two routes: egg-based / wood-based (Gleba-independent)
- Tier efficiency: 1 / 3 / 10 / 30

---

## 7. Design principles (agreed)
- No forced grind or RNG farming
- Not about adding weapons
- “Factory gets lighter / structure is refined” is the main reward
- UPS/logistics/space transport are the battleground

---

## 8. Intentionally undecided topics
- Research content scope (unpacking only / byproduct integration / infinite research)
- Final meaning of demolin wastewater

---

## 9. Status of this specification
- This document takes precedence over README/Mod Portal
- If discrepancies arise, explicitly decide whether implementation or this spec is authoritative