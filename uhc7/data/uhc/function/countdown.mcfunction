# Restar 1 al contador
scoreboard players remove #global cuenta_atras 1

# --- LÓGICA DE SEGUNDOS (Visual y Sonido) ---

# Cada vez que el score coincide con un segundo exacto (múltiplos de 20)
execute if score #global cuenta_atras matches 200 run title @a title {"text":"10", "color":"red"}
execute if score #global cuenta_atras matches 180 run title @a title {"text":"9", "color":"red"}
execute if score #global cuenta_atras matches 160 run title @a title {"text":"8", "color":"red"}
execute if score #global cuenta_atras matches 140 run title @a title {"text":"7", "color":"yellow"}
execute if score #global cuenta_atras matches 120 run title @a title {"text":"6", "color":"yellow"}
execute if score #global cuenta_atras matches 100 run title @a title {"text":"5", "color":"yellow"}
execute if score #global cuenta_atras matches 80 run title @a title {"text":"4", "color":"gold"}
execute if score #global cuenta_atras matches 60 run title @a title {"text":"3", "color":"gold"}
execute if score #global cuenta_atras matches 40 run title @a title {"text":"2", "color":"gold"}
execute if score #global cuenta_atras matches 20 run title @a title {"text":"1", "color":"dark_red"}
playsound minecraft:entity.firework_rocket.blast player @a ~ ~ ~ 1 1

# Al llegar a cero: Título, Teletransporte y Sonido Épico
execute if score #global cuenta_atras matches 0 run title @a title {"text":"¡EMPIEZA UHC 7!", "color":"green"}
execute if score #global cuenta_atras matches 0 run spreadplayers 0 0 1000 2500 false @a

# RECURSIÓN (Línea corregida anteriormente)

execute if score #global cuenta_atras matches 1.. run schedule function uhc:countdown 1t
