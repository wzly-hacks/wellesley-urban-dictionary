class EntriesController < ApplicationController
  def index
  	@entries = Entry.all
  end

  def show
  	@entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params.require(:entry).permit(:title, :body))
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
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params.require(:entry).permit(:title, :body))
      flash[:notice] = "Entry was updated"
      redirect_to @entry
    else
      flash[:error] = "There was an error saving your entry. Please try again."
      render :edit
    end
  end
end
