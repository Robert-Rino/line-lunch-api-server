require 'sequel'

Sequel.migration do
  change do
    create_table(:restaurants) do
      primary_key :id
      String :name, unique: true, null: false
      String :address, unique: true
      String :phone
    end
  end
end
