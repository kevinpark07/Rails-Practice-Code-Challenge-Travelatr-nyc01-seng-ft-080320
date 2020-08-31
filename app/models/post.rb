class Post < ApplicationRecord
    belongs_to :destination
    belongs_to :blogger
    validates :content, length: { minimum: 100 }  
    validates :likes, presence: true

    def add_like
        self.likes += 1
        self.save
      end 
     
end
