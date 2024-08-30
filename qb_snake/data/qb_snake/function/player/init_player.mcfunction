# IMPORTANT: Prevent repeat initialization
tag @s add playerInit

# Make players invisible so they don't block each other's view
effect give @a minecraft:invisibility infinite 1 true

# Adventure mode so no-one breaks anything
gamemode adventure @s

# Enable triggers
scoreboard players enable @s joinRedTrigger
scoreboard players enable @s joinBlueTrigger
scoreboard players enable @s startGameTrigger
scoreboard players enable @s leaveTeamTrigger
