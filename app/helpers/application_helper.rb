module ApplicationHelper

  def active_menu(title)
    condition = false
    if title == "Properties"
      condition = (controller_name == "properties" and ["index","search"].include?(action_name))
    elsif title == "Add New Property"
      condition = (action_name == "new" and controller_name == "properties")
    elsif title == "My Properties"
      condition = (action_name == "my_list" and controller_name == "properties")
    elsif title == "Agents"
      condition = (action_name == "list_agents" and controller_name == "users")
    elsif title == "New Agent"
      condition = (controller_name == "users" and ["new_agent","create_agent"].include?(action_name))
    elsif title == "New Customer"
      condition = (controller_name == "users" and ["new_customer","create_customer"].include?(action_name))
    elsif title == "Customers"
      condition = (action_name == "list_customers" and controller_name == "users")
    end

    condition ? "class=active" : ""

  end

  def generate_pdf_link
    request.url.include?('?') ? request.url.gsub('?','.pdf?') : "#{request.url}.pdf"
  end
end
