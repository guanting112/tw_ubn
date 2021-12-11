# Taiwan UBN Validator (2021) 

[![Gem Version](https://badge.fury.io/rb/tw_ubn.svg)](https://badge.fury.io/rb/tw_ubn)
[![Maintainability](https://api.codeclimate.com/v1/badges/2e20efaaac6115c6df87/maintainability)](https://codeclimate.com/github/guanting112/tw_ubn/maintainability)
![example workflow](https://github.com/guanting112/tw_ubn/actions/workflows/main.yml/badge.svg)

此為針對 台灣營利事業統一編號 (UBN) 所開發的驗證套件。

您可以使用它進行驗證，確認使用者提供的公司統一編號是否有效。

* 本套件適用於電商平台發票資料、企業相關表單欄位 輔助驗證。
* 可減少因消費者統編填錯，與客服溝通/重開的來往成本。
* 已經過大量現實資料驗證，另有搭配 150 萬筆商工行政資料確定校對方式正確。
* 與 財政部財資中心 2021年6月公告的新驗證邏輯同步 ( 因應 2024 年公司統一編號用盡之問題 )

![tw_ubn](https://i.imgur.com/cawNbf4.png)

驗證之規則與細節參考，皆來自台灣財政部財政資訊中心之公告 「 [營利事業統一編號檢查碼邏輯修正說明][fia_rule] 」 

## Installation / 安裝方式

via Rubygems

```shell
gem install tw_ubn
```

In your Gemfile:

```ruby
gem 'tw_ubn'
```

## Usage / 如何使用

使用很簡單，僅需要呼叫 TwUbn::Validator.call 即可確認是否正確

```ruby
require 'tw_ubn'

TwUbn::Validator.call("8碼公司統編")
```

```ruby
require 'tw_ubn'

# 有效的
TwUbn::Validator.call("22099131") # true
TwUbn::Validator.call("47217677") # true
TwUbn::Validator.call("22822281") # true

# 錯誤的公司統編
TwUbn::Validator.call("22822280") # false
TwUbn::Validator.call("47217977") # false
TwUbn::Validator.call("88123") # false
TwUbn::Validator.call("11099131") # false
```

在 Ruby on Rails 內，您也可以將 TwUbn::Validator 導入到自建的 validator 內使用。

https://api.rubyonrails.org/classes/ActiveModel/Validator.html

```ruby
class TaxDataValidator < ActiveModel::Validator
  def validate(record)
    if !TwUbn::Validator.call(record.tax_number)
      record.errors.add(:tax_number, '統一編號格式不正確。')
    end
  end
end
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
