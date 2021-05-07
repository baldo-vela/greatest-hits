class Comment < ApplicationRecord
    class Comment < ApplicationRecord
        belongs_to :user
        belongs_to :image
    
        validates :body, presence: true
    end
    
end
