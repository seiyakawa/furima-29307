require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入登録' do
    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが入力されていなくても登録できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空だと登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと登録できない' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank", 'Post code Input correctly')
      end
      it 'cityが空だと登録できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと登録できない' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is not a number')
      end

      it 'prefecture_idが0だと登録できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Select')
      end

      it 'post_codeが半角のハイフンを含んでいないと正しく登録できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code Input correctly')
      end
      it 'phone_numberがハイフンを含んでいると正しく登録できない' do
        @order_address.phone_number = '090-123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'phone_numberが12桁以上であると正しく登録できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
      end
    end
  end
end
