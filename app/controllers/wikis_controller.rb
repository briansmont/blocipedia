class WikisController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.create(wiki_params)

    
    if @wiki.save
      flash[:notice] = "Wiki has been added!"
      redirect_to @wiki
    else
      flash.now[:alert] = "Your wiki had an error while being added, please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])  
    @wiki.assign_attributes(wiki_params)
    
    if @wiki.save
      flash[:notice] = "Wiki changes saved"
      redirect_to @wiki
    else
      flash[:error] = "Changes weren't saved, try again"
      render :edit
    end
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully"
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki"
    end
  end
  
  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :public)
  end
  
end