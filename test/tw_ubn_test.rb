# frozen_string_literal: true

require "test_helper"

describe "TwUbn::Validator" do
  describe "測試 verify 方法" do
    it "應該要可以驗證 財政部 營利事業統一編號檢查碼邏輯修正說明文件的 統一編號" do
      ubn_list = %w[
        04595252
        04595257
        10458574
        10458575
      ]

      ubn_list.each do |ubn|
        _(TwUbn::Validator.call(ubn)).must_equal true
      end
    end

    it "錯的統編應該要判斷得出來" do
      CSV.foreach("test/fixtures/files/error_ubn_list.csv") do |row|
        _(TwUbn::Validator.call(row[0])).must_equal false
      end
    end

    it "應該可以驗證 30 組有效統一編號名單" do
      CSV.foreach("test/fixtures/files/ubn_list.csv") do |row|
        _(TwUbn::Validator.call(row[0])).must_equal true
      end
    end

    # it "應該可以驗證 150 萬筆公司統一編號 (必須全過)" do
    #   ubn_list = []
    #   CSV.foreach("test/fixtures/files/companies_1m.csv") do |row|
    #     ubn = row[1]
    #     ubn_list.push(ubn) if ubn =~ /^\d{8}$/
    #   end
    #   _(ubn_list.length > 1_500_000).must_equal true
    #   ubn_list.each do |ubn|
    #     result = TwUbn::Validator.call(ubn)
    #     print result ? "." : "X"
    #     _(result).must_equal true
    #   end
    # end
  end
end
