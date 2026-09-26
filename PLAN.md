# Vanilla Skyblock Datapack - Development Plan

## Project Definition

**Target version:** Minecraft Java Edition 26.3, `Wilderness Bound`

**Type:** Vanilla datapack with minimal custom data; prefer existing blocks, items,
mobs, structures, trial spawners, vaults, loot tables, and advancements.

The goal is a vanilla-like Skyblock playthrough in which the player can eventually
renew everything available in a normal vanilla playthrough. This includes resources
that are normally obtained by exploring the world, such as diamonds, amethyst, and
calcite, as well as blocks, mobs, passive mob variants, villager variants, and
structure-specific loot. Technical or debug-only content is out of scope.

The player progresses from an Overworld starting island through the Nether and then
the End. A main line of structures unlocks the next stages; optional structures and
biomes provide additional renewable resources, mobs, building blocks, and villager
variations.

## Core Gameplay Loop

1. Start with a small, mostly traditional Skyblock island.
2. Meet the requirements for a structure or biome milestone.
3. Build the structure, generally at close to its full vanilla scale.
4. Trigger the structure's completion or regeneration mechanic.
5. The datapack changes or activates only a small number of blocks and systems.
6. Use the resulting resources, mobs, trades, and loot to reach the next milestone.

The preferred implementation is for the player to build nearly the entire structure.
The datapack should validate the relevant structure and perform a limited transformation
rather than generating a complete structure for the player.

## Design Pillars

### Structure Regeneration

- Structures are player-built and checked against a template or required features.
- Completing a structure unlocks its renewable resource or gameplay function.
- Transformations should be small and meaningful: for example, stone becoming ore,
  gravel becoming suspicious gravel, or a completed chamber activating special vaults.
- Structures should encourage themed areas rather than feeling like disposable machines.
- Full structure generation remains a fallback if validation or transformation proves
  impractical for a particular structure.

### Progression

- The main progression is linear and follows the normal broad order of Overworld,
  Nether, and End content.
- Optional structures and biomes can be completed within a tier without blocking the
  main line, but may provide useful shortcuts, building materials, or renewable mobs.
- Unlocks may use vanilla advancements, collected resources, construction milestones,
  exploration discoveries, or completed structures.
- Progression must not depend on wandering traders or world/chunk generation glitches.

### Vanilla-Like Design

- Use vanilla mechanics and appearances wherever practical.
- Modified trades, loot tables, trial spawners, vaults, and advancements are intended.
- Avoid completely custom mobs and custom item types.
- Biome-specific Trial Keys will preferably be existing Trial Key items with custom
  data. The exact datapack support and limitations need research.

## Starting Island - Tier 0

The starting island should remain close to the original Skyblock experience:

- Small dirt island
- Oak tree and renewable early-game wood path
- Grass and basic crops
- Water supplied by an ice block
- Lava supplied by a bucket
- Basic stone generation
- Abandoned Camp as part of the starting island, subject to deciding its exact role

The starting island should not assume natural access to every hostile mob. The first
controlled mob source and the point at which natural spawning becomes available remain
design decisions.

## Proposed Progression Outline

This is a provisional structure for discussion, not a final mandatory list. The main
line should follow resource dependencies while each tier also contains optional content.

### Tier 1 - Early Overworld

**Main line candidates:**

- Early village or villager access
- Beach or ocean structure for sand, glass, fishing, and water-related resources
- Trail Ruins for suspicious gravel and archaeology resources
- Basic cave-resource milestone for ores beyond the starting generator

**Optional content:**

- Birch Forest and bees
- Acacia
- Moss and azalea
- Spruce
- Early passive mobs and biome-specific villager variations

### Tier 2 - Developed Overworld

**Main line candidates:**

- Mineshaft for renewable ores and cave resources
- Dripstone Cave for renewable lava and dripstone
- Trial Chambers for renewable diamonds and other gated vault loot
- Villager breeding and biome conversion for expanded trades and saplings

**Optional content:**

- Jungle and jungle temple
- Mangrove
- Dark Oak and woodland mansion
- Ocean ruins and other ocean resources
- Additional passive mobs, aquatic mobs, and biome-specific variants

### Tier 3 - Advanced Overworld

**Main line candidates:**

- Deep Dark for deepslate and access to ominous trial content
- Pale Oak content, including the Creaking and resin
- A reliable route into the Nether

**Optional content:**

- Desert pyramid and desert resources
- Villages and advanced villager trades
- Ocean Monument for guardians and prismarine
- Woodland Mansion and remaining Overworld structures

### Tier 4 - Nether Progression

**Main line candidates:**

- Nether biomes and renewable Nether materials
- Nether Fortress resources for potion and End progression
- Nether Bastion for renewable netherite-related resources
- Gold-based villager progression or other Nether-specific villager mechanics

**Optional content:**

- Hoglins and other Nether mobs
- Ghasts, magma cubes, and biome-specific Nether resources
- Additional bastion and fortress loot

