# Initializes the block display tagged as "currentAnim".
# The executor should be the snake head.

# We translate by (-0.5, -0.5) to center the block display in the block.
# We scale it down a tiny bit so it doesn't prevent the block underneath it from being lit.
data merge entity @e[type=minecraft:block_display,tag=currentAnim,limit=1] {\
    brightness:{sky:15,block:0},\
    transformation:{\
        left_rotation:[0f,0f,0f,1f],\
        right_rotation:[0f,0f,0f,1f],\
        translation:[-0.5f,0f,-0.5f],\
        scale:[0.995f,0.995f,0.995f]}\
    }

# Set the teleport duration based on our move duration
execute store result entity @e[type=minecraft:block_display,tag=currentAnim,limit=1] teleport_duration int 1.0 run scoreboard players get @s moveDuration

# Assign our team
execute store result score @e[type=minecraft:block_display,tag=currentAnim,limit=1] team run scoreboard players get @s team
execute as @e[type=minecraft:block_display,tag=currentAnim,limit=1] run function qb_snake:teams/join_team

# Use team color
execute if score @s team matches 1 run data merge entity @e[type=minecraft:block_display,tag=currentAnim,limit=1] {block_state:{Name:"minecraft:red_concrete"}}
execute if score @s team matches 2 run data merge entity @e[type=minecraft:block_display,tag=currentAnim,limit=1] {block_state:{Name:"minecraft:blue_concrete"}}
