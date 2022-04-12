class TraderMailer < ApplicationMailer
    def approved_notification
        @trader = params[:trader]
        @url  = 'localhost:1025'
        mail(to: @trader.user.email, subject: 'Your Account has been approved!')
    end
end
