# main.tf
module "mymodule" {
    # This repo
    source            = "github.com/simesy/tf_lemp"

    # Something short and pithy that is used for naming AWS resources.
    identifier        = "test"

    # Used as the AWS "Application ID"
    application_id    = "Web-R-Us Apps"

    # A repo, branch, and (within that repo) an Ansible playbook path.
    app_repo          = "https://github.com/simesy/tf_lemp"
    app_playbook      = "webserver/playbook.yml"
    app_checkout      = "master"
    
    # A public key (eg the contents of `cat ~/.ssh/id_rsa.pub`.
    # This will be deployed into the nginx servers.
    public_key        = "ssh-rsa ..."

    # Whether to allow remote (SSH) access to the nginx servers.
    # (Note currently working)
    remote_access     = "true"

    # Defaults to 'insecurepass'
    db_pass           = "somethingelse"
    
    # Other defaults.
    # aws_region   = "ap-southeast-2"
    # aws_az       = "ap-southeast-2a,ap-southeast-2b,ap-southeast-2c"
    # aws_ami      = "ami-ba231ad9"
    # asg_min      = "1"
    # asg_max      = "2"
    # asg_desired  = "1"
    # asg_size     = "t1.micro"
}
