# Place down our color
# TODO: Use team colors
setblock ~ ~ ~ minecraft:red_concrete replace

# Increase the tailIndex of all tail entities
# TODO: Don't update other snake's tails!
scoreboard players add @e[type=minecraft:marker,tag=tail] tailIndex 1

# Truncate our tail
execute as @e[type=minecraft:marker,tag=tail] at @s if score @s tailIndex > @e[type=minecraft:marker,tag=head,limit=1] lastTailIndex run function qb_snake:request_remove_tail

# Find the new tail end
# TODO: Only pick OUR snake
execute as @e[type=minecraft:marker,tag=tail] if score @s tailIndex = @e[type=minecraft:marker,tag=head,limit=1] lastTailIndex run tag @s add lastTail

# Tell the tail animation to start moving to the new tail end
# TODO: Don't move other snake's animations!
tp @e[type=minecraft:block_display,tag=tailAnim,limit=1] @e[type=minecraft:marker,tag=lastTail,limit=1]
