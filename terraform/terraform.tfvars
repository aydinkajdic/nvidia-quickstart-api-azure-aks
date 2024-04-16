name =  "clftestnew"
region = "swedencentral"
virtual_network_address_space = "10.10.0.0/24"
node_pool_name =  "aktaoapi1new" # only alphanumeric, not more than 12 chars
extra_node_pool_name =  "cflnodepool"
vm_size = "Standard_D4s_v3"
extra_vm_size = "Standard_NC4as_T4_v3"
node_count = 1
gpu_operator_version = "v23.3.2"
nvidia_driver_version = "535.104.12"
chart = "https://helm.ngc.nvidia.com/nvidia/tao/charts/nvtl-api-5.3.0.tgz"
chart_values  = {
  gpu_operator_version = "v23.3.2"
  nvidia_driver_version = "535.104.12"
}
