class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes
        self.posts.reduce(0) { |sum, post| sum + post.likes }
    end 

    def most_liked_post
        self.posts.max { |post_a, post_b| post_a.likes <=> post_b.likes }
    end 
end
