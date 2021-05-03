require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '製品の新規登録' do
    context '製品登録できる場合' do
      it '各項目を適切に入力していれば登録できる' do
        expect(@product).to be_valid
      end
    end
    context '製品登録できない場合' do
      it '製品名称が空では登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("製品名称を入力してください")
      end
      it 'ユーザーが紐づいていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("ユーザーを入力してください")
      end
    end
  end
end
