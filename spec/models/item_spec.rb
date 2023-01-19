require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品できる時' do
      it 'すべての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない時' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'introductionが空だと登録できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'costが空だと登録できない' do
        @item.cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it 'categoryが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが空だと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'chargeが空だと登録できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it 'prefectureが空だと登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_dayが空だと登録できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'costが¥300~¥9,999,999の範囲外だと登録できない' do
        @item.cost = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost Out of setting range')
      end
      it 'costが全角数値だと登録できない' do
        @item.cost = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost Half-width number')
      end
      it 'costが半角文字だと登録できない' do
        @item.cost = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost Half-width number')
      end
    end
  end
end
