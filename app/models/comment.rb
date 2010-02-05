class Comment
  include CouchPotato::Persistence
  
  #property :user_id, :type => User
  property :_id, :type => Fixnum
  property :type, :type => String
  property :message
  property :approved, :default => "awaiting_response", :type => :boolean,
      :validator => lambda { |s| %w(accepted rejected awaiting_response).include? s }
  property :show, :type => :boolean
  property :time, :type => Date
  
  view :all, :key => [:_id]
  # view :approved, :key => :message, :conditions => "doc.approved === true"
  # view_by :id
  # view_by :message
  # view_by :approved
  # view_by :time, :descending => true
end
