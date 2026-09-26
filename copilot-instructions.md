# Repository Instructions

## Project Context

This repository develops a vanilla Minecraft Java Edition 26.3 Skyblock datapack. The target experience is a vanilla-like progression from an Overworld starter island through the Nether and End, with renewable exploration resources unlocked through player-built structures.

## Working Principles

- Keep the datapack vanilla-like and prefer existing blocks, items, mobs, structures, trial spawners, vaults, loot tables, advancements, and commands.
- Fix root causes and keep changes narrowly scoped to the requested milestone.
- Preserve the intended loop: the player builds most of a structure, the datapack validates functional requirements, and activation performs a limited meaningful transformation or unlock.
- Do not make global mob drops, wandering traders, or custom systems flatten the progression. Critical resources should have a structure-based or encounter-based route.
- Treat full structure validation, local biome precision, natural spawning, vault key customization, block-entity setup, and 26.x trade predicates as experimental until verified in-game.
- Prefer anchor-based or player-triggered validation. Never scan large structures continuously every tick.
- Use scoreboards for cheap numeric state and command storage for structured unlocks, placed regions, and completed structures.
- Keep the project multiplayer-capable unless a task explicitly records a different decision.

## Development Workflow

- Track implementation and experiments in `TASKS.md`; keep progression and design decisions in `PLAN.md`.
- Record experiment commands, Minecraft version, observed behavior, and decisions in `research/Experiments.md` when that file exists or when an experiment produces reusable knowledge.
- Build a thin vertical slice before expanding the content inventory: datapack skeleton, one small structure, one resource loop, one biome or mob unlock, one trial/vault loop, and one trade path.
- For every feature, define an acceptance check before implementation. Prefer small reversible prototypes for uncertain mechanics.
- Use explicit go/no-go decisions for risky mechanics. Implement the documented fallback when a prototype fails instead of blocking unrelated progress.

## Validation Requirements

Every milestone should be checked in a clean test world and include:

1. `/reload` and datapack load checks.
2. Incomplete, valid, repeated, and reset/reload activation cases.
3. A player-flow test using only normal progression after test-world setup.
4. Regression checks for prior unlocks, loot, trades, and multiplayer state.

When a focused executable test or in-game test exists, run it before broad refactoring or documentation work. Do not claim a mechanic works from data inspection alone when its behavior depends on Minecraft runtime behavior.
