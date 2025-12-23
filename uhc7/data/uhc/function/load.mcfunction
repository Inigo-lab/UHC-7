gamerule natural_health_regeneration false

scoreboard objectives add Muertes deathCount
team add Zombie
team modify Zombie color dark_green


scoreboard objectives add Vida health
scoreboard objectives setdisplay list Vida

worldborder center 0.0 0.0
worldborder set 5000

scoreboard objectives add puntos_items dummy "Puntos Totales"
scoreboard objectives add muertes deathCount
scoreboard objectives setdisplay sidebar puntos_items
scoreboard objectives modify puntos_items displayname {"text":"Puntos Totales","color":"gold"}

