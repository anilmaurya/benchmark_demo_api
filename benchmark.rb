require 'open3'
require 'pp'

def current_dir
  File.expand_path(File.dirname('.'))
end

def pid_file
  "#{current_dir}/tmp/pids/server.pid"
end

# if(!File.exist?(pid_file))
#   fork {
#     system('RAILS_ENV=production puma -t 2')
#   }
#   sleep(5)
# end

fork{
  p 'Sending request for 30 secs'
  30.times do |n|
    print "    #{30 - n} sec left \r"
    $stdout.flush
    sleep(1)
  end
}
stdout, stderr, status = Open3.capture3("wrk -t 2 -c 100 -d 30s  http://localhost:3000/homes.json")
pp stdout

p "Requests / sec: #{stdout.split(' ')[-3]}" 
#system("kill #{File.read(pid_file)}")