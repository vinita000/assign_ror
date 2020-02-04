class HomesController < ApplicationController
    def index
        if current_user
          @stories = Story.where.not(user_id: current_user.id)
        end
    end    
end
