# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  
  validates :birth_date, presence: true
  validates :name, presence: true, uniqueness: true
  validates :color, inclusion: { in: %w(red pink crimson moon)}
  validates :sex, inclusion: { in: %w(M F)}
  

  def age
    Time.zone.now.year - birth_date.year
  end

end
