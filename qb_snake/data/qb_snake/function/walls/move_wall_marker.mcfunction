# IMPORTANT: We have just moved, so reset the move timer
scoreboard players reset @s moveTimer

# Leave a trail of blocks
setblock ~ ~ ~ minecraft:white_concrete replace

# Destroy any fruit along the way
kill @e[type=minecraft:item_display,tag=fruit,distance=..0.5,limit=1]

# Rotate 90 degrees when we hit a wall
execute if block ^ ^ ^1 minecraft:white_concrete run tp @s ^ ^ ^ ~90 ~

# Move forward 1 block
execute at @s run tp @s ^ ^ ^1
