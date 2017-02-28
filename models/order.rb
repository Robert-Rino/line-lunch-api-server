require 'json'
require 'sequel'

# Holds a Project's information
class Order < Sequel::Model
  plugin :timestamps, :create => :time
  def to_json(options = {})
    JSON({  userid: userid,
            content: ordercontent,
            sum: sum,
            ordertime: time
          },
         options)
  end
end
