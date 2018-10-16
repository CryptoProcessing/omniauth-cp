# OmniAuth CryptoProcessing

This is the official OmniAuth strategy for authenticating to CryptoProcessing. To
use it, you'll need to sign up for an OAuth2 Application ID and Secret
on the [CP Applications Page](https://cryptoprocessing.io/oauth/applications).

## Basic Usage

```ruby
use OmniAuth::Builder do
  provider :cp, ENV['CP_APP_ID'], ENV['CP_APP_SECRET']
end
```
