class Order < ApplicationRecord
  belongs_to :cart
  # after_create :order_send

  def order_send
    OrderMailer.order_email(self).deliver_now
  end

end
