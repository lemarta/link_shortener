class LinksController < ApplicationController

  def show
    @link = Link.find_by(lookup_code: params[:lookup_code])
    redirect_to @link.original_url, allow_other_host: true
  end

  def create
    shortener = Shortener.new(link_params[:original_url])
    @link = shortener.generate_short_link
    if @link.persisted? == false
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end

end
