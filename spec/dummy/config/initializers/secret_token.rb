# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
if Rails::VERSION::MAJOR < 5
  Dummy::Application.config.secret_token = '8f4cbaa2b5177e95c5ec90b258ddd53b6c7efdcb4fa0a5bb098f5fd9d034b82ad56889231e2c2cdba5dc821042bdc4f9919cb94f1522b49f4e1a0a08d6b2d166'
end
Dummy::Application.config.secret_key_base = '6e645b1c4eb2351e8e90ae0194ad60f6f3c6e2e77e92c352e87e39e075e2ce0e22ef35fb813681ab23fb735ea54046c613beb03885946167159e4370c7afe3a4'
