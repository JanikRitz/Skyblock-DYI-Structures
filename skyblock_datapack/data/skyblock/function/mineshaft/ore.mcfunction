execute store result score #r sb.ms run random value 1..10
execute if score #r sb.ms matches 1..7 run setblock ~ ~ ~ minecraft:coal_ore
execute if score #r sb.ms matches 8..10 run setblock ~ ~ ~ minecraft:iron_ore
