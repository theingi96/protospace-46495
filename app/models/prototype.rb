class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image # ပုံ ၁ ပုံ ချိတ်ဆက်မယ်

  # Validation များ ထည့်ရန်
  validates :title,      presence: true  # title (ပရောဂျက်အမည်) မပါမဖြစ်
  validates :catch_copy, presence: true  # catch_copy မပါမဖြစ်
  validates :concept,    presence: true  # concept မပါမဖြစ်
  validates :image,      presence: true  # image (ပုံ) မပါမဖြစ်
  has_many :comments, dependent: :destroy
end
