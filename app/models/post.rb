class Post < ActiveRecord::Base

  has_attached_file :image, styles: { thumb: "180x180#", standard: "250x250#"}, default_url: "/images/:style/missing.jpeg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :comments, dependent: :destroy
  validates :name, length: { minimum: 3 }
end
