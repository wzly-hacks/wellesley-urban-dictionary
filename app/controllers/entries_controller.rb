class EntriesController < ApplicationController
  def index
  	@entries = Entry.all
    authorize @entries
  end

  def show
  	@entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
    authorize @entry
  end

  def create
    @entry = current_user.entries.build(params.require(:entry).permit(:title, :body))
    authorize @entry
    if @entry.save
      flash[:notice] = "Entry was saved."
      redirect_to @entry
    else
      flash[:error] = "There was an error creating your entry. Please try again."
      render :new
    end
  end

  def edit
    @entry = Entry.find(params[:id])
    authorize @entry
  end

  def update
    @entry = Entry.find(params[:id])
    authorize @entry
    if @entry.update_attributes(params.require(:entry).permit(:title, :body))
      flash[:notice] = "Entry was updated"
      redirect_to @entry
    else
      flash[:error] = "There was an error saving your entry. Please try again."
      render :edit
    end
  end
end
