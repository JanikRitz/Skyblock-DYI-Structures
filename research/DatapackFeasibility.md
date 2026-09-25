# Datapack Feasibility Research

Target: Minecraft Java Edition 26.3, vanilla datapack only unless noted.

## Executive Summary

The plan is mostly realistic as a Java datapack if it is framed as a command- and
data-driven progression pack, not as a fully simulated custom world engine.

Strong fits:

- Advancements, guide progression, unlock tracking, and reward functions.
- Loot tables for mobs, blocks, archaeology, fishing, structure chests, vaults,
  trial spawner rewards, and direct `/loot`-based rewards.
- Function logic using `/execute`, scoreboards, command storage, predicates, item
  checks, block checks, and scheduled/tick functions.
- Structure templates and `/place template` as validation references, preview aids,
  or fallback generation.
- `/execute if blocks` or targeted `/execute if block` checks for player-built
  structure validation.
- `/fillbiome` for local biome regions around completed structures.
- Data-driven trial spawner configurations.
- Data-driven villager and wandering trader trades in 26.x.
- Data-driven variants for some passive mobs, including cats, chickens, cows,
  frogs, pigs, wolves, and zombie nautiluses.

Risky or limited fits:

- Perfect full-scale structure validation. It is possible but expensive if every
  block must match; use anchor blocks, required feature checks, or chunked template
  comparisons.
- Local biome regions. `/fillbiome` works, but in 26.3 biome storage is cell-based
  and boundaries are not block-perfect. This improves in 26.4 snapshots, but 26.3
  should treat biome regions as approximate.
- Natural spawning as the only mob source. It can work after biome changes, but a
  skyblock world has unusual spawn surfaces and low chunk area; trial spawners or
  controlled summon/spawner mechanics are more reliable.
- Vault, trial spawner, and structure block entity setup may require exact block
  entity NBT. It is doable through templates or commands, but should be prototyped
  before committing the whole progression to it.
- Custom Trial Keys using item data/components may work for gating custom systems,
  but vanilla vault acceptance rules need a focused prototype.

Poor fits without fallbacks:

- True custom blocks, custom items, or custom mobs with new behavior. Datapacks can
  define a lot of data, but they do not add arbitrary new block/entity logic like a
  mod.
- Editing unloaded areas or relying on chunk generation after a skyblock world has
  already been created. Commands generally need loaded chunks, and worldgen data
  affects generation rather than already-built play spaces.
- Making structures count as vanilla-located structures for all vanilla checks when
  they were hand-built. A datapack can track its own completed structures, but some
  vanilla advancement or variant conditions that check generated structure data may
  not recognize a hand-built copy.

## Datapack Capability Map

### Stable, Reloadable Content

These are good foundations for this project because they are standard datapack
content and can usually be iterated with `/reload`:

- `data/<namespace>/function`: command scripts for validation, unlocks, block
  changes, spawning, feedback, and scheduled behavior.
- `data/<namespace>/advancement`: custom advancement trees and triggers.
- `data/<namespace>/loot_table`: mob drops, block drops, archaeology, fishing,
  chest loot, spawner rewards, and vault reward tables.
- `data/<namespace>/predicate`: reusable conditions for entities, location, items,
  and randomization.
- `data/<namespace>/item_modifier`: reusable item mutation for loot and trades.
- `data/<namespace>/recipe`: custom recipes if needed for controlled progression.
- `data/<namespace>/tags`: block, item, entity, biome, structure, and function tags.
- `data/<namespace>/structure`: `.nbt` structure templates.

### Dynamic or Experimental Content

These are very useful, but they should be treated as higher-friction. Some are
experimental settings, require world/server restart instead of `/reload`, or depend
on newer 26.x formats:

- `worldgen/*`: biomes, configured features, structures, template pools, dimensions,
  and world presets. Useful for custom empty/skyblock worlds and optional fallback
  generation, but not ideal for frequent iteration.
- `trial_spawner`: data-driven trial spawner configurations.
- `villager_trade` and `trade_set`: data-driven villager and wandering trader
  trades.
- `block_transformer`: 26.3 rules for items transforming blocks on use. Powerful,
  but it applies through item components and is better for tool-like mechanics than
  large structure activation.
- mob variant registries such as `cat_variant`, `chicken_variant`, `cow_variant`,
  `frog_variant`, `pig_variant`, `wolf_variant`, and `zombie_nautilus_variant`.

