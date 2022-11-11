#/bin/bash

echo "Criando a imagem Backend..."

docker build backend/ -t andersonlbsilva/projetok8-backend:1.0

echo "Criando a imagem Banco de Dados..."

docker build database/ -t andersonlbsilva/projetok8-database:1.0

echo "Realizando push das imagens..."

docker push andersonlbsilva/projetok8-backend:1.0

docker push andersonlbsilva/projetok8-database:1.0

echo "criando servicos no kubernetes..."

kubectl apply -f ./services.yml

echo "criando servicos no kubernetes..."

kubectl apply -f ./volume.yml

echo "criando deplyments no kubernetes..."

kubectl apply -f ./deployment.yml
