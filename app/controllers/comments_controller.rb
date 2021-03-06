class CommentsController < ApplicationController
  load_and_authorize_resource
  before_filter :load_commentable
  before_filter :find_community
  before_filter :find_comment, only: [:destroy, :update]
  before_filter :check_destroy_allowed, only: [:destroy]

  def create
    @comment = Comment.build_from(@commentable, current_user.id, params.require(:comment_body))
    if @comment.save
      respond_to do |format|
        format.js {render 'create'}
        format.html {redirect_to return_url}
      end
    else
      flash[:error] = t('messages.error')
      respond_to do |format|
        format.js {render 'shared/ajax_flash'}
        format.html {redirect_to return_url}
      end
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.js {render 'destroy'}
        format.html {redirect_to return_url}
      end
    else
      flash[:error] = t('messages.error')
      respond_to do |format|
        format.js {render 'shared/ajax_flash'}
        format.html {redirect_to return_url}
      end
    end
  end

  private
    def return_url
      if @commentable.is_a? TaskOccurrence
        community_task_occurrence_path(@community, @commentable)
      elsif @commentable.is_a? Payment
        community_payment_path(@community, @commentable)
      else
        community_path(@community)
      end
    end

    def find_comment
      @object = @comment = @commentable.comment_threads.find(params.has_key?(:comment_id) ? params[:comment_id] : params[:id]) 
    end
end
