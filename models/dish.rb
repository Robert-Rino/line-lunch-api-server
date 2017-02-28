require 'json'
require 'base64'
require 'sequel'

# Holds a full configuration file's information
class Dish < Sequel::Model
  many_to_one :restaurants

  def to_json(options = {})
    JSON({  type: 'dish',
            id: id,
            data: {
              dishname: name,
              unit: itemunit,
              price: unitprice
            }
          },
         options)
  end
end

# TODO: implement a more complex primary key?
# def new_id
#   Base64.urlsafe_encode64(Digest::SHA256.digest(Time.now.to_s))[0..9]
# end
