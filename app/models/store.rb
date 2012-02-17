# Simple KeyValue Store
class Store < ActiveRecord::Base
  
  ### ATTRIBUTES ###
  serialize :data
  
  def self.get(key)
    entry = Store.where(:key => key).first
    entry.blank? nil : entry.data
  end
  
  def self.update(key, value)
    entry = Store.where(:key => key).first
    entry ||= Store.new(:key => key)
    entry.data = value
    entry.save!
  end
  
end