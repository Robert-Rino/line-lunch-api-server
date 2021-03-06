require 'sequel'

Sequel.migration do
  change do
    create_table(:dishes) do
      primary_key :id
      foreign_key :restaurant_id, :restaurants

      String :name, null: false
      String :itemunit, null: false, default: '個'
      Integer :unitprice, null: false

      unique [:restaurant_id, :name]
    end
  end
end
