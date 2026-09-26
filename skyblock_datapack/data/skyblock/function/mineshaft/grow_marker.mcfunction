execute store result score #l sb.ms store result storage skyblock:mineshaft args.l int 1 run random value -2..2
execute store result score #u sb.ms store result storage skyblock:mineshaft args.u int 1 run random value 0..4
execute store result storage skyblock:mineshaft args.f int 1 run random value -1..1

# Interior cells stay open; only the surrounding shell may change.
execute if score #l sb.ms matches -1..1 if score #u sb.ms matches 1..3 run return 0

function skyblock:mineshaft/pick with storage skyblock:mineshaft args
