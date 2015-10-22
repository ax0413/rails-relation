class TimelineController < ApplicationController
    #before_action :authenticate_user!, except: :index

    def index
        @blogs = Blog.all.reverse
    end
    
    def mypage
        @myblogs= Blog.where(user_id: current_user.id).reverse
    end

    def write
        Blog.create(user_id: current_user.id, content: params[:naeyong])
        redirect_to :root
    end

    def comment
        Comment.create(user_id: current_user.id, blog_id: params[:blog_id], msg: params[:comment])
        redirect_to :root
    end
    
    def destroy
        pp = Blog.find(params[:id])
        pp.destroy
        redirect_to :root
    end
    
    def correct
        t=Blog.find(params[:id])
        t.content=params[:naeyong]
        t.save
        redirect_to :root
    end
    
    def c_destroy
        pp = Comment.find(params[:id])
        pp.destroy
        redirect_to :root
    end
    def c_correct
        t=Comment.find(params[:id])
        t.msg=params[:comment]
        t.save
        redirect_to :root
    end


        
    


        
end