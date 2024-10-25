class HomeController < ApplicationController
  def index
    @quotes = BuddhistQuote.all
  end
end
