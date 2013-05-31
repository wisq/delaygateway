set :application, "delaygateway"
set :deploy_to, "/u/apps/#{application}"

set :user, "deploy"
set :use_sudo, false

set :scm, :git
set :repository, "git://github.com/wisq/delaygateway.git"
set :branch, 'master'
set :git_shallow_clone, 1

role :web, "delaygateway.ec2.shopify.com", :no_release => true
role :app, "delaygateway.ec2.shopify.com"

set :deploy_via, :remote_cache

namespace :deploy do
  task :restart, :roles => :app do
    run "sv-sudo restart /etc/sv/delaygateway-*"
  end
end
