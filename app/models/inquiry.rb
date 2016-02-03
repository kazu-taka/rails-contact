class Inquiry
  include ActiveModel::Model

  attr_accessor :name, :email, :tel, :message,:contactkind

  validates :name, presence: { message: '名前を入力してください'}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX , message: '正しい形式で入力してください'}
  validates :tel, format: { with: /\A[0-9]{10,11}\z/, message: '数字10桁または11桁で入力してください' }
  validates :message, presence: { message: 'お問い合わせ内容を入力してください'}
end
