Vagrant.configure("2") do |config|
  config.vm.provider :cloudstack do |cloudstack, override|
    cloudstack.host    = "#{ENV['CLOUDSTACK_HOST']}"
    cloudstack.path    = "#{ENV['CLOUDSTACK_PATH']}"
    cloudstack.port    = "#{ENV['CLOUDSTACK_PORT']}"
    cloudstack.scheme  = "#{ENV['CLOUDSTACK_SCHEME']}"

    cloudstack.api_key    = "#{ENV['CLOUDSTACK_KEY']}"
    cloudstack.secret_key = "#{ENV['CLOUDSTACK_SECRET']}"

    cloudstack.zone_name             = "#{ENV['CLOUDSTACK_ZONE_NAME']}"
    cloudstack.template_name         = "#{ENV['CLOUDSTACK_TEMPLATE_NAME']}"
    cloudstack.service_offering_name = "#{ENV['CLOUDSTACK_SERVICE_OFFERING_NAME']}"

    cloudstack.pf_ip_address   = "#{ENV['CLOUDSTACK_PF_IP_ADDRESS']}"
    override.ssh.host          = "#{ENV['CLOUDSTACK_PF_IP_ADDRESS']}"

    if ENV['VAGRANT_BOX'] == "0"
      override.ssh.username = "root"

      cloudstack.keypair            = "#{ENV['CLOUDSTACK_KEYPAIR']}"
      override.ssh.private_key_path = "#{ENV.fetch('CLOUDSTACK_PRIVATE_KEY_PATH',
                                                   '~/.ssh/id_rsa')}"
      override.ssh.pty = true

      config.vm.synced_folder ".", "/vagrant", type: "rsync",
          rsync__rsync_path: "rsync"
    end

    config.vm.provision "shell", inline: "echo Hello" 
  end
end   
