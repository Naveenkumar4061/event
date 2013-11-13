class EventController < ApplicationController
  before_filter :authenticate_user!
end