## Plan Systems

### Structure Regeneration

Feasible, with scoped validation.

Recommended implementation:

1. The player builds the structure around a required anchor block or marker pattern.
2. A function runs from that anchor and checks required blocks, block entities, and
   dimensions.
3. The function records completion with a scoreboard or command storage entry.
4. The function performs small transformations: `setblock`, `fill`, `clone`,
   `/loot`, `/place template`, or NBT changes on selected block entities.

Validation options:

- Targeted checks: best default. Check core shape, rare/expensive blocks, and key
  gameplay blocks instead of every decorative block.
- Template comparison: possible with `/execute if blocks`, but limited to loaded
  regions and a max compared volume. Good for small rooms, modules, or a few
  critical slices.
- Full structure template comparison: feasible only if split into pieces or if the
  structure is small enough. Large vanilla-scale structures need chunking.
- Fallback generation: `/place template`, `/place structure`, or `/place jigsaw` can
  place templates or configured structures if chunks are loaded and placement rules
  pass. This should remain fallback or preview support, not the default loop.

What this means for the plan:

- The pillar "player builds nearly the entire structure" is realistic.
- The check should not require exact decorative fidelity across a full mansion,
  monument, ancient city, or trial chamber.
- Use a "functional completion" standard: dimensions, anchors, material families,
  important rooms, important blocks, and no illegal bypass blocks.

### Anchor Core Design

Recommended direction: use a small tiered anchor family, not a unique anchor block
for every structure.

The anchor should make structure activation legible to the player, give functions a
stable origin point for relative block checks, and provide one of the progression
gates. The anchor should not be the only gate; the surrounding structure, required
materials, advancement state, and activation reward should all remain part of the
gate.

Suggested tiers:

- Overworld Survey Core: `minecraft:lodestone`. This is the cleanest general
  anchor. It is survival-native, rare enough to recipe-gate, visually reads as a
  survey/navigation device, and works for villages, trail ruins, mineshafts,
  geodes, monuments, and most Overworld biome unlocks.
- Deep Core: `minecraft:reinforced_deepslate`. This is ideal for Deep Dark,
  ancient city, deepslate ore, ominous trial, portal-adjacent, and late Overworld
  technology. It is not obtainable in normal Survival, drops nothing, has no tool,
  has very high hardness, is blast resistant, cannot be moved by pistons, and only
  naturally appears in ancient cities. Making it available through a custom recipe
  is therefore a deliberate progression statement, not an accidental vanilla
  shortcut.
- Nether Core: `minecraft:respawn_anchor` or a lodestone upgraded with Nether
  materials. Respawn anchors are thematically strong but unsafe/awkward outside the
  Nether, so they are better as Nether-tier anchors than universal anchors.
- End Core: an End-themed block or catalyst near a lodestone, such as end rods, end
  stone bricks, purpur, or end crystals. This needs a prototype because end crystals
  have special behavior and may be too explosive for a reusable anchor.

Use one anchor block per tier, while the surrounding structure determines the
specific structure type. For example, a lodestone inside a rail-and-support pattern
can be detected as a mineshaft module, while a lodestone inside calcite/amethyst can
be detected as a geode. Optional nearby catalysts can add flavor without requiring a
large catalog of custom anchors.

Activation lifecycle:

1. The player unlocks or crafts the tier core through progression.
2. The player places the core at the defined origin of a structure.
3. A function checks the surrounding build from that origin.
4. On success, the datapack records the completed structure and consumes,
   transforms, or locks the core in place.
5. The activated structure then controls biome painting, spawners, vaults, trades,
   or resource transformations.

Prefer transforming or locking activated anchors over leaving them reusable. This
prevents one expensive core from being moved through many structures and makes
completion feel permanent. A completed anchor can become a marker block, a protected
block entity, or a stored coordinate entry that future functions use as the region's
center.

### Local Biomes and Mob Access

Partly feasible.

`/fillbiome` can change a local region's biome. In 26.3, biomes are stored in
4x4x4 cells, so boundaries are approximate and smoothed. The command changes biome
identity, grass/foliage color, biome checks, and natural spawn conditions, but it
does not change blocks into biome terrain.

Recommended implementation:

- After structure completion, use `/fillbiome` to paint a cuboid region around the
  structure.
- Separately transform visible terrain blocks where needed, such as grass to sand,
  stone to deepslate, dirt to mud, or water-area materials.
