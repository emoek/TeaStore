#!/bin/bash

kubectl delete deployment teastore-auth teastore-db teastore-image teastore-persistence teastore-recommender teastore-registry teastore-webui
kubectl delete svc teastore-db teastore-registry teastore-webui
echo "all Teastore Kieker resources of the manual deployment deleted successfully"
