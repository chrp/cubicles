class Topic < ActiveRecord::Base
  has_many :posts
  before_create :create_uuid
  default_scope order: 'id DESC'

  def self.random min = 2
    # postgres-specific SQL, mysql would be RAND()
    Topic.joins(:posts).group('topics.id').having('COUNT(posts.id)>=?', min).order('random()').limit(1).first
  end

  private

  # create topic with uuid for urls
  def create_uuid
    self.uuid = rand(36**12).to_s(36)
  end
end
