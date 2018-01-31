require 'test_helper'
require 'minitest/spec'

class TestHelper < ActionView::Base; end

class SpectreFormWithTest < ActiveSupport::TestCase
  extend MiniTest::Spec::DSL
  
  let(:f) {
    SpectreFormWith::FormBuilder.new(:user, User.new, TestHelper.new, {})
  }

  describe '#form_icon' do
    it 'returns a i element with class="form-icon"' do
      f.form_icon.must_equal %Q{<i class="form-icon"></i>}
    end
  end

  describe '#text_field' do
    it 'returns a input element with type="text" and class="form-input"' do
      f.text_field(:about).must_equal %Q{<input class="form-input" type="text" name="user[about]" id="user_about" />}
    end
  end

  describe '#text_area' do
    it 'returns a textarea element with class="form-input"' do
      f.text_area(:about).must_equal %Q{<textarea class="form-input" name="user[about]" id="user_about">\n</textarea>}
    end
  end

  describe '#search_field' do
    it 'returns a input element with type="search" and class="form-input"' do
      f.search_field(:about).must_equal %Q{<input class="form-input" type="search" name="user[about]" id="user_about" />}
    end
  end

  describe '#number_field' do
    it 'returns a input element with class="form-input"' do
      f.number_field(:favorite_number).must_equal %Q{<input class="form-input" type="number" name="user[favorite_number]" id="user_favorite_number" />}
    end
  end

  describe '#range_field' do
    it 'returns a input element with class="form-input"' do
      f.range_field(:favorite_number).must_equal %Q{<input class="form-input" type="range" name="user[favorite_number]" id="user_favorite_number" />}
    end
  end

  describe '#email_field' do
    it 'returns a input element with type="email" and class="form-input"' do
      f.email_field(:email).must_equal %Q{<input class="form-input" type="email" name="user[email]" id="user_email" />}
    end
  end

  describe '#password_field' do
    it 'returns a input element with type="password" and class="form-input"' do
      f.password_field(:password).must_equal %Q{<input class="form-input" type="password" name="user[password]" id="user_password" />}
    end
  end

  describe '#telephone_field' do
    it 'returns a input element with type="tel" and class="form-input"' do
      f.telephone_field(:phone_number).must_equal %Q{<input class="form-input" type="tel" name="user[phone_number]" id="user_phone_number" />}
    end
  end

  describe '#url_field' do
    it 'returns a input element with type="url" and class="form-input"' do
      f.url_field(:homepage).must_equal %Q{<input class="form-input" type="url" name="user[homepage]" id="user_homepage" />}
    end
  end

  describe '#datetime_field' do
    it 'returns a input element with type="datetime-local", min="2017-08-31T00:00:00" and class="form-input"' do
      halloween = DateTime.parse('31-8-2017').strftime('%Y-%m-%dT%T')
      f.datetime_field(:joined_at, min: halloween).must_equal %Q{<input min="#{halloween}" class="form-input" type="datetime-local" name="user[joined_at]" id="user_joined_at" />}
    end
  end

  describe '#month_field' do
    it 'returns a input element with type="datetime-local", min="2017-08-31T00:00:00" and class="form-input"' do
      halloween = Date.parse('31-8-2017').strftime('%Y-%m')
      f.month_field(:birth_month, value: halloween).must_equal %Q{<input value="#{halloween}" class="form-input" type="month" name="user[birth_month]" id="user_birth_month" />}
    end
  end

  describe '#week_field' do
    it 'returns a input element with type="week", min="2017-08-31T00:00:00" and class="form-input"' do
      halloween = Date.parse('31-8-2017').strftime('%Y-W%V')
      f.week_field(:birth_week, value: halloween).must_equal %Q{<input value="#{halloween}" class="form-input" type="week" name="user[birth_week]" id="user_birth_week" />}
    end
  end

  describe '#time_field' do
    it 'returns a input element with type="time", min="01:00:00" and class="form-input"' do
      min = Time.now.strftime('%T.%L')
      halloween = Date.parse('31-8-2017').strftime('%T.%L')
      f.time_field(:joined_at, value: halloween, min: min).must_equal %Q{<input value="#{halloween}" min="#{min}" class="form-input" type="time" name="user[joined_at]" id="user_joined_at" />}
    end
  end

  describe '#color_field' do
    it 'returns a input element with type="color" and class="form-input"' do
      color = '#000000'
      f.color_field(:favorite_color, value: color).must_equal %Q{<input value="#{color}" class="form-input" type="color" name="user[favorite_color]" id="user_favorite_color" />}
    end
  end
end
