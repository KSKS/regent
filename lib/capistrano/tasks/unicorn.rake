set(:unicorn_socket, "/tmp/.unicorn.sock")
set(:unicorn_pid, Proc.new { "#{shared_path}/tmp/pids/unicorn.pid" })

namespace :unicorn do
  desc "Generate the unicorn.conf.rb, unicorn_init.sh and monit configuration files."
  task :setup => "deploy:set_rails_env" do
    on roles(:app) do |host|
      template "unicorn/unicorn.conf.rb", "#{shared_path}/config/unicorn.conf.rb"
      template "unicorn/unicorn_init.sh", "/etc/init.d/unicorn", mode: "0750"
      template "unicorn/unicorn-monit", "/etc/monit/conf.d/unicorn.conf", :as => 'root', :mode => "0600"
    end
  end
  after "deploy:started", "unicorn:setup"


  %w[start stop restart reload upgrade force-stop reopen-logs].each do |command|
    desc "#{command} unicorn"
    task command do
      on roles(:app) do
        execute! :sudo, "service unicorn #{command}"
      end
    end
  end
  after "deploy:published", "unicorn:upgrade"

end
