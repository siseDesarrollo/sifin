root = "/var/www/sifin/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.sifin.sock"
worker_processes (ENV['RAILS_ENV'] == 'production' ? 4 : 1)
timeout 300

# Force the bundler gemfile environment variable to
# reference the capistrano "current" symlink
before_exec do |_|
	ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
end