Address parser
===============


Installation
----

First start by adding this gem to your Gemfile:

``` ruby
gem 'address_parser', git: 'Tolia/address_parser'
```
And then execute
```
$ bundle
```


Usage
-----
``` ruby
> AddressParser.address_to_hash 'Шверника 17 к3'
=> {"lat"=>55.69339, "lng"=>37.592536, :number=>"17", :housing=>"3", :street=>"ul. Shvernika"}

> AddressParser.address_to_hash 'ул. Правды, 24 строение 5'
=> {"lat"=>55.788523, "lng"=>37.584676, :number=>"24", :building=>"5", :street=>"ul. Pravdy"}

```