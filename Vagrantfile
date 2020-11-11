Vagrant.configure("2") do |config|
  
  #box
  config.vm.box = "bento/ubuntu-18.04"
  
  #Network 
  config.vm.network "forwarded_port", guest: 80, host: 8080

  #chef repo
  #chef_repo_path = "./john_cabot"

  #provisioner
  config.vm.provision 'chef_solo' do |chef|
    chef.data_bags_path = './data_bags'
    chef.cookbooks_path = './cookbooks'
    chef.arguments = "--chef-license accept"
    chef.run_list = [
      'recipe[number13::apache]'
      ] 
  end
end