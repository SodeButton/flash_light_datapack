
## 常時実行Function

# 右クリック時の処理
# execute as @a at @s if score @s button_flash.right_click matches 1.. run function button_flash:switch
execute as @a at @s if predicate button_flash:flashlight run function button_flash:switch

# 点灯状態の懐中電灯を手に持っていたら -> 光を出す
execute as @a at @s if predicate button_flash:flashlight_on run function button_flash:light/summon

# 点灯状態の懐中電灯を手に持っていたら -> 耐久値を減らす
execute as @a at @s if predicate button_flash:flashlight_mainhand_on run item modify entity @s weapon.mainhand button_flash:remove_durability
execute as @a at @s if predicate button_flash:flashlight_offhand_on run item modify entity @s weapon.offhand button_flash:remove_durability

# 懐中電灯が壊れたらモデル変更
execute as @a if predicate button_flash:flashlight_mainhand_broke run item modify entity @s weapon.mainhand [{"function": "minecraft:set_custom_model_data","value": 1}, {"function": "minecraft:set_custom_data", "tag": "{button_flash: 0}"}]
execute as @a if predicate button_flash:flashlight_offhand_broke run item modify entity @s weapon.offhand [{"function": "minecraft:set_custom_model_data","value": 1}, {"function": "minecraft:set_custom_data", "tag": "{button_flash: 0}"}]

# 光源AECとして光源を設置／撤去
execute as @e[type=area_effect_cloud,tag=Light] at @s run function button_flash:light/_

scoreboard players reset @a button_flash.switch
scoreboard players reset @a button_flash.right_click