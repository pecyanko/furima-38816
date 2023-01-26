require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end
  describe '商品購入機能' do
    context '内容に問題ない場合' do
      it 'すべての項目が入力されていれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品出品できない時' do
      it 'postal_codeが空だと登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが[---]だと登録できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと登録できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeが[3桁ハイフン4桁]以外だと登録できない' do
        @order_address.postal_code = '8888888'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'phone_numberが半角数字以外だと登録できない' do
        @order_address.phone_number = '０８０１１１１２２２２'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number  is invalid. Input only number')
      end
      it 'phone_numberが9桁以下だと登録できない' do
        @order_address.phone_number = '080123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too short or long')
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @order_address.phone_number = '080123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too short or long')
      end
      it 'item_idが空だと登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空だと登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空だと登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
