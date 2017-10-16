class Event < ApplicationRecord
  belongs_to :venue
  has_many   :user_events

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
