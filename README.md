Jenkins - http://localhost:8000/
App - http://localhost:8080/hello after port forwarding

Two k8s clusters - 

1. docker-desktop for task-1
2. minikube for task-2

To switch between docker-daemons - 

1. For docker-desktop:  eval $(minikube docker-env -u)
2. For minikube: eval $(minikube docker-env)

To start jenkins agent:

curl -sO http://localhost:8000/jnlpJars/agent.jar;java -jar agent.jar -url http://localhost:8000/ -secret c03d83fdde0e53295db9ea7ca7fc282e09811cb25e510476f960097e0a346dc5 -name "my_mac" -webSocket -workDir "/Users/huzaifamushfiq/Desktop/jenkins-agent"

To start gh-runner:

cd desktop/actions-runner && ./run.sh