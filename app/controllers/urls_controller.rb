class UrlsController < ApplicationController

	def index
		@url = Url.new
		
	end


  def show
  	string = params[:string]
  	@url=Url.find_by new_url: string


  end

  def edit
  end

  def create
  	url = params.require(:url).permit(:og_url, :new_url)
  	new_url = url["og_url"]
		random_string=SecureRandom.urlsafe_base64(new_url.length)
		@url = Url.create(og_url: new_url, new_url: random_string)
		redirect_to "/go/#{@url.new_url}/preview"
  end

  def update
  end



end
