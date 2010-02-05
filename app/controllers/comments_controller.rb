class CommentsController < ApplicationController
  def index 
    @comments = CouchPotato.database.view Comment.all
  end
  
  def edit
    # @comment = Comment.by_id(:key=>params[:id])
    @comment = CouchPotato.database.load_document params[:id] #"id_of_the_user_document" # => <#User 0x3075>
    
    # @comment ||= RelaxDB.load 
  end
  
  def update
    @comment = CouchPotato.database.load_document params[:id]
    @comment.update_attributes (params[:comment])

    # @comment.message = params[:comment][:message]
    # @comment.approved = false
    # @comment.approved = true if params[:comment][:approved]=="1"
    
    if CouchPotato.database.save_document @comment
      # @comment.destroy
      redirect_to @comment
    else
      puts @comment.errors
      render :edit
    end
  end
  
end
