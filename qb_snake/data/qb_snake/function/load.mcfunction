# Scoreboards
scoreboard objectives add globals dummy
scoreboard objectives add lastTailIndex dummy
scoreboard objectives add lifetime dummy
scoreboard objectives add loggedOff minecraft.custom:minecraft.leave_game
scoreboard objectives add moveDir dummy
scoreboard objectives add moveDuration dummy
scoreboard objectives add moveTimer dummy
scoreboard objectives add posX dummy
scoreboard objectives add posZ dummy
scoreboard objectives add tailIndex dummy
scoreboard objectives add team dummy
scoreboard objectives add speedX dummy
scoreboard objectives add speedZ dummy

# Triggers
scoreboard objectives add joinRedTrigger trigger
scoreboard objectives add joinBlueTrigger trigger
scoreboard objectives add leaveTeamTrigger trigger
scoreboard objectives add startGameTrigger trigger

# Team setup
team add Red [{"text":"Red","color":"red"}]
team modify Red collisionRule never
team modify Red color red
team modify Red nametagVisibility never
team add Blue [{"text":"Blue","color":"blue"}]
team modify Blue collisionRule never
team modify Blue color blue
team modify Blue nametagVisibility never

# Clean up
kill @e[type=minecraft:marker,tag=snake]
kill @e[type=minecraft:marker,tag=collisionMarker]
kill @e[type=minecraft:block_display,tag=headAnim]
kill @e[type=minecraft:block_display,tag=tailAnim]
fill -24 -31 -18 24 -31 18 minecraft:air replace
execute as @a run function qb_snake:teams/leave_team

# Pause the game
scoreboard players set paused globals 1

# Show the welcome message to everyone already present
execute as @a at @s run function qb_snake:player/display_welcome_message
