class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'カテゴリー'},
    { id: 2, name: '加工部品'},
    { id: 3, name: '購入部品'}
  ]

    include ActiveHash::Associations
    has_many :parts

end