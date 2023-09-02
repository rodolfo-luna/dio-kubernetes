echo "Criando as imagens...."

docker build -t denilsonbonatti/projeto-backend:1.0 backend/.
docker build -t denilsonbonatti/projeto-database:1.0 database/.

echo "Realizando o push das imagens...."

docker push projeto-backend:1.0
docker push projeto-database:1.0

echo "Criando servicos no cluster Kubernetes...."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml
