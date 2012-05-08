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
  scope :in_progress, where("begin_time < utc_timestamp() and end_time > utc_timestamp()")
  scope :not_started, where("begin_time > utc_timestamp()")
  scope :finished, where("end_time < utc_timestamp()")
  scope :won, joins(:placed_bids).where(:bids => {:winner => true})
  scope :bid_on_by, lambda { |user| joins(:placed_bids).where(:bids => {:user_id => user.id}).group("auctions.id")}
  scope :won_by, lambda { |user| joins(:placed_bids).where(:bids => {:user_id => user.id, :winner => true})}
  #special behaviors
  #validations
  
  #callbacks
  before_save :set_end_time
  # after_create :create_channel
  #class methods

  state_machine :state, :initial => :not_won, :action => nil do
    event :win do
      transition :not_won => :won
    end
    state :not_won
    state :won
  end
  
  #instance methods
  
  def category
    self.item.category
  end
  
  def current_price
    Money.new(self.placed_bids.count)
  end
  
  def highest_bid
    if self.placed_bids.any?
      self.placed_bids.new_to_old.first
    else
      nil
    end
  end

  def highest_bidder
    if self.placed_bids.any?
      self.highest_bid.user
    else
      nil
    end
  end
  
  def highest_bidder_name
    self.highest_bidder ? self.highest_bidder.email : ''
  end
  
  def begin_time_local(offset)
    gm_time = self.begin_time.getgm
    gm_time - offset.hours
  end
  
  def humanize_interval(seconds)
    seconds = seconds.to_i
    [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map{ |count, name|
      if seconds > 0
        seconds, n = seconds.divmod(count)
        if [:seconds,:minutes, :hours].include? name
          "%02d" % n
        else
          "#{n.to_i}"
        end
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
    !finished?
  end
  
  def not_started?
    Time.now < self.begin_time
  end
  
  def finished?
    finished = self.time_left_in_seconds <= 0
    if finished and !self.won? and self.placed_bids.any?
      self.assign_winner
      self.reload
    end
    finished
  end
  
  def ready?
    (begin_time.is_a? Time) and item.complete?
  end

  def assign_winner
    if !self.won? and self.time_left_in_seconds <= 0
      winning_bid = self.highest_bid
      if winning_bid
        winning_bid.winner = true
        winning_bid.save
        self.win
        self.save
      end
    end
  end

  def winning_bid
    self.placed_bids.where(:winner => true).first
  end

  def winner
    if self.winning_bid
      return self.winning_bid.user
    else
      return nil
    end
  end
  
  def date_won
    if self.winning_bid
      self.winning_bid.placed_at
    else
      nil
    end
  end

  def channel_name
    'auction_' + self.id.to_s
  end
  
  def set_end_time
    self.end_time = self.begin_time + 12.hours
  end


end