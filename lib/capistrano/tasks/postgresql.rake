# set(:postgresql_host, Proc.new { primary('db') })
# set(:postgresql_user, Proc.new { fetch(:application) })
# set(:postgresql_password, ask("PostgreSQL Password: ", nil))
# set(:postgresql_database, Proc.new { "#{fetch(:application)}_production" })
# set(:postgresql_dump_path, Proc.new { "#{current_path}/tmp" })
# set(:postgresql_dump_file, Proc.new { "#{fetch(:application)}_dump.sql" })
# set(:postgresql_local_dump_path, File.expand_path("../../../tmp", __FILE__))
# set(:postgresql_pid, "/var/run/postgresql/9.3-main.pid")

# namespace :postgresql do

#   desc "Generate the postgresql configuration files."
#   task :setup do
#     on roles(:db) do |host|
#       template "postgresql/postgresql-monit", "/etc/monit/conf.d/postgresql.conf", :as => 'root', :mode => "0600"
      
#       restart_db = template("postgresql/pg_hba.conf", "/etc/postgresql/9.3/main/pg_hba.conf", as: "postgres", group: "postgres", mode: "0640")

#       restart_db = template("postgresql/postgresql.conf", "/etc/postgresql/9.3/main/postgresql.conf", as: "postgres", group: "postgres", mode: "0640") || restart_db

#       if restart_db
#         info "Restarting db due to configuration changed."
#         execute! :sudo, "service postgresql restart"     
#       end
#     end
#   end
#   after "deploy:started", "postgresql:setup"


#   %w{start stop restart reload force-reload status}.each do |command|
#     desc "#{command} postgresql"
#     task command do
#       on primary('db:primary') do
#         execute! :sudo, "service postgresql #{command}"
#       end
#     end
#   end


# end