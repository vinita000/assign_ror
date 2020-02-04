module ApplicationHelper
    def check_mark_as_favourite(user_id, story_id)
        UserFavouriteStory.where(user_id: user_id, story_id: story_id).present?
    end    
end
