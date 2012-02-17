class TwitterCrawler < Crawler

  @@rate_limit_data = { :hits_remaining => true, :retry => nil }
  
  def user(username)
    rate_limited do
      
      user_info = Twitter.user(username)
      if user_info
        source = TwitterSource.get_or_create(username)
        source.info = Twitter.user(username)
        source.save!
      end
    end
  end

  # gets all friend_ids of a user
  def friends(username)
    cursor = nil
    friend_ids = []
    
    # twitter returns max. 5000 users per call, so paging may be needed
    begin
      rate_limited do
        page = cursor.blank? ? -1 : cursor.next_cursor
        cursor = Twitter.friend_ids(username, :cursor => page)
        friend_ids += cursor.collection
      end
    end until cursor.nil? || cursor.last?
    
    unless friend_ids.blank?
      source = TwitterSource.get_or_create(username)
      source.friends = friend_ids
      source.save!
    end
    
  end
  
  # todo: bulk user info loading
  def users
  end
  
  def rate_limit
    @@rate_limit_data
  end
  
  def update_rate_limit
    if rate_limit_exceeded? && time_to_check_rate_limit?
      rate_limit[:retry] = Time.zone.now + 5.minutes # safeguard if checkup call fails
    
      twitter_status = Twitter.rate_limit_status
      rate_limit[:hits_remaining] = twitter_status.hits_remaining > 0
      rate_limit[:retry] = twitter_status.reset_time.in_time_zone + 1.minute
    end
  end
  
  private # /////////////////////////////////////////////////////////////
  
  def rate_limited(&block)
    if rate_limit_exceeded?
      puts "RATE LIMIT!"
    else
      yield block
    end
    
  rescue Twitter::Error::BadRequest # 400 Error returned by Twitter when reaching the rate limit
    pause_crawling
    update_rate_limit
  end
  
  def pause_crawling
    rate_limit[:hits_remaining] = false
  end
  
  def rate_limit_exceeded?
    rate_limit[:hits_remaining] == false
  end
  
  def time_to_check_rate_limit?
    rate_limit[:retry].blank? || rate_limit[:retry] < Time.zone.now
  end
  
end