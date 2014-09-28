
def template(from, to, opts={})
  from_full_path = File.expand_path("../templates/#{from}", __FILE__)
  force = opts.delete(:force)
  if force.nil? || !force
    if test("[ -f #{to} ]") && time_since_updated(to) > File.stat(from_full_path).mtime.tv_sec
      info "File #{to} is newer than local file #{from}. Skip generating one."
      return false
    end
  end

  execute :sudo, "rm -f #{to}" if force

  info "Generating #{to} from template #{from}"

  erb = File.read(from_full_path)

  io = StringIO.new ERB.new(erb).result(binding)

  tmp_file = "/tmp/#{File.basename(to)}.tmp"
  upload! io, tmp_file
  execute :sudo, "mv #{tmp_file} #{to}"

  as = opts.delete(:as)
  grp = opts.delete(:group)
  if as || grp
    execute :sudo, "chown #{as}#{grp ? ':' + grp : '' } #{to}"
  end

  mode = opts.delete(:mode)
  if mode
    execute :sudo, "chmod #{mode} #{to}"
  end

  return true
end

# Suppose to be defined capistrano/sshkit, can't find it, define it ourselves for now
def execute!(*args)
  raise "Execution failed for #{args.inspect}" unless execute(*args)
end

def time_since_updated(file)
  capture("stat -c '%Y' #{file}").to_i
end

def ip_of(host)
  require 'socket'
  Socket::getaddrinfo(host, '', nil, Socket::SOCK_STREAM)[0][3]
end