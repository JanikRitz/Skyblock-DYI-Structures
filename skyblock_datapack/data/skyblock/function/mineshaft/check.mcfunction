# Run at the lodestone block centre, rotated so ^forward follows the tunnel.
# Offsets are ^left ^up ^forward. Interior blocks are never checked, so rails,
# torches and cobwebs are free decoration.
scoreboard players set #ok sb.ms 1

# --- support arch (forward 0) ---
# floor ring, the centre block is the lodestone itself
$execute unless block ^-2 ^0 ^0 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-1 ^0 ^0 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^1 ^0 ^0 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^0 ^0 $(shell) run scoreboard players set #ok sb.ms 0
# fence posts
$execute unless block ^-2 ^1 ^0 $(shell) run scoreboard players set #ok sb.ms 0
execute unless block ^-1 ^1 ^0 minecraft:oak_fence run scoreboard players set #ok sb.ms 0
execute unless block ^1 ^1 ^0 minecraft:oak_fence run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^1 ^0 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-2 ^2 ^0 $(shell) run scoreboard players set #ok sb.ms 0
execute unless block ^-1 ^2 ^0 minecraft:oak_fence run scoreboard players set #ok sb.ms 0
execute unless block ^1 ^2 ^0 minecraft:oak_fence run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^2 ^0 $(shell) run scoreboard players set #ok sb.ms 0
# log beam
$execute unless block ^-2 ^3 ^0 $(shell) run scoreboard players set #ok sb.ms 0
execute unless block ^-1 ^3 ^0 minecraft:oak_log run scoreboard players set #ok sb.ms 0
execute unless block ^0 ^3 ^0 minecraft:oak_log run scoreboard players set #ok sb.ms 0
execute unless block ^1 ^3 ^0 minecraft:oak_log run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^3 ^0 $(shell) run scoreboard players set #ok sb.ms 0
# ceiling
$execute unless block ^-2 ^4 ^0 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-1 ^4 ^0 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^0 ^4 ^0 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^1 ^4 ^0 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^4 ^0 $(shell) run scoreboard players set #ok sb.ms 0

execute if score #ok sb.ms matches 0 run return 0

# --- tunnel slice behind (forward -1) ---
$execute unless block ^-2 ^0 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-1 ^0 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^0 ^0 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^1 ^0 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^0 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-2 ^1 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^1 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-2 ^2 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^2 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-2 ^3 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^3 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-2 ^4 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-1 ^4 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^0 ^4 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^1 ^4 ^-1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^4 ^-1 $(shell) run scoreboard players set #ok sb.ms 0

execute if score #ok sb.ms matches 0 run return 0

# --- tunnel slice ahead (forward 1) ---
$execute unless block ^-2 ^0 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-1 ^0 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^0 ^0 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^1 ^0 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^0 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-2 ^1 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^1 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-2 ^2 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^2 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-2 ^3 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^3 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-2 ^4 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^-1 ^4 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^0 ^4 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^1 ^4 ^1 $(shell) run scoreboard players set #ok sb.ms 0
$execute unless block ^2 ^4 ^1 $(shell) run scoreboard players set #ok sb.ms 0
