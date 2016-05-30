require 'mongoid'
require 'pony'
require 'gmail'

Mongoid.load!("./mongoid.yml", :development)

class AdministrativeAccount
    include Mongoid::Document
    field :company_name
    field :first_name
    field :last_name
    field :email
    field :password
    field :status
    field :created_date, type: Time, default: Time.now
    embeds_one :credit_card, class_name: "CreditCard"
end

class CreditCard
    include Mongoid::Document
    field :credit_card_number
    field :credit_card_expire_date
    field :credit_card_security_code
    embedded_in :administrative_account, class_name: "AdministrativeAccount"
end

account = AdministrativeAccount.new(
    company_name:       "Dall Jumper",
    first_name:         "Ieinrich",
    last_name:          "Ieine",
    email:              "soofimon@gmail.com",
    password:           "password",
    status: "pending"
)

credit_card = CreditCard.new(credit_card_number: "1234567890123",
                            credit_card_expire_date: "10/21",
                            credit_card_security_code: "345")

account.credit_card = credit_card
account.save()
