# coding: utf-8

class PostsController < InheritedResources::Base

  def kiosk_feed #aka "onsite"
    @mode = :kiosk
    all_feeds
  end  

  def presentation_feed #aka "presentation"
    @mode = :presentation
    all_feeds
  end

  def website_feed
    @mode = :website
    all_feeds
  end

  def complete_feed #aka "archive"
    @topic = find_topic
    
  end 

  # provides json data for feed display
  def feed_data
    params['comment'] ||= 0
    params['topic'] ||= 0
    data = Hash.new

    if(CFG['feed_demo_mode']) then
      data = demo_data(Integer(params['comment'])+1)
    else
      data['topic'] = Topic.next(params['topic'])
      data['comment'] = Post.next(params['comment'])
    end

    render nothing: true, json: data
  end

  # displays a random topic and delivers and impression by showing random posts
  def mosaic
    params['min'] ||= 2;
    params['size'] ||= 8;
    
    @min = params['min']
    @size = params['size']
    @body_id = 'm'
    @topic = Topic.random(@min)
    @posts = Post.find_for_mosaic(@topic.id, @size)
  end

  private

  def all_feeds 
    @topic = find_topic
    @body_id = 'f'

    params['limit'] ||= CFG['feed_limit']
    @limit = params['limit']

    @posts = Post.find_for_feed(@topic.id, @limit)

    render template: 'posts/feed'
  end

  def find_topic 
    if !params['uuid'].nil? then
      return Topic.where('uuid = ?', params['uuid']).first
    else
      return Topic.last
    end
  end

  def demo_data(comment_id)
    {
      topic: {
        id: 3,
        heading: 'Headline',
        text: 'Some commentators argue that though economic growth under capitalism has led to democratization in the past, it may not do so in the future. Under this line of thinking, authoritarian regimes have been able to manage economic growth without making concessions to greater political freedom.'
      },
      comment: {
        id: comment_id,
        name: "Christoph Schüßler",
        city: 'Berlin',
        country: 'Germany',
        time: '14:25 CET',
        text: 'Lorem ipsum dolor sit amet',
        image: false
      }
    }

  end

end
