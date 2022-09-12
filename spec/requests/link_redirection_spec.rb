require 'rails_helper'

RSpec.describe "Link redirection", type: :request do

  it "redirects to the original URL from a given short link" do
  url = "https://guides.rubyonrails.org/layouts_and_rendering.html"
    shortener = Shortener.new(url)
    link = shortener.generate_short_link

    get link.shortened_url

    expect(response).to redirect_to(link.original_url)
    
  end

end