### Tier 5 - Endgame

**Main line candidates:**

- End access
- Ender Dragon fight
- Renewable access to End resources
- Elytra and Shulker Boxes

**Optional content:**

- End structures and chorus resources
- Renewable shulkers and other End mobs
- Remaining resources that are normally obtained through End exploration

## Systems To Design

### Local Biomes and Mob Access

The preferred solution is for a completed structure to create or designate a biome
region around itself. This region should enable the appropriate passive mobs, hostile
mobs, and villager variants.

Biome JSON definitions are also being used to control feature generation for
SkyBlock world creation. The current definitions are a baseline from another SkyBlock
datapack with world structures, not yet a verified final feature set. Audit their
ordered `features` generation-step entries so only intended worldgen remains; see
`research/DatapackFeasibility.md` for the step order, the `the_end.json` example, and
the distinction between worldgen features and `/fillbiome` region changes.

If local biome changes are not practical in a datapack, use a fallback such as special
trial spawners, controlled mob spawning, or mob eggs. The fallback should preserve the
player-facing feeling of unlocking a biome without requiring a wholly custom mob system.

### Villagers and Trades

- Villager variants should reflect the biome regions the player has unlocked.
- Villagers can provide saplings, building blocks, and renewable resources after the
  appropriate biome or structure is unlocked.
- Villager breeding and transport should be meaningful parts of progression.
- Add useful trades such as copper, gold, sand, and other difficult-to-renew resources
  without making villagers the only route to progression.
- Remove or change Wandering Trader trades, especially dirt and saplings, when they
  would allow the player to bypass the intended progression.
- Wandering Traders may remain as optional support rather than a required resource source.

### Trial Spawners, Keys, and Vaults

- Use Trial Spawners, Trial Keys, Vaults, ominous variants, and cooldowns as the primary
  gating system for high-value renewable resources.
- Different structures or biome regions may provide different spawner encounters and
  vault loot.
- Special keys should initially be implemented as Trial Keys with custom data, pending
  research into the supported datapack mechanics.
- Faster or more valuable resource generation should require more complete structure
  construction, additional keys, difficult encounters, or longer cooldowns.
- Possible encounters include Parched for sand, Breezes, and other vanilla mobs added
  in the target version.

### Loot and Drops

- Modify loot tables to make normally exploration-dependent resources renewable.
- Carefully expand monster drops for resources such as sand and clay when this supports
  the progression without making structures irrelevant.
- Structure chests and vaults may provide progression-critical resources, saplings,
  keys, or building materials.

### Guidance

The datapack should communicate structure requirements through some combination of:

- A guide book or advancement tree
- Special advancements for major milestones
- In-world previews or ghosts of required structures
- Clear feedback when a structure is incomplete or successfully activated

An in-world preview is preferred if it can be implemented without requiring a large
custom asset system.

## Content Inventory

The following content still needs to be assigned to the main line or an optional tier:

- Trees: cherry, mangrove, poplar, bamboo, and remaining vanilla tree types
- Hostile mobs: Guardian, Elder Guardian, Stray, Bogged, Parched, Cave Spider,
  Breeze, Hoglin, Pillager, Drowned, Phantom, Raid mobs, Ghast, Shulker, and Sulfur Cube
- Passive and neutral mobs: Chicken, Pig, Sheep, Cow, Horse, Donkey, Goat, Llama,
  Wolf, Nautilus, Axolotl, Ocelot, Parrot, and other biome-specific spawns
- Structures: villages, desert pyramids, jungle temples, ocean ruins, monuments,
  mansions, mineshafts, trail ruins, trial chambers, Nether structures, and End structures
- Resources: all blocks and items normally obtained through exploration, including
  amethyst and calcite

## Open Questions

1. What exact structure should be the first mandatory post-island milestone?
2. Which structures are mandatory for reaching the Nether, and which are optional?
3. How large should each biome region be, and how should overlapping regions work?
4. Can the target version's datapack features reliably identify and modify local biomes?
5. What structure validation approach is practical: block templates, key block checks,
   or a combination?
6. Should the world keep the normal day/night cycle and difficulty settings?
7. Should the datapack support multiplayer from the beginning?
8. How should the starting Abandoned Camp contribute to early progression?
9. Which Trial Key custom-data features are possible without resource-pack assets?
10. Which resources should be renewable through structures, vaults, trades, mob drops,
    or a combination of sources?

## References & Research
- [Minecraft Wiki - Structures](https://minecraft.wiki/w/Structure)
- [Minecraft Wiki - Advancements](https://minecraft.wiki/w/Advancement)
- [Minecraft Wiki - Loot Tables](https://minecraft.wiki/w/Loot_table)
- [Minecraft Wiki - Trees](https://minecraft.wiki/w/Tree)
- See `research/` folder for detailed mechanic documentation
- See `research/DatapackFeasibility.md` for implementation feasibility notes
