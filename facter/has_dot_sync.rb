# Inspired by https://raw.github.com/justintime/puppet/master/justintime-localmounts/lib/facter/localmounts.rb

Facter.add('__custom_has_dot_sync') do
  confine :kernel => :linux
  found = false
  setcode do
    File.open('/proc/mounts').each do |line|
      if line =~ /^\S+\s+\S*\.sync-decrypt\S*\s+/ then
        found = true
        break
      end
    end
    found
  end
end

