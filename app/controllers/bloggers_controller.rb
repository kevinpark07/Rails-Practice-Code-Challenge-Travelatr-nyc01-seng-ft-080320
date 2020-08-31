class BloggersController < ApplicationController
  def show
    @blogger = Blogger.find(params[:id])
  end

  def new
    @blogger = Blogger.new
  end 

  def create
    @blogger = Blogger.create(params.require(:blogger).permit(:name, :age, :bio))
    if @blogger.valid?
      redirect_to blogger_path(@blogger)
    else
      flash[:errors] = @blogger.errors.full_messages
      redirect_to new_blogger_path
    end
  end 


end
