
headers = ["ID", "Name", "Type", "Country", "State", "Address","Map Position", "Owner", "Contact Number"]

rows = @properties.map { |item| [item.id, item.name, item.property_type, item.country, item.state, item.address, item.map_position, "#{item.user.full_name if item.user}", "#{item.user.phone_number if item.user}"] }


items =[ headers,*rows ]


pdf.text "Properties List", :size => 30, :style => :bold

pdf.move_down(30)

pdf.table items

pdf.move_down(10)

pdf.text "Total Properties List: #{@properties.count}", :size => 16, :style => :bold
