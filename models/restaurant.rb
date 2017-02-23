require 'json'
require 'sequel'

# Holds a Project's information
class Restaurant < Sequel::Model
  one_to_many :dishs
  plugin :association_dependencies, :dishs => :delete

  def to_json(options = {})
    JSON({  type: 'restaurant',
            id: id,
            attributes: {
              name: name,
              phone_num: phone
            }
          },
         options)
  end
end
