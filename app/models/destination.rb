class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def five_most_recent_posts
        #limit to 5 when there are more posts in the db
        self.posts.reverse

    end 

    def self.most_post
        Destination.all.max { |dest_a, dest_b| dest_a.posts.count <=> dest_b.posts.count }
    end 

    def most_liked_post
        self.posts.max { |post_a, post_b| post_a.likes <=> post_b.likes }
    end 

    def average_age_of_bloggers
        total_age = self.bloggers.uniq.reduce(0) {|sum, blogger| sum + blogger.age }
        total_bloggers = self.bloggers.uniq.count
        total_age / total_bloggers
    end 

end
