
docker build -t duvanoff/api_transformacion .
docker run -d  --name transformarservice -p 7074:9997 duvanoff/api_transformacion
