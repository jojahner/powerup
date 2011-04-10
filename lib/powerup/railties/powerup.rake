APP_PATH = File.expand_path(".")
APP_NAME = File.basename(APP_PATH)
HOME = ENV['HOME']
POW_PATH = File.join(HOME, '.pow')

def exec_with_explain(cmd)
  puts "executing '#{cmd}'"
  exec cmd
end

namespace :pow do
  task :check_for_pow do
    unless File.exists?(POW_PATH)
      puts "error: '#{POW_PATH}' not found!"
      puts "install pow with 'curl get.pow.cx | sh'"

      exit(false)
    end
  end
  
  desc "Add application to pow"
  task :add => :check_for_pow do
    puts "Add '#{APP_NAME}' to pow"
    exec_with_explain "ln -s #{APP_PATH} #{POW_PATH}"
  end
  
  desc "Remove application from pow"
  task :remove => :check_for_pow do
    puts "Remove '#{APP_NAME}' from pow"
    exec_with_explain "rm #{File.join(POW_PATH, APP_NAME)}"
  end
  
  desc "Restart application"
  task :restart => :check_for_pow do
    puts "Restart '#{APP_NAME}'"
    exec_with_explain "touch #{File.join(APP_PATH, "tmp")}/restart.txt"
  end
  
  desc "Open application in browser"
  task :open => :check_for_pow do
    puts "Open '#{APP_NAME}'"
    exec_with_explain "open http://#{APP_NAME}.dev"
  end
end
  
  
