# Flask API Service to Monitor VM Services
# Instead of logging into each VM via SSH to check service statusess, this API enables you to check if a specific service is running by accessing an endpoint through the public IP of the VM.

     ____________                          _____________                           ________________
    |   VM 1     |                        |     VM 2     |                         |     VM N     |
    |            |                        |              |                         |              |
    |  Service 1 |                        |   Service 1  |                         |   Service 1  |
    |            |                        |              |                         |              |
    |  Service 2 |                        |   Service 2  |                         |   Service 2  |
    |            |                        |              |                         |              |  
    |  Service n |                        |   Service n  |                         |   Service n  | 
    |            |                        |              |                         |              |
     ------------                          --------------                           --------------
        |                                          |                                       |
        |                                          |                                       |
        |                                          |                                       |
         _______________________________________________________                           |
        |  http://<PUBLIC-IP-VM1>/service_status                |  <-----------------------
        |  http://<PUBLIC-IP-VM2>/service_status                |
        |  http://<PUBLIC-IP-VMn>/service_status                |
        |  http://<PUBLIC-IP-VM1>/service_status/<service_name> |
        |  http://<PUBLIC-IP-VM2>/service_status/<service_name> |
        |  http://<PUBLIC-IP-VMn>/service_status/<service_name> |
        |_______________________________________________________|


1. I have create a Python Flask API service, which you should run on your VM. And make sure to open Port 5000.
2. Just copy the Public IP of VM and /service_status or /service_status/<service_name> to check your desired service is running or not.

3. You may also need to create service.txt file on your VM, just list the services name you want to monitor regularly. It will display all the services.
4. IF you want to identify custom service use second API as shown above.

5.Make sure to install Python and other dependies on your VM.

________________________________________________________________________________________________________________________________________________________

# Open Port 5000 in GCP VM

1. In GCP Console
2. Go to VPC network → Firewall rules.
3. Add a new firewall rule
4. Name: Allow-flask-server
5. Network: Default (or your network)
6. Direction of traffic: Ingress
7. Action on match: Allow
8. Targets: All instances in the network (or specify your instance) # I had used for Demo so I did all VM, but if you already have multiple VM running make sure to select the exact match.
9. Source IP ranges: 0.0.0.0/0 (this allows traffic from any IP)
10. Specified protocols and ports: tcp:5000
11. Apply the Rule:
12. Save the firewall rule and test the connection again.

# There is a video which will give the project idea

1. You need to create a dashboard to just call the API to view all services from VMs.
2. Also add a search by Service Option to make it more better.
