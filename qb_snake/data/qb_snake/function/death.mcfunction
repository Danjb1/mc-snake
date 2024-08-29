# Display loss message
# TODO: Only display to snake's own team
title @a times 20 100 20
title @a title {"text":"You lose!","color":"red"}

# Pause
scoreboard players set paused globals 1

# Cleanup
kill @s
