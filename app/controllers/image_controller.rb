class ImageController < ApplicationController
    require 'snooby'

    def get_sub
      reddit = Snooby::Client.new
      sub = reddit.r('aww')
    end

    def index
      r = rand(25)
      post = get_sub.posts[r]
      if post.url.start_with? "http://i.img"
        @img = post.url
        @permalink = 'http://www.reddit.com' + post.permalink
      elsif post.url.include? "imgur"
        @img = post.url+".jpg"
        @permalink = 'http://www.reddit.com' + post.permalink
      else
        index
      end
    end
end
