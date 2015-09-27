require 'digest/md5'

module Color
  extend self

  def for(string)
    Digest::MD5.hexdigest(string)[0..5]
  end
end
