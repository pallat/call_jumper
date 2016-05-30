require 'json'
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

s = '{"AdministrativeAccount":
        {
            "company_name":"Odd-e",
            "first_name":"Twin",
            "last_name":"Panichsombat",
            "email":"roof@odd-e.com",
            "password":"password",
            "status":"pending",
            "CreditCard": {"credit_card_number":"1234567890123",
                "credit_card_expire_date":"10/21",
                "credit_card_security_code":"431"
            }
        }
    }'

json_payload = JSON.parse(s)

company_name  = json_payload["AdministrativeAccount"]["company_name"]
first_name    = json_payload["AdministrativeAccount"]["first_name"]
last_name   = json_payload["AdministrativeAccount"]["last_name"]
email   = json_payload["AdministrativeAccount"]["email"]
password    = json_payload["AdministrativeAccount"]["password"]
status  = json_payload["AdministrativeAccount"]["status"]

credit_card_number = json_payload["AdministrativeAccount"]["CreditCard"]["credit_card_number"]
credit_card_expire_date = json_payload["AdministrativeAccount"]["CreditCard"]["credit_card_expire_date"]
credit_card_security_code = json_payload["AdministrativeAccount"]["CreditCard"]["credit_card_security_code"]

account = AdministrativeAccount.new(
    company_name:       company_name,
    first_name:         first_name,
    last_name:          last_name,
    email:              email,
    password:           password,
    status: "pending"
)

credit_card = CreditCard.new(credit_card_number: credit_card_number,
                            credit_card_expire_date: credit_card_expire_date,
                            credit_card_security_code: credit_card_security_code)

#puts j["Resident"]["addr"]
account.credit_card = credit_card
account.save()

#puts objects
