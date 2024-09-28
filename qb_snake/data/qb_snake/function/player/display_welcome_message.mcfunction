tellraw @s [{"text":"Welcome to Snake!","color":"yellow"}]

tellraw @s {"text":"Lower FOV for the best experience.","color":"aqua"}

tellraw @s {"text":"Also rebind hotbar 1/2/3/4 to Up/Left/Down/Right (WASD)!","color":"aqua"}

tellraw @s [\
    {"text":"\n ▶ Pick a color: [","color":"white"},\
    {"text":"Red","clickEvent":{"action":"run_command","value":"/trigger joinRedTrigger set 1"},"color":"red","underlined":true},\
    {"text":"] [","color":"white"},\
    {"text":"Blue","clickEvent":{"action":"run_command","value":"/trigger joinBlueTrigger set 1"},"color":"blue","underlined":true},\
    {"text":"]\n","color":"white"}]
