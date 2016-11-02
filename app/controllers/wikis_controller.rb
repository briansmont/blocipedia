class WikisController < ApplicationController
  include ApplicationHelper
  
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:index]
  
  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.create(wiki_params)
    @wiki.user = current_user
    authorize @wiki
    
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
    @all_collaborators = Collaborator.available(@wiki, current_user)
    authorize @wiki
  end
  
  def update
    @wiki = Wiki.find(params[:id])  
    authorize @wiki
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
    authorize @wiki
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully"
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki"
    end
  end
  
  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, :user)
  end
  

  
  
end
