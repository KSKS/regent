set :monit_alert_email, "capitolhill@regentbakeryandcafe.com"
set :monit_user, "admin"
set :monit_password, "regentmonit"

namespace :monit do

  %w[start stop restart syntax reload].each do |command|
    desc "Run Monit #{command} script"
    task command do
      on roles(:all) do |host|
        execute! :sudo, "service monit #{command}"
      end
    end
  end

  task :setup do
    on roles(:all) do |host|
      template "monit/monitrc", "/etc/monit/monitrc", as: 'root', mode: "0600"
      invoke "monit:syntax"
    end
  end
  after "deploy:started", "monit:setup"

  desc "Display status of monit daemon monitoring"
  task :status do
    on roles(:all) do
      result = capture("#{sudo} service monit status || true")
      result << capture("#{sudo} ps -eopid,user,fname | grep [m]onit || true")
      result << capture("#{sudo} netstat -tulpn | grep monit || true")
      puts result
    end
  end

end
