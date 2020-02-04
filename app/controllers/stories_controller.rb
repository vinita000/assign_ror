class StoriesController < ApplicationController
       def my_stories
         @stories = Story.where(user_id: current_user.id)
       end
       
       def new
         @story = Story.new
       end 
    
       def create
         @story = Story.new(story_params.merge(user_id: current_user.id))

         if @story.save
            redirect_to @story
         else
            render 'new'
         end 
       end
    
       def show
          @story = Story.find(params[:id])
       end 
       
       def edit
          @story = Story.find(params[:id])
       end 
    
       def update
          @story = Story.find(params[:id])
          if @story.update(params[:story].permit(:title, :body))
             redirect_to @story
          else
            render 'edit'
          end   
       end 
    
       def destroy
            @story = Story.find(params[:id])
            @story.destroy
            redirect_to my_stories_path
       end    

       def view_all_stories
           @stories = Story.where.not(user_id: current_user.id)
       end 

       def mark_as_favourite
          user_favourite_story = UserFavouriteStory.new
          user_favourite_story.user_id = current_user.id
          user_favourite_story.story_id = params[:story_id]
          user_favourite_story.save
          redirect_to view_all_stories_path
       end 

       def my_favourite_stories
            @stories = Story.joins(:user_favourite_stories).where(user_favourite_stories: {user_id: current_user.id})
       end   
       
       private
    
       def story_params
          params.require(:story).permit(:title, :body)
       end 
    
end
