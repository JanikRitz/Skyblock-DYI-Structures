execute if block ~ ~ ~ minecraft:stone run return run function skyblock:mineshaft/ore

# Mined-out shell blocks slowly heal back into stone so the mine stays renewable.
execute if block ~ ~ ~ minecraft:air run setblock ~ ~ ~ minecraft:stone