- Track the unlocked biome region in command storage so functions can recognize it
  even if biome painting is approximate.
- Use trial spawners or controlled summon logic for mobs that must be reliable.

Fallback:

- If biome painting is too coarse, treat biome regions as datapack-defined zones:
  store center/radius data, show particles/actionbar feedback, run controlled spawn
  functions, and use villager/trade unlocks keyed to the stored zone.

### Villagers and Trades

Highly feasible in 26.x.

Villager trades and wandering trader trades are data-driven in 26.x. The plan can
use datapack JSON to add or alter trades for saplings, sand, copper, gold, biome
materials, and progression resources.

Recommended implementation:

- Use villager trades as supporting renewability, not the only progression path.
- Gate trade availability with villager profession, level, biome/variant, or custom
  merchant predicates where possible.
- Override wandering trader trades that bypass intended progression, especially
  early dirt, saplings, sand, coral, moss, or biome items.
- Keep at least one non-trader route for critical progression resources.

Risk:

- The 26.x trade format is young and has changed across snapshots. Build one trade
  prototype before designing the entire economy.

### Trial Spawners, Keys, and Vaults

Feasible, with one important unknown.

Trial spawner configurations are data-driven and can define spawn ranges, mob
counts, spawn potentials, reward loot tables, and ominous reward behavior. Loot
tables can support custom rewards for keys, resources, ores, sherds, diamonds,
templates, and structure-specific items.

Recommended implementation:

- Use custom trial spawner configuration IDs for each completed structure or biome
  theme.
- Use loot tables for normal and ominous reward tiers.
- Place or transform only the completed structure's key spawners/vaults after
  validation.
- Use existing Trial Key and Ominous Trial Key items for the first prototype.

Open prototype:

- Test whether a vault can require a key distinguished only by item components or
  custom data without resource-pack assets. If not, keep vanilla Trial Key/Ominous
  Trial Key and distinguish access through the vault block entity, location,
  scoreboard unlocks, or pre-unlock conversion functions.

### Loot and Drops

Highly feasible.

Loot tables can alter or add:

- Entity drops.
- Block drops.
- Fishing loot.
- Archaeology loot for suspicious sand and suspicious gravel.
- Structure chest loot.
- Decorated pot loot.
- Trial spawner rewards.
- Vault rewards.
- Piglin bartering and other gameplay loot tables.

Recommended implementation:

- Put exploration-only resources behind structures, vaults, archaeology, or mobs.
- Avoid global mob-drop changes that make structures irrelevant. Prefer conditions,
  custom spawned mobs with `DeathLootTable`, or structure-specific spawners.
- Use loot table injection sparingly for early progression, then use vaults and
  structure rewards for high-value renewability.

### Guidance

Feasible.

Recommended implementation:

- Custom advancement tab for main milestones and optional structures.
- Function rewards from advancements to set scores, unlock recipes/trades, or give
  guide items.
- Actionbar/title feedback when a player tests a structure.
- Optional guide book using written book items generated by functions or loot.
- Optional previews using structure templates, particles, block displays, or marker
  armor stands/entities.

Risk:

- In-world ghost previews can become command-heavy. Start with advancements plus
  anchor feedback, then add previews only for confusing structures.

## Content Category Feasibility

### Structures

Likely good fits:

- Trail ruins: suspicious gravel/sand, archaeology loot, validation by footprint and
  material palette.
- Mineshaft: rails, cobwebs, cave spiders, ore access, easy modular validation.
- Trial chambers: trial spawners, vaults, copper, breeze, ominous progression.
- Amethyst geode: small enough for anchor validation and controlled budding
  amethyst/calcite activation.
- Ruined portal: obsidian, crying obsidian, netherrack, gold, Nether unlock.
- Nether fortress: blaze/wither skeleton spawners or trial-spawner analogs.
- Bastion: piglins, blackstone, upgrade templates, netherite-related loot.
- End city: shulkers, elytra, purpur, chorus/end materials.

Harder but possible:

- Ocean monument: large validation; guardian spawning and elder guardian logic need
  controlled spawners or summoning.
- Woodland mansion: very large validation; better as a room/module milestone than
  exact full mansion checking.
- Ancient city: large validation; warden/sculk works well, but exact ancient city
  recognition should be abstracted.
