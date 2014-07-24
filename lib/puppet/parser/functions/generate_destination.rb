module Puppet::Parser::Functions
  newfunction(:generate_destination, :type => :rvalue) do |args|
    Puppet::Parser::Functions.autoloader.loadall 
    id = args[0]
    type = args[1]
    options = args[2]
    function_generate_src_dst(["destination", id, type, options])
  end
end
