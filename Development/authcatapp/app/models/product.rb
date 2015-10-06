class Product < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  has_attached_file :picture,
                    styles: { medium: "300x300>", tumb: "100x100>" },
                    default_url: "/images/:styles/missing.png"
  validates_attachment :picture,
                    presence: true, 
                    cntent_type: { content_type: ["image/jpeg", "image/gif", "image/png"]}
  acts_as_taggable_on :tags  
  
  def category_name
    self.category.name
  end  
end