- Villages: vanilla village mechanics are not purely structure-file based. Use
  villager beds/workstations and datapack progression checks rather than expecting
  hand-built villages to behave exactly like generated structures.

### Mobs

Good datapack-controlled sources:

- Trial spawners or configured spawners for hostile mobs.
- Summon functions for milestone rewards or rare unlock events.
- Loot-table rewards from custom-spawned mobs.
- Biome painting for natural passive/hostile spawning where terrain area is large
  enough.

Variant handling:

- Some mob variants are data-driven and can use biome or structure spawn conditions.
- For hand-built structures, structure-based variant conditions may not apply unless
  the game recognizes the area as a generated structure. Prefer biome conditions or
  explicit summon data for Skyblock unlocks.

### Resources

Strong routes:

- Ores: structure activation transforms stone/deepslate into limited ore nodes;
  vaults provide high-value renewables; mobs/trades can supplement.
- Sand/gravel/clay: biome/structure unlocks, suspicious blocks, controlled drops,
  trades, or vaults.
- Amethyst/calcite: geode milestone with budding amethyst placement and calcite
  shell transformation.
- Netherite: bastion/ominous vault tier, ancient debris loot, or rare structure
  transformation.
- Elytra/shulker boxes: End city completion and vault/chest rewards; controlled
  shulker spawn source.

Avoid:

- Making every resource a global mob drop. It will flatten progression quickly.

## Recommended Architecture

Use a small set of datapack subsystems:

- `load`: install scoreboards, storage defaults, bossbars, and gamerules if needed.
- `tick`: lightweight player proximity checks only; avoid scanning large structures
  every tick.
- `detect/*`: anchor-based structure detection functions called by player action,
  advancement, or limited proximity checks.
- `activate/*`: one-time transformations and unlock recording.
- `region/*`: biome painting and local zone storage.
- `spawner/*`: trial spawner and mob-source setup.
- `loot/*`: custom loot tables and item modifiers.
- `advancement/*`: guide tree and milestone triggers.
- `trade/*`: villager and wandering trader economy.

Data storage model:

- Use scoreboards for cheap per-player/per-anchor numeric state.
- Use command storage for structured global unlock data, placed region centers, and
  completed structure records.
- Use tags on marker entities only when an in-world persistent anchor is useful.

Performance rule:

- Never scan large structures continuously. Make validation player-triggered, anchor
  triggered, or split into staged checks.

## Prototype Order

1. Minimal datapack skeleton with `load`, `tick`, one advancement tab, and one test
   function.
2. One small structure milestone: validate a tiny Trail Ruins or Abandoned Camp
   module from an anchor and transform gravel into suspicious gravel with a custom
   archaeology loot table.
3. One local biome region: use `/fillbiome`, confirm natural spawning/biome checks,
   and decide whether approximation is acceptable.
4. One trial spawner plus one vault reward loop: custom spawner config, custom loot,
   key use, cooldown behavior, and ominous behavior.
5. One villager trade override/addition and one wandering trader bypass removal.
6. One large-structure proof: validate a mineshaft or trial-chamber module with
   chunked checks, then extrapolate to larger structures.

## Open Questions To Prototype

1. Can vaults distinguish Trial Keys by item components/custom data in 26.3?
2. Can completed player-built structure zones be made to satisfy any structure-based
   variant or advancement checks, or must those be datapack-owned unlock states?
3. How expensive is chunked `/execute if blocks` validation for a realistic module?
4. How acceptable are 26.3 `/fillbiome` boundaries for small island regions?
5. Which trial spawner and vault block entity fields can be safely set with commands
   versus structure templates?
6. Which trade predicates are stable enough for biome/structure-gated villager
   trades?

## Source Pages Checked

- https://minecraft.wiki/w/Data_pack
- https://minecraft.wiki/w/Commands/function
- https://minecraft.wiki/w/Commands/execute
- https://minecraft.wiki/w/Commands/fillbiome
- https://minecraft.wiki/w/Commands/place
- https://minecraft.wiki/w/Loot_table
- https://minecraft.wiki/w/Advancement
- https://minecraft.wiki/w/Structure_file
- https://minecraft.wiki/w/Trial_spawner_configuration
- https://minecraft.wiki/w/Villager_trade_definition
- https://minecraft.wiki/w/Block_transformer_definition
- https://minecraft.wiki/w/Mob_variant_definitions
- https://minecraft.wiki/w/Reinforced_Deepslate