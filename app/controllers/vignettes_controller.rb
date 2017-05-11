class VignettesController < ApplicationController
  def index
    @q = Vignette.ransack(params[:q])
    @vignettes = @q.result(:distinct => true).includes(:responses, :users, :raters).page(params[:page]).per(10)

    render("vignettes/index.html.erb")
  end

  def show
    @response = Response.new
    @vignette = Vignette.find(params[:id])

    render("vignettes/show.html.erb")
  end

  def new
    @vignette = Vignette.new

    render("vignettes/new.html.erb")
  end

  def create
    @vignette = Vignette.new

    @vignette.content = params[:content]

    save_status = @vignette.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/vignettes/new", "/create_vignette"
        redirect_to("/vignettes")
      else
        redirect_back(:fallback_location => "/", :notice => "Vignette created successfully.")
      end
    else
      render("vignettes/new.html.erb")
    end
  end

  def edit
    @vignette = Vignette.find(params[:id])

    render("vignettes/edit.html.erb")
  end

  def update
    @vignette = Vignette.find(params[:id])

    @vignette.content = params[:content]

    save_status = @vignette.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/vignettes/#{@vignette.id}/edit", "/update_vignette"
        redirect_to("/vignettes/#{@vignette.id}", :notice => "Vignette updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Vignette updated successfully.")
      end
    else
      render("vignettes/edit.html.erb")
    end
  end

  def destroy
    @vignette = Vignette.find(params[:id])

    @vignette.destroy

    if URI(request.referer).path == "/vignettes/#{@vignette.id}"
      redirect_to("/", :notice => "Vignette deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Vignette deleted.")
    end
  end
end
