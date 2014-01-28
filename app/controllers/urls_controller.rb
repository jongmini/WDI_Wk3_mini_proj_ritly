class UrlsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :new, :edit, :update]

	def index
		@url = Url.new
	end

  def show
  	string = params[:string]
  	@url=Url.find_by new_url: string
  end

  def create
    user = @current_user

  	url = params.require(:url).permit(:og_url, :new_url, :user_count, :userID)
    if url["og_url"]==""
      flash[:warning]="Please enter your URL"
      redirect_to '/'
    else 
      user_url = url["og_url"] # input url
      new_string = url["new_url"] # input_string
      # checks if the user input string exists in the db
        if new_string == ""
          string = SecureRandom.urlsafe_base64(user_url.length)
          @url = Url.create(og_url: user_url, new_url: string, user_count: 0, userID: user.id)
          redirect_to "/go/#{@url.new_url}/preview"
        elsif Url.where(new_url: new_string).exists? 
          # if the string exisits in the db then flash warning and redirect
          flash[:warning]="the requested URL is not available"
          redirect_to '/' # how do I add the params[:url] to the redirect?
        else
          string = new_string
          @url = Url.create(og_url: user_url, new_url: string, user_count: 0, userID: user.id)
          redirect_to "/go/#{@url.new_url}/preview"
        end
    end
		
  end

  def visit
    string = params[:string]
    user_url = Url.find_by new_url: string
    user_url.user_count += 1
    user_url.update(user_count: user_url.user_count)
    redirect_to "http://#{user_url.og_url}"
  end

  def admin
    @db = Url.all
  end

  def delete
    id=params[:id]
    url = Url.find(id)
    flash[:warning]="#{url["og_url"]} #{url["new_url"]} has been deleted"
    url.destroy
    redirect_to admin_path
  end

  def edit
  end

  def update
  end



end
