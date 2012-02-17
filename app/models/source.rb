class Source < ActiveRecord::Base

  ### ATTRIBUTES ###
  serialize :data, Hash
  
end