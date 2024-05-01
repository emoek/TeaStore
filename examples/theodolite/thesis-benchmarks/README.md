## Install Theodolite

As we are using the modified version of Theodolite, which has not been released yet, we need to clone Theodolite's repository and install it as follows:



```sh
helm install theodolite https://github.com/emoek/theodolite/tree/mod-efficiency -f <preconfig>
```


## Setup Monitoring

If you are operating on a bare-metal cluster and have root privileges, install Kepler's Helm Chart manually:

```sh
helm repo add kepler https://sustainable-computing-io.github.io/kepler-helm-chart

helm install kepler kepler/kepler --namespace kepler --create-namespace
``` 

### Logging Infrastructure

If you want to utilize the TeaStore with Kieker and the corresponding Logging Infrastructure, follow these steps:

```
kubectl create configmap promtail-config --from-file=../../kubernetes/teastore-rabbitmq-promtail/promtail-config.yaml

kubectl apply -f ../../kubernetes/teastore-rabbitmq-promtail/teastore-promtail-rabbitmq.yaml
``` 

Use the preconfig to install Loki.

## Create ConfigMap for SUT Files

### TeaStore with Kieker
```sh
kubectl create configmap teastore-deployment --from-file=../../kubernetes/teastore-kieker-split
```

### TeaStore with Kieker and Resource Restrictions
```sh
kubectl create configmap teastore-deployment-res --from-file=../../kubernetes/teastore-kieker-split-res
```

### TeaStore with Kieker and Resource Restrictions -> Placing pods on two different Nodes
```sh
kubectl create configmap teastore-deployment --from-file=../../kubernetes/teastore-kieker-split-res-af
```

### TeaStore with Kieker and Resource Restrictions -> use this if you want to use the Non-Isolated Experiment Runner, or just remove the Service Resource of the "WebUI" service
```sh
kubectl create configmap teastore-deployment --from-file=../../kubernetes/teastore-kieker-split-res-noserv
```


### TeaStore without Kieker and without Resource Restrictions
```sh
kubectl create configmap teastore-deployment --from-file=../../kubernetes/teastore-clusterip-split/
```

## Create ConfigMap for Load Profile

### Base Loop Load Profile

```sh
kubectl create configmap teastore-jmeter-browse-base --from-file=../../jmeter/teastore_browse_base_loop.jmx
kubectl create configmap teastore-jmeter-deployment-base-loop --from-file=../jmeter-base-loop.yaml
```

### RPS Load Profile

```sh
kubectl create configmap teastore-jmeter-browse-rps --from-file=../../jmeter/teastore_browse_base_loop.jmx
kubectl create configmap teastore-jmeter-deployment-rps --from-file=../jmeter-base-rps.yaml
```

## Setup Benchmark

```sh
kubectl apply -f theomod_benchmark_v27.yaml
```

## Start Benchmark Execution

```sh
kubectl apply -f theomod_execution_v27.yaml
```

## Uninstall Everything

Uninstall OSM:

```sh
helm uninstall osm --namespace osm-system
kubectl delete ns osm-system
```

Uninstall Theodolite:

```sh
helm uninstall theodolite
```
