# The anchor block is the structure's state: no lodestone, no module.
execute unless block ~ ~ ~ minecraft:lodestone run return run kill @s

# Active modules tolerate mined-out shell blocks; the grow loop refills them.
execute if entity @s[tag=sb.ms.on] run return run function skyblock:mineshaft/recheck

# Not active yet: the build must be pristine stone, tried against both tunnel axes.
execute rotated 0 0 run function skyblock:mineshaft/check {shell:"minecraft:stone"}
execute if score #ok sb.ms matches 1 run tp @s ~ ~ ~ 0 0
execute if score #ok sb.ms matches 1 run return run function skyblock:mineshaft/activate

execute rotated 90 0 run function skyblock:mineshaft/check {shell:"minecraft:stone"}
execute if score #ok sb.ms matches 1 run tp @s ~ ~ ~ 90 0
execute if score #ok sb.ms matches 1 run function skyblock:mineshaft/activate
