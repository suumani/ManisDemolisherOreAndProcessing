DemolisherCapResearchPolicy 仕様（確定案）
目的

複数のデモリッシャー関連Modを同時導入した終盤において、CPU負荷（UPS低下）をユーザーが研究で緩和できるようにする。
本ポリシーは デモリッシャー出現数（各サーフェイス上限）を減少させる補正値を提供し、各Modの既存capロジックに **非侵襲（min合成）**で適用される。

適用主体

研究を追加する主体Modは ManisDemolisherOreAndProcessing。

他のデモリッシャー関連Mod（BossDemolisher / BreedingDemolisher / TrueFulgoraConqueror など）は、このポリシーを参照して cap を補正してよい。

ただし、研究の存在は必須ではない。研究（テクノロジー）が存在しない場合、本ポリシーは 何も変更しない（No-Op）。

参照方法（結合方式）

各Modは 特定のテクノロジー名を force.technologies[TECH_NAME] で参照する。

テクノロジーが存在しない（nil）場合、ポリシーは「補正なし」として扱う。

remote interface などによる接続は用いない（テクノロジーの有無を結合点とする）。

効果の定義（圧縮率 r）

研究レベル L に応じて、圧縮率 r(L) を定義する。

各Modは自身の base cap に対し、以下の補正を適用する：

research_cap = floor(base_cap * r(L))

最終capは final_cap = min(original_cap, research_cap)
（既存の進化度連動capなど “元のcap” を尊重し、研究は上限を下げるのみ）

r(L) は段階的に減少し、最終的に「低負荷な上限」へ到達する。

r(L) の推奨形（5%刻み）

研究は無限研究とし、レベルが上がるほど cap を減らす。

5%刻みの圧縮を基本とする：

r(L) = max(0.25, 1.00 - 0.05 * L)

例：

L=0 → 1.00

L=1 → 0.95

…

L=15 → 0.25（下限到達）

下限（Modごとの最低cap）

研究によってcapが無制限に小さくならないよう、Mod側で下限を設ける。

BossDemolisherMod

NORMAL_LIMIT 下限：10

BOSS_LIMIT 下限：10
※研究適用後の値を下限で clamp してから min 合成してよい。

BreedingDemolisher / TrueFulgoraConqueror（サーフェイス200系）

下限：50

（結果として、全サーフェイス合計を概ね 250 程度まで抑制可能）

研究の解禁とコスト（ManisDemolisherOreAndProcessing側の契約）

研究に必要なサイエンス：低温サイエンスパックまでの全て + ボスサイエンスパック
（プロメチウムは不要）

研究コスト：武器系の無限研究と同等の重さ

初期コスト：1000

レベルごとの増加倍率：×2

研究は「終盤の快適化」を目的とし、達成が容易すぎない設計とする。

禁止事項（重要：責務分離）

本ポリシーおよびスポナーは、抽選イベントの内部状態（当選・保留・再抽選・重み操作など）に介入してはならない。

スポーンに失敗した場合、補償処理（保留チケット等）は行わず、単に「何も起きない」とする。

仕様の使い方（各Mod側の実装方針の要点）

各Modは「元のcap計算」を行った後に、本ポリシーで得た research_cap を min合成するだけでよい。

研究が存在しない場合は従来通り。