class Refinery::Events::Faq < ActiveRecord::Base
  attr_accessible :question, :answer, :event_id

  belongs_to :event, :class_name => '::Refinery::Events::Event'
end
