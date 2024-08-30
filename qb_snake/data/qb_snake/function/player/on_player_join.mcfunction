# IMPORTANT: Reset login detection mechanism
scoreboard players reset @s loggedOff

# If we were previously on a team, leave it, or things could get messy
function qb_snake:teams/leave_team

function qb_snake:player/display_welcome_message
