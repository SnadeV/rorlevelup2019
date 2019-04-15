class WeaponSerializer
  include FastJsonapi::ObjectSerializer

  attributes :type, :kind, :damage, :range
  belongs_to :warrior
end
