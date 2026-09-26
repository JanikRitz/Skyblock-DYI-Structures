# Implementation Tasks

This backlog follows the MVP timeline in the project plan. Complete tasks in order unless a dependency is explicitly marked otherwise.

## Week 1: Foundation

- [ ] Decide and record multiplayer scope, normal difficulty/day-night settings, and the first mandatory post-island structure in `PLAN.md`.
  - Acceptance: the three decisions are written down with their rationale.

- [ ] Create the minimal datapack skeleton for Minecraft Java Edition 26.3.
  - Scope: `load`, `tick`, one namespace, scoreboards, command storage defaults, and one advancement tab.
  - Acceptance: a fresh test world loads the pack without errors; `/reload` succeeds; the test advancement and function produce visible feedback.

- [ ] Create a repeatable clean-world test procedure.
  - Scope: document world setup, pack installation, useful commands, and how to reset progression.
  - Acceptance: another person can reproduce the baseline test without undocumented steps.

## Week 2: Structure Activation Prototype

- [ ] Prototype an anchor-based Abandoned Camp or Trail Ruins module.
  - Scope: detect an anchor, check required dimensions/features/materials, reject incomplete builds, and record completion once.
  - Acceptance: incomplete builds fail clearly; a valid build activates once; moving or reusing the completed anchor cannot duplicate the reward.

- [ ] Prototype a limited structure transformation.
  - Scope: transform a small set of blocks, such as gravel into suspicious gravel, and grant a structure-specific unlock.
  - Acceptance: only intended blocks change; the transformation survives `/reload`; repeated detection does not duplicate rewards.

- [ ] Add the first advancement and player feedback for structure progress.
  - Scope: incomplete, successful, and already-completed messages or actionbar feedback.
  - Acceptance: each state is distinguishable during normal play and does not spam every tick.

## Feasibility Gates

- [ ] [EXP] Test `/fillbiome` precision on a small island region.
  - Target: Week 3
  - Acceptance: record actual boundary behavior, biome checks, and at least one spawn result in `research/Experiments.md`.
  - Decision: use approximate biome regions or switch to datapack-owned zones with controlled spawning.

- [ ] [EXP] Test one trial spawner and one vault reward loop.
  - Target: Week 4
  - Acceptance: custom spawner configuration, reward loot, key use, cooldown, and ominous behavior are each observed in-game.
  - Decision: determine whether custom key data works; otherwise use vanilla keys plus location, unlock state, or conversion logic.

- [ ] [EXP] Test one gated villager trade and one Wandering Trader bypass removal.
  - Target: Week 5
  - Acceptance: the intended villager trade is available only after its unlock; the bypass trade cannot provide the restricted resource; a non-trade route remains available.

- [ ] [EXP] Measure chunked `execute if blocks` validation for a realistic module.
  - Target: Week 6
  - Acceptance: record command count, activation time, loaded-chunk requirements, and the largest practical module size.
  - Decision: choose targeted checks, chunked template checks, or a smaller modular structure standard.

## MVP Completion

- [ ] Complete one vertical slice from starter island to the next progression milestone.
  - Acceptance: a clean-world player can build the prototype structure, activate its resource loop, receive its biome/mob or encounter unlock, and reach the next milestone without operator commands.

- [ ] Run the MVP regression pass.
  - Acceptance: `/reload`, incomplete/valid/repeated activation, reset behavior, prior unlock persistence, loot, trades, and a two-player test all pass.
