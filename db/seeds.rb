# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Admin.create(name: "田中義久", affiliation: "管理人", level: 10, email: ENV["ADMIN_MAILADDRESS"])

Admin.create([{"id":1,"email":ENV["ADMIN_MAILADDRESS"],"level":10,"name":"田中義久","affiliation":"管理人", "password":ENV["ADMIN_PASSWORD"]}])
NormalTag.create([{"id":2,"name":"h1"},{"id":3,"name":"h2"},{"id":4,"name":"h3"},{"id":5,"name":"div"},{"id":6,"name":"p"},{"id":7,"name":"span"},{"id":8,"name":"a"},{"id":9,"name":"h4"},{"id":10,"name":"h5"},{"id":11,"name":"h6"},{"id":12,"name":"img"},{"id":13,"name":"ul"},{"id":14,"name":"ol"},{"id":15,"name":"li"},{"id":17,"name":"body"},{"id":18,"name":"table"},{"id":19,"name":"tr"},{"id":20,"name":"th"},{"id":21,"name":"td"},{"id":24,"name":"iframe"},{"id":25,"name":"form"},{"id":26,"name":"input"},{"id":27,"name":"textarea"},{"id":28,"name":"button"},{"id":29,"name":"header"},{"id":30,"name":"footer"}])
Operation.create([{"id":1,"name":"color"},{"id":2,"name":"length"},{"id":3,"name":"length4"},{"id":4,"name":"inputText"},{"id":5,"name":"inputNumber"},{"id":6,"name":"display"},{"id":7,"name":"inputTextQ"},{"id":8,"name":"list-style"},{"id":9,"name":"float"},{"id":10,"name":"overflow"},{"id":11,"name":"align"}])
Title.create([{"id":2,"name":"color","operation_id":1},{"id":3,"name":"background-color","operation_id":1},{"id":4,"name":"width","operation_id":2},{"id":5,"name":"display","operation_id":6},{"id":6,"name":"font-size","operation_id":2},{"id":7,"name":"font-family","operation_id":7},{"id":8,"name":"z-index","operation_id":5},{"id":10,"name":"height","operation_id":2},{"id":11,"name":"list-style","operation_id":8},{"id":12,"name":"float","operation_id":9},{"id":13,"name":"margin","operation_id":3},{"id":14,"name":"padding","operation_id":3},{"id":15,"name":"border","operation_id":4},{"id":16,"name":"border-top","operation_id":4},{"id":17,"name":"border-bottom","operation_id":4},{"id":18,"name":"border-left","operation_id":4},{"id":19,"name":"border-right","operation_id":4},{"id":20,"name":"margin-left","operation_id":2},{"id":21,"name":"margin-top","operation_id":2},{"id":22,"name":"margin-bottom","operation_id":2},{"id":23,"name":"margin-right","operation_id":2},{"id":24,"name":"padding-left","operation_id":2},{"id":25,"name":"padding-right","operation_id":2},{"id":27,"name":"padding-top","operation_id":2},{"id":28,"name":"padding-bottom","operation_id":2},{"id":29,"name":"text-align","operation_id":11}])
Unit.create([{"id":1,"name":"rgb"},{"id":2,"name":"rgba"},{"id":3,"name":"px"},{"id":4,"name":"rem"},{"id":5,"name":"em"},{"id":6,"name":"%"},{"id":7,"name":"block"},{"id":8,"name":"inline"},{"id":9,"name":"inline-block"},{"id":10,"name":"flex"},{"id":11,"name":"inline-flex"},{"id":12,"name":"grid"},{"id":13,"name":"inline-grid"},{"id":14,"name":"flow-root"},{"id":15,"name":"none"},{"id":16,"name":"contents"},{"id":17,"name":"block flow"},{"id":18,"name":"inline flow"},{"id":19,"name":"inline flow-root"},{"id":20,"name":"block flex"},{"id":21,"name":"inline flex"},{"id":22,"name":"block grid"},{"id":23,"name":"inline grid"},{"id":24,"name":"block flow-root"},{"id":25,"name":"table"},{"id":26,"name":"table-row"},{"id":27,"name":"list-item"},{"id":31,"name":"unset"},{"id":32,"name":"vw"},{"id":33,"name":"vh"},{"id":34,"name":"left"},{"id":35,"name":"right"},{"id":36,"name":"inline-start"},{"id":37,"name":"inline-end"},{"id":38,"name":"table-row-group"},{"id":39,"name":"table-column"},{"id":40,"name":"table-column-group"},{"id":41,"name":"table-cell"},{"id":42,"name":"table-caption"},{"id":43,"name":"table-header-group"},{"id":44,"name":"table-footer-group"},{"id":45,"name":"inline-table"},{"id":46,"name":"inline-grid"},{"id":47,"name":"square"},{"id":48,"name":"inside"},{"id":49,"name":"georgian inside"},{"id":50,"name":"inherit"},{"id":51,"name":"initial"},{"id":52,"name":"revert"},{"id":53,"name":"visible"},{"id":54,"name":"scroll"},{"id":55,"name":"hidden"},{"id":56,"name":"auto"},{"id":57,"name":"center"}])