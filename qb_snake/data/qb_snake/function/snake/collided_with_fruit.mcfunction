# Grow the tail
scoreboard players add @e[type=minecraft:marker,tag=currentSnake,limit=1] lastTailIndex 1

# Remove the fruit
kill @e[type=minecraft:item_display,tag=fruit,distance=..0.5,limit=1]

# Play a sound
execute as @a if score @s team = @e[type=minecraft:marker,tag=currentSnake,limit=1] team at @s run playsound entity.generic.eat player @s ~ ~ ~
