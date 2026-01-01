# 1. Si ya era Zombie y murió, pasa a espectador
gamemode spectator @a[team=Zombie,scores={Muertes=1..}]

# 2. Si no era Zombie y murió, se une al equipo
team join Zombie @a[team=!Zombie,scores={Muertes=1..}]

# 3. Teletransportar a los NUEVOS zombies a un lugar seguro en x=30, z=30
# Usamos 'execute' para que el comando busque la superficie (y=~ o un valor alto)
execute as @a[team=Zombie,scores={Muertes=1..}] at @s run teleport @s 30 -64 30
execute as @a[team=Zombie,scores={Muertes=1..}] at @s run tp @s 30 ~ 30

# Nota: Una forma más profesional de asegurar "altura no peligrosa" es esta:
execute as @a[team=Zombie,scores={Muertes=1..}] run spreadplayers 30 30 0 1 false @s

# 4. Finalmente, resetear el marcador
scoreboard players reset @a[scores={Muertes=1..}]

# --- LÓGICA ÍTEM 1 (1 PUNTO) ---
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:1}}}]}, tag=!recibido_1] at @s run playsound minecraft:entity.firework_rocket.blast player @a ~ ~ ~ 1 1
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:1}}}]}, tag=!recibido_1] run tellraw @a [{"selector":"@s","color":"yellow"},{"text":" ha conseguido 1 PUNTO (Vale del Nether)!","color":"red"}]
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:1}}}]}, tag=!recibido_1] run scoreboard players add @s puntos_items 1
tag @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:1}}}]}] add recibido_1

# --- LÓGICA ÍTEM 2 (2 PUNTOS) ---
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:2}}}]}, tag=!recibido_2] at @s run playsound minecraft:entity.firework_rocket.blast player @a ~ ~ ~ 1 1
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:2}}}]}, tag=!recibido_2] run tellraw @a [{"selector":"@s","color":"yellow"},{"text":" ha conseguido 2 PUNTOS (Vale del End)!","color":"light_purple","bold":true}]
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:2}}}]}, tag=!recibido_2] run scoreboard players add @s puntos_items 2
tag @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:2}}}]}] add recibido_2

# --- LÓGICA ÍTEM 3 (1 PUNTO) ---
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:3}}}]}, tag=!recibido_3] at @s run playsound minecraft:entity.firework_rocket.blast player @a ~ ~ ~ 1 1
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:3}}}]}, tag=!recibido_3] run tellraw @a [{"selector":"@s","color":"yellow"},{"text":" ha conseguido 1 PUNTO (Vale del PvP)!","color":"gold"}]
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:3}}}]}, tag=!recibido_3] run scoreboard players add @s puntos_items 1
tag @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:3}}}]}] add recibido_3

# --- LÓGICA ÍTEM 4 (1 PUNTO) ---
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:4}}}]}, tag=!recibido_4] at @s run playsound minecraft:entity.firework_rocket.blast player @a ~ ~ ~ 1 1
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:4}}}]}, tag=!recibido_4] run tellraw @a [{"selector":"@s","color":"yellow"},{"text":" ha conseguido 1 PUNTO (Vale del Minero)!","color":"green"}]
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:4}}}]}, tag=!recibido_4] run scoreboard players add @s puntos_items 1
tag @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:4}}}]}] add recibido_4

# --- LÓGICA ÍTEM 5 (1 PUNTO) ---
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:5}}}]}, tag=!recibido_5] at @s run playsound minecraft:entity.firework_rocket.blast player @a ~ ~ ~ 1 1
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:5}}}]}, tag=!recibido_5] run tellraw @a [{"selector":"@s","color":"yellow"},{"text":" ha conseguido 1 PUNTO (Vale del Polvo)","color":"white"}]
execute as @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:5}}}]}, tag=!recibido_5] run scoreboard players add @s puntos_items 1
tag @a[nbt={Inventory:[{components:{"minecraft:custom_data":{id_item:5}}}]}] add recibido_5

# --- LIMPIEZA Y MUERTE (IGUAL QUE ANTES) ---
execute as @a run clear @s paper[custom_data={id_item:1}]
execute as @a run clear @s paper[custom_data={id_item:2}]
execute as @a run clear @s paper[custom_data={id_item:3}]
execute as @a run clear @s paper[custom_data={id_item:4}]
execute as @a run clear @s paper[custom_data={id_item:5}]

execute as @a[scores={muertes=1..}] run tellraw @a [{"selector":"@s","color":"red"},{"text":" ha muerto y perdido todos sus puntos!","color":"white"}]
execute as @a[scores={muertes=1..}] run scoreboard players set @s puntos_items 0
execute as @a[scores={muertes=1..}] run tag @s remove recibido_1
execute as @a[scores={muertes=1..}] run tag @s remove recibido_2
execute as @a[scores={muertes=1..}] run tag @s remove recibido_3
execute as @a[scores={muertes=1..}] run tag @s remove recibido_4
execute as @a[scores={muertes=1..}] run tag @s remove recibido_5
execute as @a[scores={muertes=1..}] run scoreboard players set @s muertes 0

# 1. Si no tiene la cabeza puesta, se la pone
execute as @a[team=Zombie] unless items entity @s armor.head minecraft:zombie_head run item replace entity @s armor.head with minecraft:zombie_head
