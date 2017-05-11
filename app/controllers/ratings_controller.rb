class RatingsController < ApplicationController
  before_action :current_user_must_be_rating_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_rating_user
    rating = Rating.find(params[:id])

    unless current_user == rating.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @ratings = Rating.all

    render("ratings/index.html.erb")
  end

  def show
    @rating = Rating.find(params[:id])

    render("ratings/show.html.erb")
  end

  def new
    @rating = Rating.new

    render("ratings/new.html.erb")
  end

  def create
    @rating = Rating.new

    @rating.stars = params[:stars]
    @rating.content = params[:content]
    @rating.user_id = params[:user_id]
    @rating.response_id = params[:response_id]

    save_status = @rating.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ratings/new", "/create_rating"
        redirect_to("/ratings")
      else
        redirect_back(:fallback_location => "/", :notice => "Rating created successfully.")
      end
    else
      render("ratings/new.html.erb")
    end
  end

  def edit
    @rating = Rating.find(params[:id])

    render("ratings/edit.html.erb")
  end

  def update
    @rating = Rating.find(params[:id])

    @rating.stars = params[:stars]
    @rating.content = params[:content]
    @rating.user_id = params[:user_id]
    @rating.response_id = params[:response_id]

    save_status = @rating.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ratings/#{@rating.id}/edit", "/update_rating"
        redirect_to("/ratings/#{@rating.id}", :notice => "Rating updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Rating updated successfully.")
      end
    else
      render("ratings/edit.html.erb")
    end
  end

  def destroy
    @rating = Rating.find(params[:id])

    @rating.destroy

    if URI(request.referer).path == "/ratings/#{@rating.id}"
      redirect_to("/", :notice => "Rating deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Rating deleted.")
    end
  end
end
