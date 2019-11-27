class OrderMailer < ApplicationMailer

  def order_email(order)
    @order = order
    @user = order.cart.user
    @url = 'http://monsite.fr/login' 
    mail(to: @user.email, bcc: 'gueyome@hotmail.fr', subject: 'Votre récapitulatif de commande!')

  end

end
