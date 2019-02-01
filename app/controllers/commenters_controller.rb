class CommentersController < ApplicationController
  def commenters
    @commenters = User.joins(:comments).select('users.*, count(comments.id) as ccount', 7.days.ago.utc).count(:all, :group => 'name', :order =>  'count(*) DESC')
  end
end
