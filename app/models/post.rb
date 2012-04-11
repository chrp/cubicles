class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  default_scope order: 'id DESC'

  def self.find_for_mosaic topic_id, limit
    len_where = 'LENGTH(text) < ?'
    len_wo_img = CFG['mosaic_text_limit_without_image']
    len_w_img = CFG['mosaic_text_limit_with_image']
    
    where(topic_id: topic_id).where(len_where, len_wo_img).order('RANDOM()').limit(limit)
  end

  def self.find_for_feed topic_id, limit
    where(topic_id: topic_id).order('id DESC').limit(limit)
  end

  def image_class 
    if(has_image?) then
      return id.modulo(2) == 1 ? 'image-right' : 'image-left'
    else
      return 'image-none'
    end
  end

  def has_image? 
    false
  end

  def user_country
    user.country
  end

  # css-class to decide the text-size when shown in a mosaic-box
  def text_length_class
    l = text.length

    if(!has_image?) then
      if    (l <= 120) then return 'comment-short'
      elsif (l <= 200) then return 'comment-medium'
      else                  return 'comment-long' end
    else
      if    (l <= 80)  then return 'comment-short'
      elsif (l <= 120) then return 'comment-medium'
      else                  return 'comment-long' end
    end
  end

  # replacements for i18n.translate when showing the sublines including name and location of the author of a post
  def subline_replacements_html_safe
    {
      name: "<span class=\"comment-author\">#{user.name}</span>".html_safe,
      city: "<span class=\"comment-city\">#{user.city}</span>".html_safe,
      country: "<span class=\"comment-country\">#{user.country}</span>".html_safe,
      id: "<span class=\"comment-id\">#{id}</span>".html_safe,
      time: "<span class=\"comment-time\">#{I18n.localize(created_at)}</span>".html_safe
    }
  end

  private 

  def replace_links string
    pattern = /(http:\/\/|https:\/\/)[-a-z0-9]+(\.?[-a-z0-9]+){0,3}\.[a-z]{2,4}((\/[[:graph:]]*){1,5}([[:graph:]]+\.[a-z0-9]{1,5})?)?/
    replace = '<a href="\0">\0</a>'
    string.sub(pattern, replace)    
  end

end
