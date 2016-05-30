require "net/http"
require "uri"

uri = URI('http://localhost:4567/register')

res = Net::HTTP.post_form(uri, 'data' => '{"AdministrativeAccount":
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
    }')

puts res.body
