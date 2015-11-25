class EntriesController < ApplicationController
  def index
  	@entries = Entry.all
    
    authorize @entries
  end

  def show
  	@entry = Entry.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @entry
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @entry = Entry.new
    authorize @entry
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @entry = current_user.entries.build(params.require(:entry).permit(:title, :body))
    authorize @entry
    if @entry.save
      flash[:notice] = "Entry was saved."
      redirect_to [@topic, @entry]
    else
      flash[:error] = "There was an error creating your entry. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @entry = Entry.find(params[:id])
    authorize @entry
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @entry = Entry.find(params[:id])
    authorize @entry
    if @entry.update_attributes(params.require(:entry).permit(:title, :body))
      flash[:notice] = "Entry was updated"
      redirect_to [@topic, @entry]
    else
      flash[:error] = "There was an error saving your entry. Please try again."
      render :edit
    end
  end
end
