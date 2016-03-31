require 'spec_helper'

RSpec.describe "when main page is loaded", :type => :feature, js: true do
  before(:each) do
      visit "http://top-emigration.com/emigraciya-v-canadu/"
      wait_for_ajax
  end

  context 'and user click any type of form' do
    it 'all page components are presence' do
      find_link('Вы бизнесмен?').click
      wait_for_ajax
      find(:xpath, "//label[@for='f1_q1_id1']").click # 3 месяца
      sleep 5
      # find_by_id('#f1_q1_id1').click # 3 месяца
      # page.choose('f1_q1_id2') # 6 месяцев
      # page.choose('f1_q1_id3') # 1 год
      # page.choose('f1_q1_id4') # 1,5-2 года
      # sleep 5
    end
  end

  context 'user can choose 1 of 3 types apllication forms' do
    it 'buisnessman form ' do
      find_link('Вы бизнесмен?').click
      wait_for_ajax
      expect('div.class#input_4')
    end
  end
end
