class Post < ApplicationRecord
  def cow_saying_title
    url = 'http://cowsay.morecode.org/say'
    Faraday.get(url, message: title, format: 'text').body
  end
end
