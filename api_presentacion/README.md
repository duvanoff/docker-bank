# Aes-Javeriana-ModVal-Dokcer
Camilo Albarracin ModVal

Prerquisitos: 
1. Tener docker instalado

Las instrucciones para desplegar el servicio propuesto en el taller son las siguientes:

1. Abrir la terminal de comandos.

2. Ejecutar el siguiente comando donde se realizara el pull a la imagen docker: 
docker pull kmiloacdcs/capapresentacion

3. Ejecutar el siguiente comando, especificar el puerto y el alias a manejar, en mi caso 8080:8080 y suma respectivamente: 
docker run -d --name presentacion -p 8080:8080 kmiloacdcs/capapresentacion


*Otra forma de ejecutar el servicio ademas de las instrucciones dadas es ejecutar el script start.sh ; Asi mismo para detenerlo el script stop.sh
