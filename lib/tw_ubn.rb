# frozen_string_literal: true

require_relative "tw_ubn/rules"
require_relative "tw_ubn/version"

module TwUbn
  # taiwan unified business number validator
  class Validator
    def initialize(ubn)
      @ubn = ubn.to_s
    end

    def self.call(*args)
      new(*args).verify
    end

    def verify
      return false if (@ubn =~ /^\d{8}$/).nil?

      ubn_array = @ubn.chars.map(&:to_i)
      checksum = calculate_checksum(ubn_array)

      verify_checksum(checksum)
    end

    def calculate_checksum(ubn_array)
      first_result =
        ubn_array.map.with_index do |v, i|
          v * TwUbn::UBN_CALC_WEIGHT[i]
        end

      second_result =
        first_result.map { |v| (v / 10).floor + v % 10 }

      second_result.sum
    end

    def verify_checksum(checksum)
      key = TwUbn::VERIFY_UBN_KEY
      use_special_verify = @ubn[6] == "7"

      if use_special_verify
        ((checksum - 10) % key).zero? ||
          ((checksum - 9) % key).zero?
      else
        (checksum % key).zero?
      end
    end
  end
end
