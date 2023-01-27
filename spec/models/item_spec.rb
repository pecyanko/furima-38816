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
        expect(@item.errors.full_messages).to include("名前を入力してください")
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'introductionが空だと登録できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'costが空だと登録できない' do
        @item.cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'categoryが[---]を選択していると登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'conditionが[---]を選択していると登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'chargeが[---]を選択していると登録できない' do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'prefectureが[---]を選択していると登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'delivery_dayが[---]を選択していると登録できない' do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数を入力してください")
      end
      it 'costが300円未満だと登録できない' do
        @item.cost = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格が設定範囲外です')
      end
      it 'costが9,999,999円を超えると登録できない' do
        @item.cost = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格が設定範囲外です')
      end
      it 'costが全角数値だと登録できない' do
        @item.cost = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は半角数字で入力してください')
      end
      it 'costが半角文字だと登録できない' do
        @item.cost = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は半角数字で入力してください')
      end
      it 'userが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザー情報を入力してください')
      end
    end
  end
end
