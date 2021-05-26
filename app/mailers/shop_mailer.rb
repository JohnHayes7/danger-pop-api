class ShopMailer < ApplicationMailer
    default from: 'WarwickCreativeServices@gmail.com'

    def tr_notice(tr)
       @tr = tr
        mail(to: 'dangerpopstudio@gmail.com', subject: "Welcome to Danger Pop!")
    end

end