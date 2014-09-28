set :nginx_pid, "/var/run/nginx.pid"

namespace :nginx do

  desc "Generate the nginx.conf configuration file."
  task :setup do
    on roles(:web) do |host|
      template "nginx/nginx.conf", "/etc/nginx/nginx.conf", as: 'root'
      template "nginx/nginx-monit", "/etc/monit/conf.d/nginx.conf", :as => 'root', :mode => "0600"
    end
  end
  after "deploy:started", "nginx:setup"

  %w[start stop restart reload].each do |command|
    desc "#{command} nginx"
    task command do
      on roles(:web) do
        execute! :sudo, "service nginx #{command}"
      end
    end
  end

end
