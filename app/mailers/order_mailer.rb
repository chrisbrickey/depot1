class OrderMailer < ApplicationMailer
  default from: 'Sam Ruby <depot@example.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received
    # @greeting = "Hi"  #Rails default
    @order = order

    mail to: "to@example.org", subject: 'Shopping Cart App Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped
    # @greeting = "Hi"  #Rails default
    @order = order

    mail to: "to@example.org", subject: 'Shopping Cart App Store Order Shipped'
  end
end
