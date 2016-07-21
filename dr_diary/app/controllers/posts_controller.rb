class PostsController < ApplicationController
  
  before_action :confirm_logged_in #to prevent unauthorized access to pages
  
  def new
    @post = Post.new
  end
  
  def create
    
    @diary = Diary.find(params[:diary_id])
    @post = Post.new(post_params)
    @post.diary_id = params[:diary_id]
    @post.user_id = session[:user_id]
   if @post.save
      redirect_to :action => 'show',:diary_id => @diary.id, :post_id => @post.id
    else
      render('new')
    end
  end

  def edit
    @diary = Diary.find(params[:diary_id])
    @post = Post.find(params[:post_id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @diary = Diary.find(params[:diary_id])
    if @post.valid?
      if @post.update_attributes(post_params)
        redirect_to(:action => 'show', :diary_id => @diary.id, :post_id => @post.id)
      else
        render('edit')
      end
      else
        render('edit')
    end
  end
  
  def delete
    @post = Post.find(params[:post_id])
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    
    if @post.destroy
      redirect_to :action=>'index', :post_id => params[:post_id], :diary_id => params[:diary_id]
    else
      render('delete')
    end
  end
  
  def index
    @diary = Diary.find(params[:diary_id])
    
    #@posts = Post.find_post_for_current_user(session[:user_id]).find_post_in_current_diary(params[:diary_id])
    @posts = Post.find_post_in_current_diary(@diary.id).find_post_for_current_user(session[:user_id])
  end
  
  def show
    @post = Post.find(params[:post_id])
  end
  
  private
  def post_params
    params.require(:post).permit(:title,:visibility,:content, {post_pictures: [].to_s})
  end
end
