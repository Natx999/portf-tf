module "network" {
  source = "./modules/network"
  
}

module "cluster" {
  source = "./modules/cluster"
  depends_on  = [module.network]
}

module "argo" {
  source = "./modules/argo"
  depends_on  = [module.cluster]
}
