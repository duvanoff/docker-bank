# Taller de Docker

## Introducción
Se crearon 4 contenedores para orquestar consumo de servicios en PHP y Java.

- Contenedor: API Routing
- Contenedor: API Transformación
- Contenedor: API Presentación
- Contenedor: API Despachador

## Comentarios

El archivo docker-compose.yml contiene la orquestación de los servicios docker, definiendo cada uno de los puertos de consulta de los servicios y una red docker con nombre "service-docker" haciendo uso de un Bridge para que dichos servicios se conozcan dentro de la misma red.

1. Dockerizacion de servicios
```bash
version: '3'
services:
  apienrutador:
    build: "api_enrutador/."
    ports:
      - "7071:8080"
    networks: 
      - "service-docker"
  apipresentacion:
    build: "api_presentacion/."
    ports:
      - "7072:9999"
    networks: 
      - "service-docker"
  apidespachador:
    build: "api_despachador/."
    ports:
      - "7073:9998"
    networks: 
      - "service-docker"
  apitransformacion:
    build: "api_transformacion/."
    ports:
      - "7074:9997"
    networks: 
      - "service-docker"
networks:
  service-docker:
    driver: bridge
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
