docker build -t thanhdat27/multi-client:latest -t thanhdat27/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t thanhdat27/multi-server:latest - t thanhdat27/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t thanhdat27/multi-worker:latest -t thanhdat27/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push thanhdat27/multi-client:latest
docker push thanhdat27/multi-server:latest
docker push thanhdat27/multi-worker:latest
docker push thanhdat27/multi-client:$SHA
docker push thanhdat27/multi-server:$SHA
docker push thanhdat27/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=thanhdat27/multi-server:$SHA
kubectl set image deployments/client-deployment client=thanhdat27/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=thanhdat27/multi-worker:$SHA
