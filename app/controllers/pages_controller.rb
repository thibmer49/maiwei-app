class PagesController < ApplicationController
  def home
    @activities = Activities.all.sample(3)
  end
end
