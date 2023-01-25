require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  describe '商品出品' do
    context '商品出品できる時' do
      it 'すべての項目が入力されていれば登録できる' do
        expect(@address).to be_valid
      end
    end
    context '商品出品できない時' do
      it 'postal_codeが空だと登録できない' do
        @address.postal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal_code can't be blank")
      end
      it 'prefecture_idが[---]だと登録できない' do
        @address.prefecture_id = '1'
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと登録できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと登録できない' do
        @address.block = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal_code can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone_number can't be blank")
      end
      it 'postal_codeが[3桁ハイフン4桁]以外だと登録できない' do
        @address.postal_code = '8888888'
        @address.valid?
        expect(@address.errors.full_messages).to include("Is invalid. Include hyphen(-)")
      end
      it 'nameが空だと登録できない' do
        @address.postal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal_code can't be blank")
      end
      it 'phone_numberが半角数字以外だと登録できない' do
        @address.phone_number = '０８０１１１１２２２２'
        @address.valid?
        expect(@address.errors.full_messages).to include("Is invalid. Input only number")
      end
      it 'phone_numberが10桁以下だと登録できない' do
        @address.phone_number = '0801111'
        @address.valid?
        expect(@address.errors.full_messages).to include("Is too short")
      end
    end
  end
end
