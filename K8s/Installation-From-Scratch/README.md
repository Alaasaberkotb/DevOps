# CRITICAL INFORMATION
- What are these scripts and what Linux distribution could they run on?
  - These scripts install Kubernetes and Docker on new servers, then create a cluster on the master node.
  - They could run on Centos/RHEL 8/7.
- How do these scripts work?

  1- Remove the old versions of Docker and Kubernetes.
     - docker-client
     - docker-client-latest
     - docker-common
     - docker-latest
     - docker-latest-logrotate
     - docker-logrotate
     - docker-engine
     - podman
     - runc
     - kube*

  2- Disable SELinux enforcement.

  3- Set bridged packets to traverse iptables rules.

  4- Disable all memory swaps to increase performance.

  5- Enable transparent masquerading and facilitate Virtual Extensible LAN (VxLAN) traffic for communication between Kubernetes pods across the cluster and enable IP masquerade at the firewall.

  6- Add the Kubernetes and Docker repositories and install all the necessary components, then start and enable services.

  7- Change Docker to use systemd cgrouyp driver.

  8- Adding the Kubernetes ports to the firewall.

  9- Configure kubeadm and create a cluster.

# PREREQUISITES FOR MASTER AND WORKER NODES BEFORE RUNNING THE SCRIPTS.

- Minimal requirements for Master
  - 2 CPUs
  - 2.5 GiB of RAM
   
  Note: If you're using a VM, you can downgrade resources after joining the workers to the cluster.

- Configure Hosts
```
vi /etc/hosts
```
Like ...
```
192.168.15.1  k8s
192.168.15.2  worker1
192.168.15.3  worker2
```

- Hash all swaps in /etc/fstab
```
vi /etc/fstab
```
Like ...
```
#/dev/mapper/cl_dhcp-swap none                    swap    defaults        0 0
```
# How to execute the script?
- Frist way
```
sudo chmod +x "scriptname.sh"
```
```
./"scriptname.sh"
```
- Second way
```
sudo bash "scriptname.sh"
```
# Errors that may occur during or after the installation with solve
- 
-
