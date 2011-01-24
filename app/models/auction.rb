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
  scope :in_progress, :conditions => ["begin_time < :now and end_time > :now",{:now => Time.now}]
  scope :not_started, :conditions => ["begin_time > :now",{:now => Time.now}]
  scope :finished, :conditions => ["end_time < :now",{:now => Time.now}]
  #special behaviors
  #validations
  
  #callbacks
  before_create :set_end_time
  after_create :create_channel
  #class methods
  
  #instance methods
  
  def current_price
    Money.new(self.placed_bids.count)
  end
  
  def highest_bidder
    if self.placed_bids.any?
      self.placed_bids.new_to_old.first.user
    else
      nil
    end
  end
  
  def highest_bidder_name
    self.highest_bidder ? self.highest_bidder : ''
  end
  
  def begin_time_local(offset)
    gm_time = self.begin_time.getgm
    gm_time - offset.hours
  end
  
  def humanize_interval(seconds)
    [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map{ |count, name|
      if seconds > 0
        seconds, n = seconds.divmod(count)
        "#{n.to_i}"
      end
    }.compact.reverse.join(':')
  end

  def time_left
    @time_left = humanize_interval(time_left_in_seconds)
    @time_left = @time_left.blank? ? 'CLOSED' : @time_left
  end
  
  def time_left_in_seconds
    (self.end_time - Time.now).round
  end
  
  def reset_timer
    self.end_time = Time.now + 20.seconds
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
      return self.highest_bidder
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
  
  def set_end_time
    self.end_time = self.begin_time + 12.hours
  end
end