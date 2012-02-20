before "deploy:cold", "config_files:create"
after "deploy:update_code", "config_files:symlink"
after "deploy:update", "deploy:cleanup"
after 'deploy:update_code', 'bundler:bundle_new_release'
after "deploy:update_code", "deploy:pipeline_precompile"

require 'erb'

set :rake, '/opt/mri/bin/bundle exec rake'
set :stages, %w(staging production)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

set :scm, :git
set :repository, 'git@github.com:edraut/quackbaq.git'

set :application, "quackbaq"
set :user, 'nobody'
set :runner, 'nobody'
ssh_options[:paranoid] = false
set :ssh_options, {:forward_agent => true}
set :use_sudo, false

set (:deploy_to) {"/var/www/quackbaq/#{stage}"}
set :keep_releases, 2
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


desc "Modified deploy task for Phusion Passenger"
namespace :deploy do
  desc "Restart Application"
  task :restart_app, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
    #restart_workling
  end
  task :start_app, :roles => :app do
    # start task unnecessary for Passenger deployment
  end
  task :restart_pushers, :roles => :app do
    run "cd #{deploy_to}/current; ./lib/daemons/image_pusher_ctl stop"
    run "cd #{deploy_to}/current; ./lib/daemons/image_pusher_ctl start"
  end
  task :start_pushers, :roles => :app do
    run "cd #{deploy_to}/current; ./lib/daemons/image_pusher_ctl start"
  end
  task :restart_processors, :roles => :push do
    run "cd #{deploy_to}/current; ./lib/daemons/image_processor_ctl stop"
    run "cd #{deploy_to}/current; ./lib/daemons/image_processor_ctl start"
  end
  task :start_processors, :roles => :push do
    run "cd #{deploy_to}/current; ./lib/daemons/image_processor_ctl start"
  end
  task :start do
    start_app
    start_pushers
    start_processors
  end
  task :restart do
    restart_app
    restart_pushers
    restart_processors
  end
  task :pipeline_precompile, :roles => :app do
    run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
  end
end

# Tasks for config files
namespace :config_files do
  desc "Create directories and config files: database.yml, mongrel_cluster.yml"
  task :create do
    make_directories
    database_yml
    local_config
    # pictures
  end

  desc "Prepate directory structure"
  task :make_directories do
    run "mkdir -p #{shared_path}/config"
    run "mkdir -p #{shared_path}/config/initializers"
    run "mkdir -p #{shared_path}/log" 
    run "mkdir -p #{shared_path}/public" 
    run "mkdir -p #{shared_path}/system" 
    run "mkdir -p #{deploy_to}/releases"     
  end

  desc "Make symlink for config files" 
  task :symlink do
    symlink_database_yml
    symlink_local_config
    # symlink_pictures
  end

  desc "Create database.yml in shared path" 
  task :database_yml do
    template = File.read(File.join(File.dirname(__FILE__), "deploy/templates", "database.erb"))
    result = ERB.new(template).result(binding)
    put result, "#{shared_path}/config/database.yml", :via => :scp
  end

  desc "Make symlink for database.yml" 
  task :symlink_database_yml do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
  end

  task :mailer_config do
    template = File.read(File.join(File.dirname(__FILE__), "deploy/templates", "mailer_config.erb"))
    result = ERB.new(template).result(binding)
    put result, "#{shared_path}/config/initializers/mailer_config.rb", :via => :scp
  end
  
  desc "Make symlink for mailer_config.rb" 
  task :symlink_mailer_config do
    run "ln -nfs #{shared_path}/config/initializers/mailer_config.rb #{release_path}/config/initializers/mailer_config.rb" 
  end

  task :local_config do
    run "touch #{shared_path}/config/initializers/local_config.rb"
  end

  desc "Make symlink for local_config.rb" 
  task :symlink_local_config do
    run "ln -nfs #{shared_path}/config/initializers/local_config.rb #{release_path}/config/initializers/local_config.rb" 
  end
  # desc "Create picture directories in shared path" 
  # task :pictures do
  #   run "mkdir -p #{shared_path}/public/pictures" 
  # end

  # desc "Make symlinks for pictures" 
  # task :symlink_pictures do
  #   run "rm -rf #{release_path}/public/pictures" 
  #   run "ln -nfs #{shared_path}/public/pictures #{release_path}/public/pictures" 
  # end
end
namespace :bundler do
  task :create_symlink, :roles => [:app, :push] do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
    shared_dir = File.join(shared_path, 'vendor_bundle')
    release_dir = File.join(current_release, 'vendor/bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end
 
  task :bundle_new_release, :roles => [:app, :push] do
    bundler.create_symlink
    run "cd #{release_path} && /opt/mri/bin/bundle install --without test"
  end
end

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end