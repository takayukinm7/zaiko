require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できる場合' do
      it '各項目を適切に入力していれば登録できる' do
        expect(@user).to be_valid
      end
      it 'メールアドレスには＠が含まれている' do
        @user.email = 'a@a'
        expect(@user).to be_valid
      end
      it 'パスワードが６文字以上であれば登録できること' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
      it 'パスワードには半角英数が共に含まれる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
      it 'パスワードは２回入力が必要' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
      it '社員番号は半角数字のみ' do
        @user.number = 111
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録できない場合' do
      it '氏名が空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名を入力してください")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'メールアドレスが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'メールアドレスに＠が存在しないと登録できない' do
        @user.email = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが５文字以下であれば登録できない' do
        @user.password = '111aa'
        @user.password_confirmation = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードが半角英しか存在しないと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'パスワードが半角数字しか存在しないと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'パスワードと確認用パスワードが不一致では登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = '111qqq'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '社員番号が空では登録できない' do
        @user.number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("社員番号を入力してください")
      end
      it '社員番号に半角数字以外が含まれていると登録できない' do
        @user.number = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("社員番号は数値で入力してください")
      end
      it '社員番号が重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, number: @user.number)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("社員番号はすでに存在します")
      end
    end
  end
end
