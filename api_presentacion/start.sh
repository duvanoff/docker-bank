
docker build -t kmiloacdcs/capapresentacion .
docker run -d  --name presentacion -p 8081:8081 kmiloacdcs/capapresentacion
