scoreboard players add #ray sb.ms 1
execute if block ~ ~ ~ minecraft:lodestone run return run execute align xyz positioned ~.5 ~.5 ~.5 run function skyblock:mineshaft/mark
execute if score #ray sb.ms matches 40.. run return 0
execute positioned ^ ^ ^0.25 run function skyblock:mineshaft/raycast
