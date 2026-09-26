execute unless score #global spawn matches 1.. run forceload add -1 -4 16 16
execute unless score #global spawn matches 1.. store success score #global spawn run place template skstru_world:skyblock_tent -1 60 -4
execute if score #global spawn matches 1.. run forceload remove -1 -4 16 16
execute if score #global spawn matches 0 run schedule function skstru_world:place_island 1t replace