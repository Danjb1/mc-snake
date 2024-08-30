# Increase our tailIndex
scoreboard players add @s tailIndex 1

# Truncate any tail entities beyond the max length
execute if score @s tailIndex > @e[type=minecraft:marker,tag=currentSnake,limit=1] lastTailIndex run function qb_snake:snake/request_remove_tail

# Find the new tail end
execute if score @s tailIndex = @e[type=minecraft:marker,tag=currentSnake,limit=1] lastTailIndex run tag @s add lastTail
