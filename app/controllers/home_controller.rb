
class HomeController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
    @post = current_user.posts.build
    @comments = Comment.where(post_id: @post)
    @comment = Comment.new
    @user = User.new
    @complaint = Complain.where(post_id: @post)
    @complaint = Complain.new
  end
end
