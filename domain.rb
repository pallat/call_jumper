require 'mongoid'

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
