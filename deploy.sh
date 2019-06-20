# Build all images
docker build -t developerrohitkhatri/multi-client:latest -t developerrohitkhatri/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t developerrohitkhatri/multi-server:latest -t developerrohitkhatri/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t developerrohitkhatri/multi-worker:latest -t developerrohitkhatri/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# Push all images to docker hub
docker push developerrohitkhatri/multi-client:latest
docker push developerrohitkhatri/multi-client:$SHA

docker push developerrohitkhatri/multi-server:latest
docker push developerrohitkhatri/multi-server:$SHA

docker push developerrohitkhatri/multi-worker:latest
docker push developerrohitkhatri/multi-worker:$SHA

# Apply kubernetes config
kubectl apply -f k8s

# Set image manually to deployment to make sure It's latest running code
kubectl set image deployment/server-deployment server=developerrohitkhatri/multi-server:$SHA
kubectl set image deployment/client-deployment client=developerrohitkhatri/multi-client:$SHA
kubectl set image deployment/worker-deployment worker=developerrohitkhatri/multi-worker:$SHA