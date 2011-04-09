APP_PATH = File.expand_path(".")
APP_NAME = File.basename(APP_PATH)
HOME = ENV['HOME']
POW_PATH = File.join(HOME, '.pow')

def exec_with_expain(cmd)
  puts "executing '#{cmd}'"
  exec cmd
end

namespace :pow do
  task :check_for_pow do
    unless File.exists?(POW_PATH)
      puts "error: pow not found!"
      puts "install with 'curl get.pow.cx | sh'"

      exit(false)
    end
  end
  
  desc "Adds app to pow"
  task :add => :check_for_pow do
    puts "Adding #{APP_NAME} to pow"
    exec_with_expain ("ln -s #{APP_PATH} #{POW_PATH}")
  end
  
  desc "Remove app from pow"
  task :remove => :check_for_pow do
    puts "Removing #{APP_NAME} from pow"
    exec_with_expain ("rm #{File.join(POW_PATH, APP_NAME)}")
  end
  
  desc "Restarts app"
  task :restart => :check_for_pow do
    puts "Restarting ..."
    exec_with_expain ("touch #{File.join(APP_PATH, "tmp")}/restart.txt")
  end
end
  
  
