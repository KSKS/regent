
set(:secret_token, ask("Production secret token: ", nil))

namespace :rails do
  desc "Generate the database.yml configuration file."
  task :setup_database => "deploy:set_rails_env" do
    on roles(:db) do |host|
      set :override_db_host, 'localhost'
      execute! "mkdir -p #{shared_path}/config"
      template "postgresql/database.yml.erb", "#{shared_path}/config/database.yml"
      delete :override_db_host
    end
  end
  after "deploy:started", "rails:setup_database"

  desc "Generate the secrets.yml file."
  task :setup_secrets => "deploy:set_rails_env" do
    on roles(:app) do |host|
      execute! "mkdir -p #{shared_path}/config"
      template "rails/secrets.yml.erb", "#{shared_path}/config/secrets.yml", force: true
    end
  end
  after "deploy:started", "rails:setup_secrets"

  desc "Symlink the database.yml file into latest release"
  task :symlink_config do
    on roles(:all) do |host|
      execute! :ln, "-nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    end
    on roles(:app) do |host|
      execute! :ln, "-nfs #{shared_path}/config/secrets.yml #{release_path}/config/secrets.yml"
    end
  end
  after "deploy:symlink:shared", "rails:symlink_config"




  # desc "Refresh sitemap"
  # task :refresh_sitemap do
  #   on roles(:app) do |host|
  #     within current_path do
  #       as fetch(:user) do
  #           rake "sitemap:refresh RAILS_ENV=production"
  #       end
  #     end
  #   end
  # end
  # after "deploy:finished", "rails:refresh_sitemap"

end