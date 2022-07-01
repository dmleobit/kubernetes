# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Deployment instructions

1. Make sure that you have kubertenes running. Easies way to install docker app and run kubernetes there https://docs.docker.com/desktop/mac/
2. Make sure you have kubectl installed.
3. Make sure that you have running node. `kubectl get nodes -o wide`
4. Create a secret for database password `kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345test`
5. Install Ingress Controller by `kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.0/deploy/static/provider/cloud/deploy.yaml`
6. Deploy all your manifest file. `kubectl apply -f k8s/`
7. Run jobs to create database and migrations. `kubectl apply -f kube_jobs/create.yml` and `kubectl apply -f kube_jobs/migrate.yml`
8. GO to your localhost or run `kubectl get ingress` and see the address here if you are not using localhost kube)


Another notes create by blood and sweat :)
KUBERNETES NOTES

1. Stateful Set - Deployments for databases, etc…
2. Необходимые элементы для worker node1. Container Runtime (Docker, etc..)2. Kubelet (Running pods)3. KubeProxy (services work)
3. Master Node1. Api Server (Auth and validation of request)2. Scheduler (decides and make a requestion on which node create a pod, not actually creates, just request to create)3. Controller Manager (monitor if state is changes, pod or node is died or so… Schedule new pods using scheduler)4. Etcd (Cluster brain, key-value store)
4. Main commandskubectl get all | pods | nodes | deployments | pods | replicaset | serviceskubectl edit deployment | etc.. (opens yml file where you change image, etc..)kubectl create deployment —image=test-imagekubectl logs [pod-name]kubectl describe (pod | deployment | service) namekubectl exec (-it optional) [pod-name] — command (bin/bash)kubectl delete (pod | deployment | service ) name (could be used with -f flag)kubectl apply -f file-name
5. Config files components1. Metadata (name, labels, etc)2. Specification3. Status (auto generated, self-healing)
6. Deployment template has own metadata and specifications (applies to pod)
7. echo -n 'secret_password' | base64
8. Namespaces advantagesStructure components (database, elastic, nginx, etc..)Avoid Conflicts (when multiple teams and the same name of deployment)Share Services (Using the same services without duplicates)Access and resources limits (restrict one team from all namespaces except one)You should create own config map and secrets for namespaceYou can use name space service like service-name.namespace-nameYou can’t create in a namespace Persistent Volume and Nodes (it is created globally)kubectl api-resources —namespeced=false (true)
9. Namespace can be set in a metadata with name of a component
10. Kubens - tool which allows you to change default namespace (brew install kubectx)
11. Helm (set - yaml files). There are public and private ones as well. Can be used for creating a template
12. kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345test
13. Ingress Controller nginx
14. Ingress Controller Nginxkubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.0/deploy/static/provider/cloud/deploy.yaml
15. kubectl exec -it pod_name bash (any command)
