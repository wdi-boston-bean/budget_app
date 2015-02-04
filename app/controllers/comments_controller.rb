class CommentsController < ApplicationController
 
  def index
    @transaction = Transaction.find(params[:transaction_id])
    redirect_to transaction_path(@transaction)
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @transaction = Transaction.find(params[:transaction_id])
    @comment = Comment.new(comment_params)
    @comment.owner = @transaction
    if @comment.save
      redirect_to  transaction_path(@transaction)
    else
      render 'new'
    end
  end

  def destroy
    @transaction = Transaction.find(params[:transaction_id])
    @comment = @transaction.comments.find(params[:id])
    @comment.destroy
    redirect_to transaction_path(@transaction)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
