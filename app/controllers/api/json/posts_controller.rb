module Api
  module Json
    class PostsController < ApplicationController
      # skip_before_filter :verify_authenticity_token
      respond_to :json

      def index
        respond_with(Post.all)
      end

    end
  end
end
