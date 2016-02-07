class InquiryMailer < ActionMailer::Base
  default from: "nike.taka@gmail.com"   # 送信元アドレス
  default to: "info@nowall.co.jp"     # 送信先アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました')
  end
end
