# Vanilla Skyblock Datapack - Development Plan

## Core Concept
A vanilla-like Skyblock experience where players progressively unlock and "regenerate" every vanilla structure on their floating island. Each structure provides new materials, resources, and building inspiration for themed areas. Linear progression without relying on wandering traders or chunk regeneration.

??? Building a life sized structure to regenerate the real structure around / inside it after a ritual / sacrifice ???

manually build structures
- the structure changes blocks
  - mineshaft: stone -> ore
  - trail ruins: gravel -> suspicious gravel
  - ocean ruins: sand -> suspicious sand
  - trial chambers: regenerating vaults, transforming ??? into trial spawners
  - filling chests with resources (?)
- changes biome
  - enables different villagers, and mob spawns

Adapt the villager trades, e.g. also trade copper and gold, include building blocks and resources like sand

Adapt the trial spawners and vaults, (biome specific keys + vaults to gate the progression + ominous variants), providing different spawners depending on the structure (e.g. Parched that might be a source of sand)

Adapt monster drops to include non renewable resources like sand, but also blocks that are harder more tedious to automate like clay

Guide Book? Special advancements? Some way to make it clear how to build the vanilla structures to regenerate/generate resources. best thing would be to have an in-world preview

**Target Version:** Minecraft 26.3 (Java Edition)
**Type:** Datapack (minimal custom items, leverages existing mechanics)

## Design Pillars

### 1. Structure Regeneration System

- Players unlock structures through progression milestones
- Each structure has to be built by the player, some blocks are checked
- Structures provide authentic vanilla loot and resources geared towards progression
- Encourages building themed houses/areas around regenerated structures

### 2. Linear Progression
- Milestone-based unlocks (achievements, resource thresholds)
- No glitches like chunk generation and no wandering trader dependency

### 3. Vanilla Faithfulness
- Minimal custom items (prefer existing blocks/items)
- Villager trading supports but doesn't dominate progression
- (Real vanilla achievements as progression markers)

### 4. Use new features
- Trial spawners -> Trial Key -> Vault
- ominous trial key + ominous vault
- Villagers from different biomes have different trades that either enable unlocking new structures or make aquiring infinite resources from earlier stages possible

## Progression Framework

### Necessary changes

Villager + Wandering Trader trades: remove saplings

spawned / regenerated structures also need to change the biome to enable different biome Villagers


### Unsorted

- trees: cherry, mangrove, poplar, bamboo
- monsters: Guardian, Elder Guardian, stray, bogged, parched, cave spider, breeze, ocelot, parrot, sulfur cube, hoglin, pillager, drowned, phantom, raiders, ghast, shulker, ...
- animals: chicken, pig, sheep, cow, horse, donkey, goat, llama, wolves, nautilus, axlotl, ...
- structures: pyramid, villages, jungle temple, ...
- biomes (?)

### Tier 0 - Starting Island

- oak wood, dirt, grass, wheat, stone generator (+ mob farm ?) (packed mud (?))

### Tier 1

- Birch Forest + Bees
- Acacia
- Beach -> Sand + Glass (e.g.)
- Lake/Ocean -> Fishing + infinite water
- Moss -> regenerative dirt + azalea
- Trail Ruins

### Tier 2

- Spruce
- Jungle
- Mangrove
- Mineshaft
- Dripstone cave -> regenerative Lava
- Trial Chambers (vaults that can be refreshed for infinite diamonds)

### Tier 3

- Dark Oak (Mansion)
- Pale Oak (Creeking + resin)
- Deep Dark (infinite source for Deepslate, enables ominous vaults)
- Nether (Gold -> Villager transformation)
- Nether Fortress (Blaze -> Eyes of Ender, source of nether warts that enables potions)
- Nether Bastion (Netherite that should be infinite)
- Villagers -> iron farm, cats, trades

### Tier 4

- End dimension
- Dragon fight
- Elytra + Shulker Boxes

### Unlock Mechanisms
- **Achievement-based:** Complete vanilla achievement → unlock structure
- **Resource-based:** Collect X amount of material → unlock structure  
- **Construction-based:** Build specific item/contraption → unlock structure
- **Exploration-based:** Discover/find specific block/item → unlock structure

## Open Questions & Decisions Needed

1. **Island Size:** Fixed size that expands vs. infinite with structure placement zones?
2. **Structure Scale:** Full vanilla scale or scaled-down skyblock versions?
3. **Mob Spawning:** Natural spawning on island or controlled mob farms only?
4. **Day/Night Cycle:** Keep vanilla cycle or custom progression-based lighting?
5. **Multiplayer:** Single-player focused or multiplayer compatible?
6. **Difficulty:** Peaceful default with optional harder settings?

## References & Research
- [Minecraft Wiki - Structures](https://minecraft.wiki/w/Structure)
- [Minecraft Wiki - Advancements](https://minecraft.wiki/w/Advancement)
- [Minecraft Wiki - Loot Tables](https://minecraft.wiki/w/Loot_table)
- [Minecraft Wiki - Trees](https://minecraft.wiki/w/Tree)
- See `research/` folder for detailed mechanic documentation
