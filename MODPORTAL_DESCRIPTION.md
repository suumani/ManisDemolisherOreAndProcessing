__ManisDemolisherOreAndProcessing__/MODPORTAL_DESCRIPTION.md

An endgame mod focused on **production, logistics, and UPS improvement**,
built around **defeating Demolishers**.

This is **not a weapon mod**.

By processing **Demolin Ore** obtained from Demolishers, you build refining,
breeding, and circulation lines, then **compress science packs**
to reduce transport volume and lighten your factory.

This mod also introduces **research related to Demolisher population control**.
However, it does **not** directly apply or enforce population limits.
Actual population caps are calculated and enforced by other mods
(e.g. BossDemolisher, BreedingDemolisher, TrueFulgoraConqueror).

■ Main features
- Demolin Ore series obtained from Demolishers
- Refining, breeding, and wastewater-based circulation
- Science pack compression (transport, storage, UPS improvement)
- Boss Science Packs (Egg route / Wood route)
- Demolisher population control research (indirect, production-based)

■ Population Control Research (Important)
- This mod provides the research **only**
- It does not remove Demolishers or block spawns by itself
- Other mods decide:
  - Where caps are applied
  - How many Demolishers are allowed
  - Minimum and maximum limits per planet

This design keeps **combat logic and production logic clearly separated**.

■ Dependencies
- Required: Manis_lib / Manis_definitions
- Recommended: Mani's Boss Demolisher
  *The mod works without it, but features that use higher-tier Demolin ores
  are intentionally unavailable.*

For detailed specifications and design intent,
see `spec.md` (English) and `spec.ja.md` on GitHub.

-------

デモリッシャー撃破を起点に、
**生産・物流・UPS改善**を提供するエンドコンテンツ Mod です。

本 Mod は **武器を追加する Mod ではありません**。  
デモリッシャーから入手できる「デモリン鉱」を使い、

- 精製
- 増殖
- 廃水を含む循環ライン構築
- サイエンスパック圧縮

といった **工場設計そのもの**を主役に据えています。

また、本 Mod では
**デモリッシャー個体数制御に関する研究**を追加しますが、
実際に個体数を制限・抑制する処理は行いません。

- 個体数の上限計算
- スポーン抑制
- 惑星ごとの制御

これらは **BossDemolisher / BreedingDemolisher / TrueFulgoraConqueror**
などの Mod 側で適用されます。

この分離設計により、
- 戦闘 Mod は脅威の挙動に集中
- 生産 Mod は間接的な制御手段を提供

という明確な役割分担を実現しています。

■ 主な要素
- デモリン鉱系列の追加（デモリッシャー由来）
- 精製・増殖・廃水回収による循環生産
- サイエンスパック圧縮（輸送・保管・UPS改善）
- ボスサイエンスパック（卵ルート／木ルート）
- 個体数制御研究（生産・研究ベース）

■ 依存関係
- 必須：Manis_lib / Manis_definitions
- 推奨：Mani's Boss Demolisher
  ※ 未導入でも動作しますが、上位デモリン鉱を使用する要素は
     設計上、利用できません。

v0.0.7
- Added Demolisher population control research
- Clarified responsibility separation between production and combat mods
- Balance adjustments for Demolin production lines

Full changelog:
https://github.com/xxxxx/ManisDemolisherOreAndProcessing/blob/main/CHANGELOG.md