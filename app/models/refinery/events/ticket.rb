class Refinery::Events::Ticket < ActiveRecord::Base
  # attr_accessible :title, :body
  #
  attr_accessible :ticket_name, :description, :sale_start_on, :sale_end_on, :original_price, :discounted_price, :commission, :is_service_tax, :service_tax_percent, :max_quantity, :min_quantity, :max_quantity_on_sale, :display_order, :status, :deleted_at, :is_sold_out, :is_not_display, :tickets_sold, :event_id
  belongs_to :event, :class_name => '::Refinery::Events::Event'
  
  before_save :update_commission
  before_create :update_commission

  default_scope { where deleted_at: nil }

  def delete
    self.update_attribute('deleted_at',Time.now)
  end

  def update_commission
    self.commission = (self.discounted_price * 2.5)/100
  end

end
