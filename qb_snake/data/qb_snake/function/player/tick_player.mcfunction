# Detect first login
execute as @s[tag=!playerInit] run function qb_snake:player/init_player

# Detect subsequent logins
execute as @s[scores={loggedOff=1..}] run function qb_snake:player/on_player_join

# Check for triggers
execute as @s[scores={joinRedTrigger=1..}] at @s run function qb_snake:player/request_join_red
execute as @s[scores={joinBlueTrigger=1..}] at @s run function qb_snake:player/request_join_blue
execute as @s[scores={startGameTrigger=1..}] at @s run function qb_snake:player/request_start_game
execute as @s[scores={leaveTeamTrigger=1..}] at @s run function qb_snake:player/request_leave_team

# Keep in place (add tag "dev" to prevent this)
tp @s[tag=!dev] 0.5 48 0.5 180 90
