require "freshly/version"
require "freshly/default"
require "freshly/client"

##
# Why is this empty
#
# Other api wrappers open include a way to query directly from the root
# namespace. It might be useful for somethings however I don't think this is
# a good practise. It encourages a user to just pickup and start using the
# library without considering what they are doing. I am not forcing someone
# to make an arduous amount of work, just making a simple thought about what
# they are trying to achieve
module Freshly
end
