# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  birthday        :date
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  # テストの対象 ageメソッド
  describe '#age' do
    # モックの定義
    before do 
      allow(Time.zone).to receive(:now).and_return(Time.zone.parse('2018/04/01'))
    end

    # どういう条件で行うかの説明
    context '20年前の生年月日の場合' do
      # letはrpecで使用される構文 letのブロックの中で生成したuserオブジェクトが参照される
      let(:user) { User.new(birthday: Time.zone.now - 20.years)}

      # 最終的にどういう状態が正なのか
      it '年齢が20歳であること' do
        expect(user.age).to eq 20
      end
    end

    context '10年前に生まれた場合でちょうど誕生日の場合' do
      # letはrpecで使用される構文 letのブロックの中で生成したuserオブジェクトが参照される
      let(:user) { User.new(birthday: Time.zone.parse('2008/04/01'))}

      it '年齢が10歳であること' do
        expect(user.age).to eq 10
      end
    end
    context '10年前に生まれた場合で誕生日が来ていない場合' do
      # letはrpecで使用される構文 letのブロックの中で生成したuserオブジェクトが参照される
      let(:user) { User.new(birthday: Time.zone.parse('2008/04/02'))}

      it '年齢が9歳であること' do
        expect(user.age).to eq 9
      end
    end
  end
end

