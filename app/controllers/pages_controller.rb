class PagesController < ApplicationController
  def home
    @shared_videos = ShareVideo.all.recent
  end
end
