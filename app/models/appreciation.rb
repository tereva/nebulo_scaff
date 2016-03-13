class Appreciation < ActiveRecord::Base

	belongs_to :category
	# has_many :indexations
	# has_many :keywords, :through => :indexations

	has_and_belongs_to_many :keywords
	
	#attr_accessible :content

	validates :content, presence: true

	public

	def parse
		split_content = self.content.gsub(/\W/, '').squish.split(' ')
		split_content.each do |element|		
		# Pour chaque "element" > 5 char dans "content" faire :
			if element.length >= 4
				element_bis = ActiveSupport::Inflector.transliterate(element.downcase.to_s)
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

end
