# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
App::Application.config.secret_key_base = 'cf50e9dc26512d73a31b19623972f6650edd11ce16b04a3952af650dec557564d563e7445d9f127639a5364968a97337aaabc2bdf8e5b775c5d0a0e09d9d1c0c'
