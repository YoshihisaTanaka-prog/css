# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Admin.create(name: "田中義久", affiliation: "管理人", level: 10, email: ENV["ADMIN_MAILADDRESS"])

Admin.create([{"id":1,"email":ENV["ADMIN_MAILADDRESS"],"level":10,"name":"田中義久","affiliation":"管理人", "password":ENV["ADMIN_PASSWORD"]}])
