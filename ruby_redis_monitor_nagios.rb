#!/usr/bin/env ruby
require 'optparse'
options  = {}
required = [:warning, :critical, :host]

parser   = OptionParser.new do |opts|
    opts.banner = "Usage: check_redis_replication [options]"
      opts.on("-h", "--host redishost", "The hostname of the redis slave") do |h|
        options[:host] = h
      end
      opts.on("-w", "--warning percentage", "Warning threshold") do |w|
        options[:warning] = w
      end
      opts.on("-c", "--critical critical", "Critical threshold") do |c|
        options[:critical] = c
      end
end
parser.parse!
abort parser.to_s if !required.all? { |k| options.has_key?(k) }

master_last_io_seconds_ago = `redis-cli info | grep master_last_io_seconds_ago`.split(':').last.to_i rescue -1

status = <img src="http://s1.wp.com/wp-includes/images/smilies/icon_surprised.gif?m=1129645325g" alt=":o" class="wp-smiley"> k
if master_last_io_seconds_ago < 0 || master_last_io_seconds_ago >= options[:critical].to_i
    status = :critical
elsif master_last_io_seconds_ago >= options[:warning].to_i
    status = :warning
end

status_detail = master_last_io_seconds_ago == -1 ? 'ERROR' : "#{ master_last_io_seconds_ago.to_s }s"
puts "#{status.to_s.upcase} - replication lag: #{status_detail}"

if status == :critical
    exit(2)
elsif status == :warning
    exit(1)
end


define service {
      name                            redis_replication
      register                        1
      check_command                   check_nrpe!check_redis_replication!$HOSTNAME$ 100 250
      service_description             Redis Replication
      hostgroup_name                  redis_slave
}
