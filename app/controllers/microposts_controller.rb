class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Dancelog created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
      render 'static_pages/home'
    end
  end
  
  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    return redirect_to root_url if @micropost.nil?
    @micropost.destroy
    flash[:success] = "Dancelog deleted"
    redirect_to request.referrer || root_url
  end
  
  def update
    respond_to do |format|
    if @micropost.update(micropost_params) && @micropost.video.recreate_versions!
      format.html { redirect_to @micropost, notice: 'Dancelog was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: 'edit' }
      format.json { render json: @micropost.errors, status: :unprocessable_entity }
    end
  end
end
  
  private
  
  def micropost_params
    params.require(:micropost).permit(:content, :genre_id, :video)
  end
end
