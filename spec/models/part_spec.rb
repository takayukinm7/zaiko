require 'rails_helper'

RSpec.describe Part, type: :model do
  before do
    @part = FactoryBot.build(:part)
  end

  describe '部品の新規登録' do
    context '部品登録できる場合' do
      it '各項目を適切に入力していれば登録できる' do
        expect(@part).to be_valid
      end
      it '価格は半角数字であれば登録できる' do
        @part.price = 300
        expect(@part).to be_valid
      end
    end
    context '部品登録できない場合' do
      it '部品名称が空では登録できない' do
        @part.name = ''
        @part.valid?
        expect(@part.errors.full_messages).to include("部品名称を入力してください")
      end
      it '規格が空では登録できない' do
        @part.number = ''
        @part.valid?
        expect(@part.errors.full_messages).to include("規格を入力してください")
      end
      it 'カテゴリーが未選択では登録できない' do
        @part.category_id = 1
        @part.valid?
        expect(@part.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it '材料が空では登録できない' do
        @part.material = ''
        @part.valid?
        expect(@part.errors.full_messages).to include("材料を入力してください")
      end
      it '価格が空では登録できない' do
        @part.price = ''
        @part.valid?
        expect(@part.errors.full_messages).to include("価格を入力してください")
      end
      it '価格は半角数字でないと登録できない' do
        @part.price = '３００'
        @part.valid?
        expect(@part.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'サプライヤーが未選択では登録できない' do
        @part.supplier_id = 1
        @part.valid?
        expect(@part.errors.full_messages).to include("サプライヤーを選択してください")
      end
      it 'ユーザーが紐づいていないと保存できない' do
        @part.user = nil
        @part.valid?
        expect(@part.errors.full_messages).to include("ユーザーを入力してください")
      end
    end
  end
end

