require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @orderform= FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it 'post_code,prefecture_id,city,block,building,phone_number,token,item_id,user_idが存在すれば購入できる' do
        expect(@orderform).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @orderform.building = ''
        @orderform.valid?
        expect(@orderform).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'post_codeが空では購入できない' do
        @orderform.post_code = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idが空では購入できない' do
        @orderform.prefecture_id = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1では登録できない' do
        @orderform.prefecture_id = 1
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空では購入できない' do
        @orderform.city = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では購入できない' do
        @orderform.block = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @orderform.phone_number = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では購入できない' do
        @orderform.token = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Token can't be blank")
      end
      it 'item_idが空では購入できない' do
        @orderform.item_id = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では購入できない' do
        @orderform.user_id = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("User can't be blank")
      end

      it 'post_codeに-がないと購入できない' do
        @orderform.post_code = '1234567'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Post code is invalid")
      end
      it 'phone_numberが全角では購入できない' do
        @orderform.phone_number = '１２３４５６７８９０１'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁以下では購入できない' do
        @orderform.phone_number = '123456789'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @orderform.phone_number = '123456789102'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid")
      end
      
    end



  end
end
