class TattoorequestsentMailer < ApplicationMailer
    default from: 'WarwickCreativeServices@gmail.com'

    def confirmation_email(tr)
        @tr = tr
        # @specialtext = `Hello #{tr.guest_email}, You have successfully submitted a Tattoo Request to Danger Pop Studio.  Someone will respond to your request in 3-5 buisness days.`
        mail(to: @tr.guest_email, subject: 'Danger Pop Studio Tattoo-Request')
    end

    def declined_email(tr)
        @tr = tr
        mail(to:@tr.guest_email, subject: 'Danger Pop Studio Tattoo-Request')
    end

end