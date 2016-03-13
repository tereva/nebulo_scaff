class Category < ActiveRecord::Base


	public

	  def list_keyword_ids
	 	appreciations =  Appreciation.where(category: self.id)
	 	list=[]
	 	appreciations.each do |appreciation|
			 # indices des KW pour appreciation
	 		list.push(Appreciation.find(appreciation.id).keyword_ids)
	 	end
	 	return list.uniq
	  end


end
