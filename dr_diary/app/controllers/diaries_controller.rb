class DiariesController < ApplicationController
  
  layout false
  before_action :confirm_logged_in #to prevent unauthorized access to pages
  def new
    @diary = Diary.new
  end
  
  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = session[:user_id]
    if @diary.valid?
      if @diary.save
        redirect_to :action => "show_mine"
      else
        render('new')
      end
    else
      render('new')
    end
  end

  def edit
    @diary = Diary.find(params[:id])
  end
  
  def update
    @diary = Diary.find(params[:diary_id])
    if @diary.update_attributes(diary_params)
      redirect_to(:controller => 'posts', :action => 'index', :diary_id => @diary.id)
    else
      render('edit')
    end
  end
  
  def delete
    @diary = Diary.find(params[:id])
  end

  def destroy
    if @diary = Diary.find(params[:id]).destroy
      redirect_to :action => 'show_mine'
    else
      render('delete')
    end
    
  end

  def show_mine
    @diaries = Diary.find_current_user_diary(session[:user_id])
  end

  
  private
  def diary_params
    params.require(:diary).permit(:name,:visibility,:diary_image)
  end
end
