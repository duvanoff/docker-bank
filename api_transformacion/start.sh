
docker build -t kmiloacdcs/transformarservice .
docker run -d  --name transformarservice -p 8084:8084 kmiloacdcs/transformarservice
