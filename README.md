# Taller de Docker

## Introducción
Se crearon 4 contenedores para orquestar consumo de servicios en PHP y Java.

- Contenedor: API Routing
- Contenedor: API Transformación
- Contenedor: API Presentación
- Contenedor: API Despachador

## Instrucciones
1. Creación del contenedor
Se descarga el archivo start.sh y este se ejecuta desde la consola de comandos
```bash
wget -O - https://gitlab.com/duvanoffc1/MVA/raw/master/start.sh | bash
```
Este archivo contiene las instrucciones para bajar la imagen de Docker HUB y crear el contenedor en un solo comando.

2. Luego se accede desde el navedagor a la siguiente URL con el puerto 80:
```
 http://localhost/mva/suma.php
```
3. Seguido del suma.php adiciono el signo "?" y sumo las dos variables separadas por el "&":
```
Ej: http://localhost/mva/suma.php?num1=3&num2=5
```
4. Eliminación del contenedor y la imagen
Se descarga el archivo stop.sh y este se ejecuta desde la consola de comandos
```bash
wget -O - https://gitlab.com/duvanoffc1/MVA/raw/master/stop.sh | bash
```
Este archivo contiene las instrucciones para detener y eliminar el contenedor.