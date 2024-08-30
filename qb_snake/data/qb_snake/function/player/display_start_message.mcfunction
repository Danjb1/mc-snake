tellraw @s [\
    {"text":"\n ▶ [","color":"white"},\
    {"text":"Start Game","clickEvent":{"action":"run_command","value":"/trigger startGameTrigger set 1"},"color":"green","underlined":true},\
    {"text":"] [","color":"white"},\
    {"text":"Reset Color","clickEvent":{"action":"run_command","value":"/trigger leaveTeamTrigger set 1"},"color":"red","underlined":true},\
    {"text":"]\n","color":"white"}]
