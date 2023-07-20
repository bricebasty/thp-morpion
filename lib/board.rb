# frozen_string_literal: true

require 'bundler'
Bundler.require

class Board
  attr_accessor :cases

  def initialize
    @cases = Array.new(9, ' ')
  end


end