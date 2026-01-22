class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype
  # content က အလွတ်မဖြစ်ရဘူးလို့ သတ်မှတ်ခြင်း
  validates :content, presence: true
end