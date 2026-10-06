Docker image - Dockerfile
Docker container - DockerFile compose file

k8s architecture 
cluster creation

k8s objects :- 
pod (Container) - lightest entity(object) of k8s , in which contaners are kept. in pod generallly our application deployed.
PVC and PV 
replica set and replica controller 
HPA 
INGRESS , Ingress controller
Daemon set 
Deployment 
Services - is used for exposing our pod based application internet. , we also use service to basically for loadbalacing our applications deloyed in pods.
  ClusterIP -kubectl expose pod nginxci --port 80 --type=ClusterIP  (Cluster IP ensures we Assign a static private ip to pod)
  LoadBalancer - it balances the traffic again pod.  kubectl expose pod nginxlb --port 80 --target-port 80 --type=LoadBalancer.
  Nodeport - exposed our pods app on Instances(workernodes) port. kubectl expose pod nginxnp --port 80 --targetPort 80 --type=NodePort
Config map and secrets

command line or scripts(Manifest files)

Manifest files - YAML format

po



