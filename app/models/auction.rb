class Auction < ActiveRecord::Base
  #constants
  TYPES = [
    {:name => 'Classic', :id => 'ClassicAuction'},
    {:name => 'Quacktion', :id => 'Quacktion'},
    {:name => 'Lightning', :id => 'LightningAuction'}
  ]

  #associations
  belongs_to :item
  has_many :placed_bids, :class_name => 'Bid', :foreign_key => 'placed_auction_id'
  #named_scopes
  scope :in_progress, :conditions => ["begin_time < :now and (begin_time + interval 12 hour) > :now",{:now => Time.now}]
  scope :not_started, :conditions => ["begin_time > :now",{:now => Time.now}]
  scope :finished, :conditions => ["(begin_time + interval 12 hour) < :now",{:now => Time.now}]
  #special behaviors
  #validations
  
  #callbacks
  after_create :create_channel
  #class methods
  
  #instance methods
  
  def current_price
    self.item.full_price - Money.new(self.placed_bids.count)
  end
  
  def begin_time_local(offset)
    gm_time = self.begin_time.getgm
    gm_time - offset.hours
  end
  
  def the_end
    self.begin_time + 12.hours
  end
  
  def time_left
    humanize_interval(time_left_in_seconds)
  end
  
  def time_left_in_seconds
    (self.the_end - Time.now).round
  end
  
  def in_progress?
    self.time_left_in_seconds > 0
  end
  
  def not_started?
    Time.now < self.begin_time
  end
  
  def finished?
    self.time_left_in_seconds <= 0
  end
  
  def winner
    if self.finished?
      return self.placed_bids.new_to_old.first.user
    else
      return nil
    end
  end
  
  def channel_name
    'auction_' + self.id.to_s
  end
  
  def create_channel
    Nestful.get("#{HOOKBOX_URL}/web/create_channel", :params => {:security_token => 'secret', :channel_name => self.channel_name, :history_size => 5})
  end
end