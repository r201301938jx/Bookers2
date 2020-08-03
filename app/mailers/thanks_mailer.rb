class ThanksMailer < AcitonMailer::Base
    def send_confirm_to_user(user)
        @user = user
        mail to: user.email, subject:"新規登録完了のご連絡"
    end
end
