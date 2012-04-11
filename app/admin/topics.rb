ActiveAdmin.register Topic do
  
  menu priority: 1

  index do 
    selectable_column 
    id_column 
    column :heading
    column :description
    column 'Timestamp' do |t| I18n.localize(t.created_at, format: :short_date) end
    column 'Links' do |t| 
        link_to('Kiosk', kiosk_feed_path(t.uuid)) + " " +
        link_to('Presentation', presentation_feed_path(t.uuid)) + " " +
        link_to('Website', website_feed_path(t.uuid))
    end
    default_actions
  end

  form :html => { :multipart => true } do |f|
    f.inputs "Topic" do
       f.input :heading
       f.input :description
    end
    f.buttons
  end

  config.clear_sidebar_sections!


end
