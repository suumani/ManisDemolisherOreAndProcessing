# Changelog


## v0.0.7
### New Technology

 - デモリッシャー出現数抑制研究を追加しました。この研究は、BreedingDemolisher、ManisBossDemolisher、TrueFulgoraConqueror導入時に戦闘負荷軽減を実現できます。

## v0.0.6
### Balance
- Adjusted Demolin breeding recipes:
  - Reduced tungsten requirement (40 → 5)
  - Increased breeding time to 60s (Kovarex-aligned)

### New Recipes
- Added heavy synthesis recipes for Gigantic / King Demolin Ores
  - Designed as alternatives to boss drops
  - Extremely high cost by design

### UI / UX
- Fixed recipe ordering:
  - Compression recipes grouped
  - Unpacking recipes separated into a dedicated section

### Technical
- Added per-tick move count logging for demolisher movement
- Unified logging via dependency injection with mod identifiers