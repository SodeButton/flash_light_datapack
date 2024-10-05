# 導入時メッセージ
tellraw @a {"text": "【懐中電灯を得る】", "bold": true, "color": "gold", "hoverEvent": {"action": "show_text", "contents": [{"text": "クリックで入手"}]}, "clickEvent": {"action": "run_command", "value": "/function button_flash:give"}}

# スコア定義
scoreboard objectives add button_flash.switch dummy
scoreboard objectives add button_flash.right_click minecraft.used:carrot_on_a_stick
