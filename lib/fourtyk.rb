module Fourtyk
  def shorten_number
    if self.is_a?(String)
      self.gsub!(/[a-zA-z$,]/,"")
    end
    num = self.to_i
    string = num.to_s
    length = string.length
    
    case length
    when 4..6 
      label = "K"
      upper = 4
      lower = -3
    when 7..9 
      label = "M"
      upper = 7
      lower = -6
    when 10..12 
      label = "B"
      upper = 10
      lower = -9
    else
      label = nil
    end
    
    if label
      first = string[0..length - upper].to_i
      last = string[lower..lower+2].to_i * 0.001
      last = sprintf("%.1f", last).to_f
      num = first + last
      num = num.round if last.zero? || last == 1
    end
    
    "#{num}#{label}"
  end
  
  def shorten_money(options = {})
    options[:currency] ||= "$"
    "#{options[:currency]}#{self.shorten_number}"
  end
end

class Numeric # :nodoc:
  include Fourtyk
end

class String # :nodoc:
  include Fourtyk
end