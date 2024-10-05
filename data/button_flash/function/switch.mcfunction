
# 懐中電灯のスイッチ音
execute if score @s button_flash.right_click matches 1.. run playsound block.dispenser.fail master @s ~ ~ ~ 1 1.3

## 懐中電灯のスイッチの状態によってモデルを変更する

# 
execute if predicate button_flash:flashlight_mainhand store result score $mainhand_battery button_flash.battery run data get entity @s SelectedItem.components."minecraft:custom_data".battery

execute if predicate button_flash:flashlight_offhand store result score $offhand_battery button_flash.battery run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".battery

# スイッチの状態によって処理を変えるためのスコア
execute if predicate button_flash:flashlight_mainhand_on if score $mainhand_battery button_flash.battery matches 1.. if score @s button_flash.right_click matches 1.. run scoreboard players set @s button_flash.switch 1
execute if predicate button_flash:flashlight_offhand_on if score $offhand_battery button_flash.battery matches 1.. if score @s button_flash.right_click matches 1.. run scoreboard players set @s button_flash.switch 2
execute if predicate button_flash:flashlight_mainhand_off if score $mainhand_battery button_flash.battery matches 1.. if score @s button_flash.right_click matches 1.. run scoreboard players set @s button_flash.switch 3
execute if predicate button_flash:flashlight_offhand_off if score $mainhand_battery button_flash.battery matches 1.. if score @s button_flash.right_click matches 1.. run scoreboard players set @s button_flash.switch 4

# オンの時の処理 -> オフにする
execute if predicate button_flash:flashlight_mainhand_on if score @s button_flash.right_click matches 1.. if score @s button_flash.switch matches 1 run item modify entity @s weapon.mainhand [{"function": "minecraft:set_custom_model_data","value": 1}, {"function": "minecraft:set_custom_data", "tag": "{button_flash: 0}"}]
execute if predicate button_flash:flashlight_offhand_on if score @s button_flash.right_click matches 1.. if score @s button_flash.switch matches 2 run item modify entity @s weapon.offhand [{"function": "minecraft:set_custom_model_data","value": 1}, {"function": "minecraft:set_custom_data", "tag": "{button_flash: 0}"}]

# オフの時の処理 -> オンにする
execute if predicate button_flash:flashlight_mainhand_off if score @s button_flash.right_click matches 1.. if score @s button_flash.switch matches 3 run item modify entity @s weapon.mainhand [{"function": "minecraft:set_custom_model_data","value": 2}, {"function": "minecraft:set_custom_data", "tag": "{button_flash: 1}"}]
execute if predicate button_flash:flashlight_offhand_off if score @s button_flash.right_click matches 1.. if score @s button_flash.switch matches 4 run item modify entity @s weapon.offhand [{"function": "minecraft:set_custom_model_data","value": 2}, {"function": "minecraft:set_custom_data", "tag": "{button_flash: 1}"}]

# リセット
scoreboard players reset @s button_flash.switch
scoreboard players reset @s button_flash.right_click