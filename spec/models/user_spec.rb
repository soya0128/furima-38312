require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it '全ての項目の値が存在すれば新規登録ができる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれないと登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = 'i2345'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end      
      it 'password,password_confirmationが一致していなければ登録できない' do
        @user.password = '555xxx'
        @user.password_confirmation = '666yyy'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名字は全角以外では登録できない' do
        @user.last_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it '名前は全角以外では登録できない' do
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it '名字カナが空では登録できない' do
        @user.last_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
      end
      it '名前カナが空では登録できない' do
        @user.first_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end
      it '名字カナは全角以外では登録できない' do
        @user.last_name_furigana = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana is invalid")
      end
      it '名前カナは全角以外では登録できない' do
        @user.first_name_furigana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana is invalid")
      end
      it '生年月日が空では登録できない' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end
    end
  end

  # describe 'ユーザーログイン' do
  #   context 'ログインができる場合' do
  #     it 'email,passwordが一致すればログインできる' do
  #       
  #     end
  #   end
  #   context 'ログインができない場合' do
  #     it 'email,passwordが登録された情報と一致しなければログインできない' do
  #       @user.email = 
  #     end
  #   end
  # end
end