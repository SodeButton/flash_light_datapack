# 光源を置くようのAECを召喚
execute positioned ~ ~1.62 ~ align xyz if block ~ ~ ~ #button_flash:air run summon area_effect_cloud ~ ~ ~ {Duration:2, Tags:["Light"]}
execute positioned ~ ~1.62 ~ align xyz if block ~ ~ ~ light[waterlogged=false] run summon area_effect_cloud ~ ~ ~ {Duration:2, Tags:["Light"]}
execute positioned ~ ~1.62 ~ align xyz if block ~ ~ ~ water run summon area_effect_cloud ~ ~ ~ {Duration:2, Tags:["Light", "InWater"]}
execute positioned ~ ~1.62 ~ align xyz if block ~ ~ ~ light[waterlogged=true] run summon area_effect_cloud ~ ~ ~ {Duration:2, Tags:["Light", "InWater"]}

# 再帰
execute if entity @s[distance=..7] positioned ^ ^ ^1 run function button_flash:light/summon
