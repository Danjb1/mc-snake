# Initialize scoreboards
scoreboard objectives add globals dummy
scoreboard objectives add lastTailIndex dummy
scoreboard objectives add lifetime dummy
scoreboard objectives add moveDir dummy
scoreboard objectives add moveDuration dummy
scoreboard objectives add moveTimer dummy
scoreboard objectives add posX dummy
scoreboard objectives add posZ dummy
scoreboard objectives add tailIndex dummy
scoreboard objectives add speedX dummy
scoreboard objectives add speedZ dummy

# Clean up
kill @e[type=minecraft:marker,tag=snake]
kill @e[type=minecraft:marker,tag=collisionMarker]
kill @e[type=minecraft:block_display,tag=headAnim]
kill @e[type=minecraft:block_display,tag=tailAnim]
fill -24 -31 -18 24 -31 18 minecraft:air replace
fill -24 -30 -18 24 -30 18 minecraft:light[level=15] replace

# Setup players
tp @a 0.5 48 0.5 180 90
tellraw @a {"text":"Set FOV to 30 for the best experience","color":"aqua"}
effect give @a invisibility infinite 1 true

# Setup snake
summon minecraft:marker 0 -31 0 {Tags:[snake,head]}
execute as @e[type=minecraft:marker,tag=snake] at @s run function qb_snake:init_snake

# Pause the game
scoreboard players set paused globals 1
