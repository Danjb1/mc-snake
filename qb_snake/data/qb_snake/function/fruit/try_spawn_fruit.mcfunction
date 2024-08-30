# Move to a random location (not *quite* all the way to the edges)
execute store result entity @s Pos[0] double 1 run random value -23..23
execute store result entity @s Pos[2] double 1 run random value -17..17

# Center ourselves in the new block
execute at @s run tp ~0.5 ~ ~0.5

# Ensure the block is empty
execute at @s unless block ~ ~ ~ minecraft:air run return 0

# Ensure we are not too close to a snake head
execute at @s if entity @e[type=minecraft:marker,tag=snake,tag=head,distance=..4] run return 0

# Spawn the fruit!
execute at @s run summon minecraft:item_display ~ ~ ~ {Tags:[fruit],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[-1f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:apple",count:1}}
