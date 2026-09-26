execute if entity @e[type=minecraft:marker,tag=sb.ms,distance=..0.1] run return 0

summon minecraft:marker ~ ~ ~ {Tags:["sb.ms"]}
title @s actionbar {"text":"Mineshaft anchor placed","color":"yellow"}
