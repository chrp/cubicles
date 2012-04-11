ActiveAdmin::Dashboards.build do

  section "Recent topics" do
    table_for Topic.order('id DESC').limit(20) do
      column :heading
      column 'Links' do |t| 
        link_to('Kiosk', kiosk_feed_path(t.uuid)) + "&nbsp;".html_safe +
        link_to('Presentation', presentation_feed_path(t.uuid)) + "&nbsp;".html_safe +
        link_to('Website', website_feed_path(t.uuid))
      end
      column 'Administration' do |t|
        link_to('Edit', edit_admin_topic_path(t)) + " " +
        link_to('Delete', resource_path(t), :method => :delete, :confirm => "Really delete this topic?")
      end
    end

     strong { link_to 'New topic', new_admin_topic_path }
     br
     strong { link_to 'Mosaic (uses random topics)', mosaic_path }
  end

end
