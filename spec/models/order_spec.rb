require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '商品出品' do
    context '商品出品できる時' do
      it 'すべての項目が入力されていれば登録できる' do
        expect(@order).to be_valid
      end
    end
    context '商品出品できない時' do
      it 'nameが空だと登録できない' do
        @order.postal_code = ''
        @order_address.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end