class TopicsController < ApplicationController
  def index
  	@topics = Topic.all
  	authorize @topics
  end

  def new
  	@topic = Topic.new
  	authorize @topic
  end

  def show
  	@topic = Topic.find(params[:id])
    @entries = @topic.entries
  	authorize @topic
  end

  def edit
  	@topic = Topic.find(params[:id])
  	authorize @topic
  end

  def create
  	@topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
  	authorize @topic
  	if @topic.save
  		redirect_to @topic
  	else
  		flash[:error] = "Error creating topic."
  		render :new
  	end
  end

  def update
  	@topic = Topic.find(params[:id])
  	authorize @topic
  	if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
  		redirect_to @topic
  	else
  		flash[:error] = "Error saving topic."
  		render :edit
  	end
  end
end
