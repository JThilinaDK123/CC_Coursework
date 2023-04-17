docker build -t thilina9718/deploy-app:latest -t thilina9718/deploy-app:$SHA -f ./Dockerfile .

docker push thilina9718/deploy-app:latest

docker push thilina9718/deploy-app:$SHA

kubectl apply -f deployment.yml
kubectl set image deployments/deployment-nodeapp server = thilina9718/deploy-app:$SHA
