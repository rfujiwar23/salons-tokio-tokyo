class Search < ApplicationRecord

  self.inheritance_column = "not_sti"

  def search_salon
    salon = Salon.all
    salon = salon.where(['name LIKE ?', name]) if name.present?
    salon = salon.where(['address LIKE ?', address]) if address.present?
  end

end
