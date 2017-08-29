# Egoi

Simple E-Goi API Wrapper

## Installation

Add this line to your application's Gemfile:

    gem 'egoi', git 'https://github.com/ignicaodigitalbr/egoi'

And then execute:

    $ bundle

## Usage

```ruby
# Create an instance of the xmlrpc connector
Egoi::XmlRpc.new
# You may pass arguments to initialize it with specific configs you want
# Example:
Egoi::XmlRpc.new(friendly_messages: false, apikey: 'YOUR APIKEY')
# If you initialize it with an apikey, it will be used in future api calls
```
After you have a XmlRpc instance, you may call any of the (E-Goi API)[https://api-docs.e-goi.com/#api-methods]
methods by calling through it. For instance:
```ruby
egoi_client = Egoi::XmlRpc.new
egoi_client.checklogin(apikey: 'YOUR APIKEY')
# It will call the api checklogin method with the apikey parameter.
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
