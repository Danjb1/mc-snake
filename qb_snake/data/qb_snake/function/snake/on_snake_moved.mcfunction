# Place down our team color
execute if score @s team matches 1 run setblock ~ ~ ~ minecraft:red_concrete replace
execute if score @s team matches 2 run setblock ~ ~ ~ minecraft:blue_concrete replace

# Update our tail entities
execute as @e[type=minecraft:marker,tag=tail] if score @s team = @e[type=minecraft:marker,tag=currentSnake,limit=1] team at @s run function qb_snake:snake/update_tail

# Start moving the tail animation towards the new tail end
execute as @e[type=minecraft:marker,tag=lastTail] if score @s team = @e[type=minecraft:marker,tag=currentSnake,limit=1] team run tag @s add currentTail
execute as @e[type=minecraft:block_display,tag=tailAnim] if score @s team = @e[type=minecraft:marker,tag=currentSnake,limit=1] team run tp @s @e[type=minecraft:marker,tag=currentTail,limit=1]
tag @e[type=minecraft:marker,tag=currentTail,limit=1] remove currentTail
