# Display win/loss message
execute as @a if score @s team = @e[type=minecraft:marker,tag=currentSnake,limit=1] team at @s run function qb_snake:player/display_loss_message
execute as @a unless score @s team = @e[type=minecraft:marker,tag=currentSnake,limit=1] team at @s run function qb_snake:player/display_win_message

# Pause
scoreboard players set paused globals 1

# Cleanup
kill @s
