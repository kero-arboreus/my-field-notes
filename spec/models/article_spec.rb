require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '記事投稿機能' do
    before do
      @article = FactoryBot.build(:article)
    end

    context '投稿がうまくいくとき' do
      it '項目が全て入力されていれば投稿できる' do
        expect(@article).to be_valid
      end

      it 'parkingが空でも投稿できる' do
        @article.parking = nil
        expect(@article).to be_valid
      end

      it 'toiletが空でも投稿できる' do
        @article.toilet = nil
        expect(@article).to be_valid
      end

      it 'crowdが空でも投稿できる' do
        @article.crowd = nil
        expect(@article).to be_valid
      end

      it 'hashbodyが空でも投稿できる' do
        @article.hashbody = nil
        expect(@article).to be_valid
      end

      it 'textが空でも投稿できる' do
        @article.text = nil
        expect(@article).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'titleが空では投稿できないこと' do
        @article.title = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('タイトルを入力してください')
      end

      it 'titleが30文字以上では投稿できないこと' do
        @article.title = "ああああああああああいいいいいいいいいいううううううううううえ"
        @article.valid?
        expect(@article.errors.full_messages).to include('タイトルは30文字以内で入力してください')
      end

      it 'caregory_idが空では投稿できないこと' do
        @article.category_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include('カテゴリーを選択してください')
      end

      it 'dateが空では投稿できないこと' do
        @article.date = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('日付を入力してください')
      end

      it 'time_zone_idが空では投稿できないこと' do
        @article.time_zone_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include('時間帯を選択してください')
      end

      it 'imagesが空では投稿できないこと' do
        @article.images = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('画像を入力してください')
      end

      it 'prefecture_idが空では投稿できないこと' do
        @article.prefecture_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include('都道府県を選択してください')
      end

      it 'addressが空では投稿できないこと' do
        @article.address = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('住所を入力してください')
      end
    end
  end
end
