
## 常時実行Function

# 右クリック時の処理
# execute as @a at @s if score @s button_flash.right_click matches 1.. run function button_flash:switch
execute as @a at @s if predicate button_flash:flashlight run function button_flash:switch

# 点灯状態の懐中電灯を手に持っていたら -> 光を出す
execute as @a at @s if predicate button_flash:flashlight_on run function button_flash:light/summon

# 点灯状態の懐中電灯を手に持っていたらバッテリーを減らす
execute as @a at @s if predicate button_flash:flashlight_on run function button_flash:battery/_

# 光源AECとして光源を設置／撤去
execute as @e[type=area_effect_cloud,tag=Light] at @s run function button_flash:light/_

scoreboard players reset @a button_flash.switch
scoreboard players reset @a button_flash.right_click