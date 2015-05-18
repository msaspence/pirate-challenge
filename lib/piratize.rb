require 'exceptions'
require 'ship'
require 'big_ship'
require 'boarding_party'
require 'piratizable'
require 'ship_wreck'
require 'talk_like_a_pirate'


class Piratize

  def self.piratize value, &block
    if value.is_a?(String)
      r = TalkLikeAPirate.translate(value)
      r = r.gsub /gold|coins?|treasure/, ""
    elsif value.is_a?(Array)
      r = value.map{ |v| piratize v, &block }
    elsif value.is_a?(Hash)
      r = value.update(value){ |k,v| piratize v, &block }
    elsif value.is_a?(Float)
      r = Rational((value*8).round,8)
    elsif value.class.include? Ship
      begin
        value.board! BoardingParty.new
        r = value
      rescue PartyRepelledError
        r = ShipWreck.new value
      rescue NoTreasureError
        r = value
        puts "Ya! No treasure were found me 'earty!"
      end
    elsif value.is_a?(Symbol)
      raise WhatBeThisError.new "'Ere, what be a 'symbol'"
    end
    r = yield r if block_given?
    r
  end

end
