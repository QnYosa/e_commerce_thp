class Order < ApplicationRecord
  belongs_to :cart
  after_create :order_send

  def order_send
    UserMailer.order_email(self).deliver_now
  end

end
