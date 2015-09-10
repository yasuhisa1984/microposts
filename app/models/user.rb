class User < ActiveRecord::Base
    before_save { self.email = email.downcase } #コールバック downcaseは小文字に変える
    validates :name, presence: true, length: { maximum: 50 } #nameは空でなく、また、最大50文字
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },#format正規表現パターンに一致しているか
                      uniqueness: { case_sensitive: false} #ase_sensitive大文字と小文字を区別するか
    has_secure_password #認証機能を追加することができる
    has_many :microposts
end
