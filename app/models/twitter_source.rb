class TwitterSource < Source
  
  def initialize(attributes={})
    super(attributes)
    
    self.origin = "twitter"
    self.crawler = :twitter
  end
  
  def self.get_or_create(username)
    source = Source.where(:identifier => username, :crawler => :twitter).first
    source ||= TwitterSource.new(:identifier => username)
  end
  
  def info
    data[:info]
  end
  
  def image_url
    info.profile_image_url unless info.blank?
  end
  
  def info=(value)
    data[:info] = value
  end
  
  def friends
    data[:friends]
  end
  
  def friends=(value)
    data[:friends] = value
  end
  
  def followers
    data[:followers]
  end
  
  def followers=(value)
    data[:followers] = value
  end
  
  # def method_missing(m, *args)
  #   debug "named route: #{m}"
  #   current_parent << FakeRoute.new(args.shift, args.pop, m.to_s)
  # end
  
end