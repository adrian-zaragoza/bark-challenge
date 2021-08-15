class LikesController < ApplicationController
  def create
    
    @like = Like.new({dog_id: params[:dog_id], author_id: current_user.id})
    
    if @like.save
      redirect_to dog_url(params[:dog_id])
    end
    
  end

  def destroy
    @like = Like.find_by(id: params[:id])

    if @like.destroy
      redirect_to dogs_url
    end

  end
end
