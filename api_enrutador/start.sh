docker build -t duvanoff/api_enrutador .
docker run -d  --name presentacion -p 7071:8080 duvanoff/api_enrutador
