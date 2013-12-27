class Refinery::Events::Registration < ActiveRecord::Base
  attr_accessible :no_of_tickets, :total, :discount, :sales_tax, :adjustment, :event_id, :user_id, :state, :transaction_id

  belongs_to :user
  belongs_to :event, :class_name => '::Refinery::Events::Event'
  has_many :attendees, :class_name => '::Refinery::Events::Attendee'

  def update_tickets_sold
    self.attendees.each do |a|
      a.ticket.update_attribute('tickets_sold',a.ticket.tickets_sold.to_i+1)
    end
  end

end
