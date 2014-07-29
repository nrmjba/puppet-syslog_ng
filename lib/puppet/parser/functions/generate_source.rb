
module Puppet::Parser::Functions
  newfunction(:generate_source, :type => :rvalue) do |args|
    Puppet::Parser::Functions.function('generate_src_dst') 
    id = args[0]
    type = args[1]
    options = args[2]
    function_generate_src_dst( ["source", id, type, options] )
  end
end