FactoryBot.define do
    factory :user do
      email {"atuf@atuf.com"}
      password { "123456" }
      isAdmin {true}
    end
    factory :product do
     title {'temp'}
     price {150}
    end
    factory :category do
      title {'temp'}
    end
    factory :cart do
      ischeckout {'false'}
    end
end