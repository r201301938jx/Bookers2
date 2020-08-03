class ThanksMailer < AcitonMailer::Base
	default from: "hogehoge@example.com"

    def send_confirm_to_user(user)
        @user = user
        mail(
            subject: "会員登録が完了しました。", #メールのタイトル
            to: 'dee877ced7k30@icloud.com' #宛先
        ) do |format|
            format.text
        end
    end
end
