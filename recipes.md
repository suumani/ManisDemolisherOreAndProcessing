# Mani's Demolisher Ore And Processing — Recipes

This document contains **recipe tables only**.  
Design intent and decisions are documented in `spec.md` / `spec.ja.md`.

---

## 1) Boss Science Pack Recipes  
*(Assembler 2 / Assembler 3)*

### Egg Route (Biological)

| Tier | Inputs | Outputs |
|---|---|---|
| Basic | Demolin Solution 1000<br>Biter Egg x1<br>Pentapod Egg x1<br>Fish x1<br>Demolin Ore x10 | Boss Science Pack x1 |
| Mid | Demolin Solution 1000<br>Biter Egg x1<br>Pentapod Egg x1<br>Fish x1<br>Speed Demolin Ore x10 | Boss Science Pack x3 |
| High | Demolin Solution 1000<br>Biter Egg x1<br>Pentapod Egg x1<br>Fish x1<br>Gigantic Demolin Ore x10 | Boss Science Pack x10 |
| Final | Demolin Solution 1000<br>Biter Egg x1<br>Pentapod Egg x1<br>Fish x1<br>King Demolin Ore x10 | Boss Science Pack x30 |

### Wood Route (Industrial / Gleba-independent)

| Tier | Inputs | Outputs |
|---|---|---|
| Basic | Demolin Solution 1000<br>Wood x500<br>Demolin Ore x20 | Boss Science Pack x1 |
| Mid | Demolin Solution 1000<br>Wood x1500<br>Speed Demolin Ore x20 | Boss Science Pack x3 |

---

## 2) Demolin Solution Recipes  
*(Demolin Water Refinery)*

| Tier | Inputs | Outputs |
|---|---|---|
| Basic | Uranium x10<br>Demolin Ore x100<br>Sulfuric Acid 500 | Demolin Solution 30<br>Demolin Wastewater 10<br>Water 480 |
| Mid | Uranium x10<br>Demolin Ore x50<br>Speed Demolin Ore x10<br>Sulfuric Acid 500 | Demolin Solution 100<br>Demolin Wastewater 50<br>Water 350 |
| High | Uranium x10<br>Demolin Ore x50<br>Gigantic Demolin Ore x10<br>Sulfuric Acid 500 | Demolin Solution 150<br>Demolin Wastewater 150<br>Water 200 |
| Final | Uranium x10<br>Demolin Ore x10<br>Speed Demolin Ore x3<br>Gigantic Demolin Ore x1<br>King Demolin Ore x1<br>Sulfuric Acid 1000<br>Fluoroketone 500 | Demolin Solution 800<br>Demolin Wastewater 150<br>Water 50 |

---

## 3) High-tier Demolin Ore Breeding  
*(Demolin Centrifuge)*

| Recipe | Inputs | Outputs |
|---|---|---|
| Speed 40→41 | Demolin Ore x5<br>Speed Demolin Ore x40<br>Sulfuric Acid 500 | Demolin Ore x3<br>Speed Demolin Ore x41<br>Sulfuric Acid 300<br>Demolin Wastewater 100<br>Water 100 |
| Gigantic 40→41 | Demolin Ore x5<br>Gigantic Demolin Ore x40<br>Sulfuric Acid 1500 | Demolin Ore x3<br>Gigantic Demolin Ore x41<br>Sulfuric Acid 400<br>Demolin Wastewater 800<br>Water 300 |
| King 40→41 | Demolin Ore x2<br>Speed Demolin Ore x5<br>Gigantic Demolin Ore x8<br>King Demolin Ore x40<br>Sulfuric Acid 2500 | King Demolin Ore x41<br>Sulfuric Acid 300<br>Demolin Wastewater 100<br>Water 100 |

---

## 4) Base Demolin Ore Recovery  
*(Chemical Plant)*

| Inputs | Outputs |
|---|---|
| Demolin Ore x5<br>Demolin Wastewater 1300<br>Sulfuric Acid 300 | Demolin Ore x6<br>Demolin Wastewater 400<br>Water 1200 |

---

## 5) Smelting  
*(Foundry)*

| Tier | Inputs | Outputs |
|---|---|---|
| Base | Demolin Ore x1<br>Molten Iron 20<br>Molten Copper 10 | Refined Demolin |
| Speed | Speed Demolin Ore x1<br>Molten Iron 20<br>Molten Copper 10 | Refined Speed Demolin |
| Gigantic | Gigantic Demolin Ore x1<br>Molten Iron 20<br>Molten Copper 10 | Refined Gigantic Demolin |
| King | King Demolin Ore x1<br>Molten Iron 20<br>Molten Copper 10 | Refined King Demolin |

---

## 6) Packaging Materials  
*(Assembler 2 / Assembler 3)*

| Tier | Inputs | Outputs |
|---|---|---|
| Base | Refined Demolin x1<br>Iron Plate x10<br>Sulfuric Acid 10 | Demolin Packaging |
| Speed | Refined Speed Demolin x1<br>Iron Plate x10<br>Sulfuric Acid 10 | Speed Demolin Packaging |
| Gigantic | Refined Gigantic Demolin x1<br>Iron Plate x10<br>Sulfuric Acid 10 | Gigantic Demolin Packaging |
| King | Refined King Demolin x1<br>Iron Plate x10<br>Sulfuric Acid 10 | King Demolin Packaging |

---

## 7) Science Compression / Unpacking  
*(Assembler 1 / 2 / 3)*

### Compression Chain (Automation example)

| Step | Inputs | Outputs |
|---|---|---|
| Compress | Automation Science Pack x10<br>Demolin Packaging | Compressed Automation Pack x1 |
| High Compress | Compressed Automation Pack x10<br>Speed Demolin Packaging | High-compressed Automation Pack x1 |
| Ultra Compress | High-compressed Automation Pack x10<br>Gigantic Demolin Packaging | Ultra-compressed Automation Pack x1 |
| Ultimate | Ultra-compressed Automation Pack x10<br>King Demolin Packaging | Ultimate Automation Pack x1 |

### Unpacking Chain

| Inputs | Outputs |
|---|---|
| Ultimate Automation Pack x1 | Ultra-compressed Automation Pack x10 |
| Ultra-compressed Automation Pack x1 | High-compressed Automation Pack x10 |
| High-compressed Automation Pack x1 | Compressed Automation Pack x10 |
| Compressed Automation Pack x1 | Automation Science Pack x10 |

### Supported Science Packs

Automation / Logistic / Military / Chemical / Production / Utility / Space  
Metallurgic / Agricultural / Electromagnetic / Cryogenic / Promethium  
Boss Science Pack

(All science packs follow the same compression/unpacking structure.)