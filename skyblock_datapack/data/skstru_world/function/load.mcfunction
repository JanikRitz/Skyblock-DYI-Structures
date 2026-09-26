say §cSkyblock Mode

scoreboard objectives add spawn dummy
setworldspawn 0 64 0
execute as @a unless score @s spawn = @s spawn run scoreboard players set @s spawn 0
execute as @a[scores={spawn=0}] run tp @s 0 64 0
scoreboard players set @a[scores={spawn=0}] spawn 1
execute unless score #global spawn matches 1.. run schedule function skstru_world:place_island 1t replace