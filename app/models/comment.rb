class Comment < ApplicationRecord
   belongs_to :user
   belongs_to :playlist
    
   validates :body, presence: true    
end
