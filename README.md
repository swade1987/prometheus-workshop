<img src="https://seeklogo.com/images/P/prometheus-logo-8EB4639A0C-seeklogo.com.png" width="100" height="100" />

# Prometheus Workshop

The following repository will create you a Kubernetes cluster using the following:


1. [Packet](https://www.packet.net/) for the underlying infrastructure.
2. [Terraform (v0.11.7)](https://www.terraform.io/) to create the infrastructure.
3. [Kismatic Enterprise Toolkit (v1.11.1)](https://github.com/apprenda/kismatic) for provisioning our Kubernetes cluster.

After standing up the Kubernetes cluster we will deploy the following applications:

1. [Prometheus](https://prometheus.io/)
2. [Grafana](https://grafana.com/)
3. [Fotia](https://github.com/swade1987/fotia) (Golang application used to demo Prometheus alerts)

## Prerequisities

A list of prerequisities for Mac can be found [here](docs/1-mac-prerequisities.md)

A list of prerequisities for Windows can be found [here](docs/2-windows-prerequisities.md)

## Cluster creation

A list of steps to build and provision the Kubernetes cluster can be found [here](docs/3-build-cluster.md)

## Helm chart deployment

A list of steps to deploy the necessary Helm charts can be found [here](docs/6-installing-prometheus-and-grafana.md)

## Pro-active alerting demo

A list of steps to demonstrate pro-active alerting can be found [here](docs/8-alerting-workflow.md)

## Cleanup (from your local machine)

To remove all the droplets from digital ocean execute the following:

```
$ make destroy-cluster
```