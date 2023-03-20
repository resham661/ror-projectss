class CommentsController < ApplicationController
  before_action :find_book

  def new
    @comment = current_user.comments.new
  end

  def create
    #create a new comment for the book from the current_user
    @comment = Comment.new(comment_params)
    @comment.book_id = @book.id
    @comment.user_id = current_user.id

    if @comment.save

      render turbo_stream: [
        #This is for form reload
        turbo_stream.update('update_form', partial: "comments/form", locals: {book: @book}),
        turbo_stream.append('new_comment', partial: 'comments/comment', locals: { comment: @comment })
      ]
      # redirect_to book_path(@book)
    else
      # flash[:notice] = @comment.errors.full_messages.to_sentence
      render 'new'
    end
  end

  private

    def comment_params
      params
        .require(:comment)
        .permit(:content)
        # .merge(book_id: params[:book_id])
    end

    def find_book
      @book = Book.find(params[:book_id])
    end
end
