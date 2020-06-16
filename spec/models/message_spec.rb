require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'can save' do
      it 'メッセージがある場合に保存できる' do
        expect(build(:message, image: nil)).to be_valid
      end

      it '画像がある場合に保存できる' do
        expect(build(:message, content: nil)).to be_valid
      end

      it 'メッセージと画像がある場合に保存できる' do
        expect(build(:message)).to be_valid
      end
    end

    context 'can not save' do
      it 'メッセージと画像がない場合に保存できない' do
        message = build(:message, content: nil, image: nil)
        message.valid?
        expect(message.errors[:content]).to include("を入力してください")
      end

      it 'グループIDがない場合保存できない' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end

      it 'ユーザーIDがない場合に保存できない' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end
end