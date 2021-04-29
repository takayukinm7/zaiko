class Supplier < ActiveHash::Base
  self.data = [
    { id: 1, name: 'サプライヤー'},
    { id: 2, name: 'A社'},
    { id: 3, name: 'B社'},
    { id: 4, name: 'C社'},
    { id: 5, name: 'D社'}
  ]

    include ActiveHash::Associations
    has_many :parts

end