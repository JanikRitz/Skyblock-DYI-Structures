function skyblock:mineshaft/check {shell:"#skyblock:mineshaft_shell"}
execute if score #ok sb.ms matches 0 run function skyblock:mineshaft/deactivate
