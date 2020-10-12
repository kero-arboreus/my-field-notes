class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '哺乳類' },
    { id: 3, name: '鳥類' },
    { id: 4, name: '爬虫・両生類' },
    { id: 5, name: '魚類' },
    { id: 6, name: '昆虫類' },
    { id: 7, name: '植物' },
    { id: 8, name: 'その他' }
  ]
end
