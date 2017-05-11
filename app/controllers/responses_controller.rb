class ResponsesController < ApplicationController
  before_action :current_user_must_be_response_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_response_user
    response = Response.find(params[:id])

    unless current_user == response.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Response.ransack(params[:q])
    @responses = @q.result(:distinct => true).includes(:vignette, :ratings, :user, :raters).page(params[:page]).per(10)

    render("responses/index.html.erb")
  end

  def show
    @rating = Rating.new
    @response = Response.find(params[:id])

    render("responses/show.html.erb")
  end

  def new
    @response = Response.new

    render("responses/new.html.erb")
  end

  def create
    @response = Response.new

    @response.content = params[:content]
    @response.vignette_id = params[:vignette_id]
    @response.user_id = params[:user_id]

    save_status = @response.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/responses/new", "/create_response"
        redirect_to("/responses")
      else
        redirect_back(:fallback_location => "/", :notice => "Response created successfully.")
      end
    else
      render("responses/new.html.erb")
    end
  end

  def edit
    @response = Response.find(params[:id])

    render("responses/edit.html.erb")
  end

  def update
    @response = Response.find(params[:id])

    @response.content = params[:content]
    @response.vignette_id = params[:vignette_id]
    @response.user_id = params[:user_id]

    save_status = @response.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/responses/#{@response.id}/edit", "/update_response"
        redirect_to("/responses/#{@response.id}", :notice => "Response updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Response updated successfully.")
      end
    else
      render("responses/edit.html.erb")
    end
  end

  def destroy
    @response = Response.find(params[:id])

    @response.destroy

    if URI(request.referer).path == "/responses/#{@response.id}"
      redirect_to("/", :notice => "Response deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Response deleted.")
    end
  end
end
