require 'sequel'

Sequel.migration do
  change do
    create_table(:orders) do
      primary_key :id

      String :userid, null: false
      String :ordercontent, null: false
      Integer :sum, null: false
      Time :time, null: false

    end
  end
end
