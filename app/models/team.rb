class Team < ApplicationRecord
  validates :slack_id, presence: true
  has_many :users, -> { order("position ASC") }
  has_one :player

  def user_rota
    @user_rota ||= UserRota.new(self)
  end
end
