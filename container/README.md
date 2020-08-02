* images distroless pour améliorer la sécurité https://github.com/GoogleContainerTools/distroless#docker
* build slim + runtime-optimized images based on Gentoo https://github.com/edannenberg/kubler 
* une seule ligne `RUN` pour réduire la taille de l'image docker
* l'application dockerisée n'a pas besoin d'être root => utiliser l'instructio `RUN` pour créer les noms de group et de user:

        RUN groupadd -g 999 mon_user && useradd -r -u 999 -g mon_user mon_user
        USER mon_user
* mot de passe => le passer par une variable d'environnement au lancement de l'image Docker `MDP=azerty sudo --preserve-env MDP docker run -e MDP`
* skaffold = Plugin IDE pour tester son code (Go, Node, Java, and Python) avec k8s sur Google GKE, Amazon EKS et Azure AKS https://youtu.be/Ns0fHKuv7_Y
* pour le stockage de fichiers ou base de données, ce n'est pas recommandé d'utiliser docker, utiliser plutôt EC2 (AWS), Google Compute, App Engine…
* Docker-Compose = start multiple containers on a single host
* Docker-Swarm = start multiple containers across multiple hosts running the Docker engine
* K8s = Kubernetes = alternative à Docker-Swarm = orchestrateur de containers docker https://www.linkedin.com/posts/xavier-pestel_kubernetes-1-introduction-activity-6598847339266355200-MQgT/
* K8s managé = pour le serverless = permet de faire des économies en créant dynamiquement des conteneurs en cas de besoin, et en les arrêtant quand ce n'est plus nécessaire
* K3s = La société Rancher a remarqué que K8s est gourmand en mémoire et CPU et embarque énormément de composants (notamment des composants en version bêta), d'où K3s, qui est un K8s light, qui peut tourner sur un Raspberry Pi https://blog.stephane-robert.info/post/installer-cluster-kubernetes-k3s/
* K9s = CLI pour K8s https://www.youtube.com/watch?v=pFWVMbRGdXU
* kustomize = plugin K8s pour convertir un fichier Docker-Compose vers K8s
* Helm
* Minikube

```
$ podman run --rm python:3.8 du -hsc
951M	.
951M	total

$ podman run --rm python:3.8-slim du -hsc
168M	.
168M	total

$ podman run --rm python:3.8-alpine du -hsc
80.7M	.
80.7M	total
```
