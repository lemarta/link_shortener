require "rails_helper"

RSpec.describe Shortener do

    it "shortens a given URL to a 7 character lookup code" do
        url = "https://www.favouritewebsite.com/articles/how-to-cook"
        shortener = Shortener.new(url)
        expect(shortener.lookup_code.length).to eq(7)
    end

    it "gives each URL its own lookup code" do
        url = "https://www.favouritewebsite.com/articles/how-to-cook"
        shortener = Shortener.new(url)
        code_1 = shortener.lookup_code
        
        url = "https://www.favouritewebsite.com/articles/how-to-bake"
        shortener = Shortener.new(url)
        code_2 = shortener.lookup_code

        expect(code_2).not_to eq(code_1)
    end

    it "always gives each URL the same lookup code" do
        url = "https://www.favouritewebsite.com/articles/how-to-cook"

        shortener = Shortener.new(url)
        first_code = shortener.lookup_code

        shortener = Shortener.new(url)
        second_code = shortener.lookup_code

        expect(first_code).to eq(second_code)

    end

    it "generates a Link record with a unique code" do
        url = "https://www.favouritewebsite.com/articles/how-to-cook"
        shortener = Shortener.new(url)
        link = shortener.generate_short_link
        expect(link.valid?).to be(true)
    end

end