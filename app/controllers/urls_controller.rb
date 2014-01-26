class UrlsController < ApplicationController

	def index
		@url = Url.new
		
	end


  def show
  	string = params[:string]
  	@url=Url.find_by new_url: string


  end

  def create
  	url = params.require(:url).permit(:og_url, :new_url)
  	user_url = url["og_url"] # www.addy.com
    # section that checks if the user input string exists in the db
    new_string = url["new_url"] # input_string
      
      if new_string == ""
        binding.pry
        string = SecureRandom.urlsafe_base64(user_url.length)
      elsif Url.where(new_url: new_string).exists?
        binding.pry
        string = SecureRandom.urlsafe_base64(user_url.length)
      else
        string = new_string
      end
  

		# random_string=SecureRandom.urlsafe_base64(user_url.length)
		@url = Url.create(og_url: user_url, new_url: string)
		redirect_to "/go/#{@url.new_url}/preview"
  end

  def visit
    string = params[:string]
    user_url = Url.find_by new_url: string

    redirect_to "http://#{user_url.og_url}"
  end



  def edit
  end

  def update
  end



end
