class InquiryController < ApplicationController
  def index
    # 入力画面を表示
    @inquiry = Inquiry.new
    @contactkinds = Contactkind.all
    render :action => 'index'
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    @contactkinds = Contactkind.find(@inquiry.contactkind)
    # 入力値のチェック
    if @inquiry.valid?
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      # NG。入力画面を再表示
      render :action => 'index'
    end
  end

  def thanks
    # 戻るボタン
    if params[:back]
      @inquiry = Inquiry.new(inquiry_params)
      @contactkinds = Contactkind.all
      render :action => 'index'
    else
      # メール送信
      @inquiry = Inquiry.new(inquiry_params)
      InquiryMailer.received_email(@inquiry).deliver
      # 完了画面を表示
      render :action => 'thanks'
    end

  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :tel, :message, contactkind: [])
  end
end
