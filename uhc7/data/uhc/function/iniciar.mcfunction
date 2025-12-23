# Crear el scoreboard si no existe
scoreboard objectives add cuenta_atras dummy "Cuenta Atrás"
# Establecer el tiempo (10 segundos * 20 ticks = 200)
scoreboard players set #global cuenta_atras 200
# Iniciar el bucle
schedule function uhc:countdown 1t