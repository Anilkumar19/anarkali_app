require 'open-uri'

class MirrawController < ApplicationController
	def designs
		doc = Nokogiri::HTML(open('http://www.mirraw.com/salwar-suits/anarkali-salwar-kameez'))

    all_brand_names = []
    doc.css('p.listing-maker.row a').each do |link|
      all_brand_names = all_brand_names + link.content.split(",")
    end

     @brands = []

     all_brand_names.uniq.each do |brand_name|
     	 @brands << { brand_name: brand_name, no_of_designs: all_brand_names.count(brand_name) }
     end
  
     @brands.sort_by! { |brand| brand[:no_of_designs] }
     @brands.reverse!
     @brands = @brands.take(3)
	end	
end