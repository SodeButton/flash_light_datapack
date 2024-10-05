# メインハンドのバッテリーをスコアに保存
execute store result score $battery button_flash.battery run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".battery

# 計算用のスコアを用意
scoreboard players set $1 button_flash.battery 1

# バッテリーを１減らす
scoreboard players operation $battery button_flash.battery -= $1 button_flash.battery

# バッテリーが0より小さくなったら0にする
execute if score $battery button_flash.battery matches ..-1 run scoreboard players set $battery button_flash.battery 0

# バッテリーの値をストレージに保存
execute store result storage button_flash:battery value int 1.0 run scoreboard players get $battery button_flash.battery

# ストレージのバッテリーの値をアイテムに置換する
execute if predicate button_flash:flashlight_offhand_on run item modify entity @s weapon.offhand button_flash:flashlight_set_battery

# バッテリーの状態をLoreで出力
execute if predicate button_flash:flashlight_offhand_on if score $battery button_flash.battery matches 9001..10000 run item modify entity @s weapon.offhand {"function": "minecraft:set_lore","entity": "this","lore": [{"text": ""},{"text": "バッテリー残量","italic": false,"color": "white"},{"text":"■■■■■■■■■■","color": "green","italic": false}],"mode": "replace_all"}

execute if predicate button_flash:flashlight_offhand_on if score $battery button_flash.battery matches 8001..9000 run item modify entity @s weapon.offhand {"function": "minecraft:set_lore","entity": "this","lore": [[{"text": ""}],[{"text": "バッテリー残量","italic": false,"color": "white"}],[{"text":"■■■■■■■■■","color": "green","italic": false}, {"text":"■","color": "red","italic": false}]],"mode": "replace_all"}

execute if predicate button_flash:flashlight_offhand_on if score $battery button_flash.battery matches 7001..8000 run item modify entity @s weapon.offhand {"function": "minecraft:set_lore","entity": "this","lore": [[{"text": ""}],[{"text": "バッテリー残量","italic": false,"color": "white"}],[{"text":"■■■■■■■■","color": "green","italic": false}, {"text":"■■","color": "red","italic": false}]],"mode": "replace_all"}

execute if predicate button_flash:flashlight_offhand_on if score $battery button_flash.battery matches 6001..7000 run item modify entity @s weapon.offhand {"function": "minecraft:set_lore","entity": "this","lore": [[{"text": ""}],[{"text": "バッテリー残量","italic": false,"color": "white"}],[{"text":"■■■■■■■","color": "green","italic": false}, {"text":"■■■","color": "red","italic": false}]],"mode": "replace_all"}

execute if predicate button_flash:flashlight_offhand_on if score $battery button_flash.battery matches 5001..6000 run item modify entity @s weapon.offhand {"function": "minecraft:set_lore","entity": "this","lore": [[{"text": ""}],[{"text": "バッテリー残量","italic": false,"color": "white"}],[{"text":"■■■■■■","color": "green","italic": false}, {"text":"■■■■","color": "red","italic": false}]],"mode": "replace_all"}

execute if predicate button_flash:flashlight_offhand_on if score $battery button_flash.battery matches 4001..5000 run item modify entity @s weapon.offhand {"function": "minecraft:set_lore","entity": "this","lore": [[{"text": ""}],[{"text": "バッテリー残量","italic": false,"color": "white"}],[{"text":"■■■■■","color": "green","italic": false}, {"text":"■■■■■","color": "red","italic": false}]],"mode": "replace_all"}

execute if predicate button_flash:flashlight_offhand_on if score $battery button_flash.battery matches 3001..4000 run item modify entity @s weapon.offhand {"function": "minecraft:set_lore","entity": "this","lore": [[{"text": ""}],[{"text": "バッテリー残量","italic": false,"color": "white"}],[{"text":"■■■■","color": "green","italic": false}, {"text":"■■■■■■","color": "red","italic": false}]],"mode": "replace_all"}

execute if predicate button_flash:flashlight_offhand_on if score $battery button_flash.battery matches 2001..3000 run item modify entity @s weapon.offhand {"function": "minecraft:set_lore","entity": "this","lore": [[{"text": ""}],[{"text": "バッテリー残量","italic": false,"color": "white"}],[{"text":"■■■","color": "green","italic": false}, {"text":"■■■■■■■","color": "red","italic": false}]],"mode": "replace_all"}

execute if predicate button_flash:flashlight_offhand_on if score $battery button_flash.battery matches 1001..2000 run item modify entity @s weapon.offhand {"function": "minecraft:set_lore","entity": "this","lore": [[{"text": ""}],[{"text": "バッテリー残量","italic": false,"color": "white"}],[{"text":"■■","color": "green","italic": false}, {"text":"■■■■■■■■","color": "red","italic": false}]],"mode": "replace_all"}

execute if predicate button_flash:flashlight_offhand_on if score $battery button_flash.battery matches 1..1000 run item modify entity @s weapon.offhand {"function": "minecraft:set_lore","entity": "this","lore": [[{"text": ""}],[{"text": "バッテリー残量","italic": false,"color": "white"}],[{"text":"■","color": "green","italic": false}, {"text":"■■■■■■■■■","color": "red","italic": false}]],"mode": "replace_all"}

execute if predicate button_flash:flashlight_offhand_on if score $battery button_flash.battery matches ..0 run item modify entity @s weapon.offhand {"function": "minecraft:set_lore","entity": "this","lore": [[{"text": ""}],[{"text": "バッテリー残量","italic": false,"color": "white"}],[{"text":"■■■■■■■■■■","color": "red","italic": false}]],"mode": "replace_all"}


# バッテリーが0だったら懐中電灯をoffにする
execute if predicate button_flash:flashlight_offhand_on if score $battery button_flash.battery matches ..0 run item modify entity @s weapon.offhand [{function:"set_custom_data", tag:{button_flash:0}}, {function:"set_custom_model_data", value:1}]