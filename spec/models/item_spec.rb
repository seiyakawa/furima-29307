require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do
    context '出品がうまくいくとき' do
      it 'imageとname、text、categoryとsales_status、shipping_fee_statusとprefecture、scheduled_delivery、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと登録できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'categoryが空だと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択してください')
      end
      it 'sales_statusが空だと登録できない' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status を選択してください')
      end
      it 'shipping_fee_statusが空だと登録できない' do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status を選択してください')
      end
      it 'prefectureが空だと登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture を選択してください')
      end
      it 'scheduled_deliveryが空だと登録できない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery を選択してください')
      end
      it 'preceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price を半角数字で入力してください', 'Price を300〜9,999,999の範囲で入力してください')
      end

      it 'priceの値が全角数字では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price を半角数字で入力してください', 'Price を300〜9,999,999の範囲で入力してください')
      end
      it 'priceの値が300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price を300〜9,999,999の範囲で入力してください')
      end
      it 'priceの値が10000000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price を300〜9,999,999の範囲で入力してください')
      end
    end
  end
end
