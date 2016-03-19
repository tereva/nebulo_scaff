require 'csv'

class Appreciation < ActiveRecord::Base

	belongs_to :category
	# has_many :indexations
	# has_many :keywords, :through => :indexations

	has_and_belongs_to_many :keywords
	
	#attr_accessible :content

	validates :content, presence: true

	public

	def self.import(file, category_id)
  	CSV.foreach(file.path, headers: true) do |row|
	 		appreciation = find_by_content(row["content"]) || new 
	 		appreciation.attributes = row.to_hash.slice(*row.to_hash.keys)
	 		appreciation.category_id = category_id
	 		appreciation.save!
			appreciation.parse
	  	end
  	end

	def parse
		split_content = self.content.gsub(/[a-zA-Z]'/,'').gsub(/[[:punct:]]/,'').squish.split(" ")
		puts "PARSING"
		split_content.each do |element|		
		# Pour chaque "element" > 5 char dans "content" faire :
			if element.length >= 5
				element_bis = ActiveSupport::Inflector.transliterate(element).downcase
				put element_bis
				#enlever la ponctuation
			#mot=Keyword.find_by_word(element) ? self.keywords << mot : self.keywords.create({word: element})
				if mot=Keyword.find_by_word(element_bis)
					self.keywords << mot 				 
				else
					self.keywords.create({word: element_bis})
				end
				self.save!
			end
		end
	end

	def delete_keywords
		keywords = self.keywords
		keywords.each do |kw|
			self.keywords.delete(kw)
		end

	end

end
