class StylesController < ApplicationController
  
  before_action :require_user, except: [:show, :index]
  
  def new
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)
    
    if @style.save
      flash[:success] = "Style Sucessfully Created"
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  
  def show
    @style = Style.find(params[:id])
    @recipes = @style.recipes.paginate(page: params[:page], per_page: 1)
  end
  
  def index
  end
  
  private
    def style_params
      params.require(:style).permit(:name)
    end
end 