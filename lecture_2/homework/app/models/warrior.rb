# frozen_string_literal: true

class Warrior < ApplicationRecord
  belongs_to :clan
  belongs_to :defensible, polymorphic: true
  has_one :weapon

  validates :name, presence: true, uniqueness: { scope: :clan_id,
                                                 conditions: -> { where(death_date: nil) } }
  validates :armor_quality, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 100 }
  validates :weapon_kind, presence: true, inclusion: { in: Weapon.kinds.keys }

  scope :alive, -> { where(death_date: nil) }
  scope :dead, -> { where.not(death_date: nil) }
end
