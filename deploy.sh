docker build -t thilina9718/multi-client:latest -t thilina9718/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t thilina9718/multi-server:latest -t thilina9718/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t thilina9718/multi-worker:latest -t thilina9718/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push thilina9718/multi-client:latest
docker push thilina9718/multi-server:latest
docker push thilina9718/multi-worker:latest

docker push thilina9718/multi-client:$SHA
docker push thilina9718/multi-server:$SHA
docker push thilina9718/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=thilina9718/multi-server:$SHA
kubectl set image deployments/client-deployment client=thilina9718/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=thilina9718/multi-worker:$SHA