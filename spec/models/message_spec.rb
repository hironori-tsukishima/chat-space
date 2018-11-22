require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with text' do
        message = build(:message , image: nil)
        expect(message.errors).to include()
      end

      it 'is valid with image' do
        message = build(:message, text: nil)
        expect(message.errors).to include()
      end

      it 'is valid with text and image' do
        message = build(:message)
        expect(message.errors).to include()
      end
    end

    context 'can not save' do
      it 'is invalid without text and image' do
        message = build(:message, text: nil, image: nil)
        message.valid?
        expect(message.errors[:text]).to include('を入力してください')
      end

      it 'is invalid without group_id' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include('を入力してください')
      end

      it 'is invaid without user_id' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user_id]).to include()
      end
    end
  end
end
