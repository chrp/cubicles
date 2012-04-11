ActiveAdmin.register Post do

  menu priority: 2
  
  index do 
    selectable_column 
    id_column
    column 'Topic' do |p| p.topic.heading end
    column 'User' do |p| p.user.name end
    column :text
    default_actions
  end

  filter :user, label: "User Name"
  #filter :user, label: "User Country", :collection => proc { User.select(:country).uniq }
  filter :user, member_label: :city, label: "User City"
  filter :topic, member_label: :heading
  filter :text
  filter :created_at

end
