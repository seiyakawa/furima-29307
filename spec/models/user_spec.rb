require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、family_name_kanziとfirst_name_kanzi、family_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合であれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        expect(@user).to be_valid
      end
      it "family_name_kanziとfirst_name_kanziが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        expect(@user).to be_valid
      end
      it "family_name_kanaとfirst_name_kanaが全角（カタカナ）であれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_name_kanziが空では登録できない" do
        @user.family_name_kanzi = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanzi can't be blank", "Family name kanzi Full-width characters")
      end
      it "first_name_kanziが空では登録できない" do
        @user.first_name_kanzi = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanzi can't be blank", "First name kanzi Full-width characters")
      end
      it "family_name_kanaが空では登録できない" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana Full-width katakana characters")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana Full-width katakana characters")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailが@を含んでいない場合登録できない" do
        @user.email = "abc123"
        @user.valid?
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "abc12"
        # @user.password_confirmation = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが全角では登録できない" do
        @user.password = "abc１２３"
        # @user.password_confirmation = "abc１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが英数字を１つずつ含んでいないと登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it "family_name_kanziが半角では登録できない" do
        @user.family_name_kanzi = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanzi Full-width characters")
      end
      it "first_name_kanziが半角では登録できない" do
        @user.first_name_kanzi = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanzi Full-width characters")
      end
      it "family_name_kanaが半角では登録できない" do
        @user.family_name_kana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana Full-width katakana characters")
      end
      it "first_name_kanaが半角では登録できない" do
        @user.first_name_kana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end

      it "family_name_kanaが漢字・ひらがなでは登録できない" do
        @user.family_name_kana = "山だ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana Full-width katakana characters")
      end
      it "first_name_kanaが漢字・ひらがなでは登録できない" do
        @user.first_name_kana = "太ろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
    end
  end
end
