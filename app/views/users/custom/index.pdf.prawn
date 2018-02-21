
user_header = ["ID", "Name","Email","Contact Number","Address"]

user_rows = @users.map { |item| [item.id, item.full_name, item.email, item.phone_number, item.address] }


users =[ user_header,*user_rows ]


pdf.text "User List", :size => 30, :style => :bold

pdf.move_down(30)

pdf.table users

pdf.move_down(10)

pdf.text "Total User List: #{@users.count}", :size => 16, :style => :bold
