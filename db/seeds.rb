# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if User.count == 0  
  User.create([
    {first_name: 'bilal6', last_name: 'asif'},
    {first_name: 'bilal26', last_name: 'asif2'},
    {first_name: 'bilal3', last_name: 'asif3'},
    {first_name: 'bilal67', last_name: 'asif7'},
    {first_name: 'bilal268', last_name: 'asif28'},
    {first_name: 'bilal30', last_name: 'asif39'}
  ])
  procedure_str = AddName.procedure
  ActiveRecord::Base.connection.execute(procedure_str)
  str = AddName.query(3)
  puts "query result"
  puts ActiveRecord::Base.connection.execute(str)
end
