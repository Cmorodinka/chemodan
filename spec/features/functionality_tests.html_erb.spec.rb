require 'spec_helper'

RSpec.describe "when main page is loaded", :type => :feature, js: true do
  before(:each) do
      visit "http://top-emigration.com/emigraciya-v-canadu/"
      wait_for_ajax
      { 1 => 'ВЫ БИЗНЕСМЕН?', 2 => 'ВЫ ВЫСОКООПЛАЧИВАЕМЫЙ ТОП-СПЕЦИАЛИСТ?', 3 => 'ВАШ ДОХОД СРЕДНИЙ ИЛИ НИЖЕ СРЕДНЕГО?'}.each{ |k, v|
        expect(find(:xpath, "//a[@href='#services'][#{k.to_i}]")).to have_content(v)
      }
  end

  context 'all page components is appear,' do
    it 'all page components for "Buisness" are presence' do # наличие всех элементов для опции Бизнесмен
      find_link('Вы бизнесмен?').click
      wait_for_ajax
      
      {'f1_q1_id1' => '3 мес', 'f1_q1_id2' => '6 мес', 'f1_q1_id3' => '1 год', 'f1_q1_id4' => '1.5 - 2 года'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f1_q2_id1' => 'Бизнес', 'f1_q2_id2' => 'Сохранение капитала', 'f1_q2_id3' => 'Дети и их будущее', 'f1_q2_id4' => 'Уверенность в будущем страны', 
        'f1_q2_id5' => 'Заработок', 'f1_q2_id6' => 'Социальная защищенность', 'f1_q2_id7' => 'Уровень культуры', 
        'f1_q2_id8' => 'Достойная работа и уважение к вам, как к специалисту'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f1_q3_id1' => 'Возможно', 'f1_q3_id2' => 'Не интересует'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f1_q4_id1' => 'Да', 'f1_q4_id2' => 'Нет'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f1_q5_id1' => 'Да', 'f1_q5_id2' => 'Нет', 'f1_q5_id3' => 'Не уверен'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f1_q6_id1' => 'Beginner, Elementary*', 'f1_q6_id2' => 'Intermediate (Pre/Up), Advanced*'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f1_q7_id1' => 'Да', 'f1_q7_id2' => 'Нет'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      expect(page).to have_selector("input[placeholder='Ваш e-mail для ответа адвоката *']")
      expect(page).to have_selector("input[placeholder='Ваше имя для обращения *']")
      expect(page).to have_selector('input[type="submit"]')
    end

    it 'all page components for "Top-employee" are presence' do # наличие всех элементов для опции Высокооплачиваемый специалист
      find_link('Вы высокооплачиваемый').click
      wait_for_ajax
      
      {'f2_q1_id1' => '3 мес', 'f2_q1_id2' => '6 мес', 'f2_q1_id3' => '1 год', 'f2_q1_id4' => '1.5 - 2 года'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f2_q2_id1' => 'Бизнес', 'f2_q2_id2' => 'Сохранение капитала', 'f2_q2_id3' => 'Дети и их будущее', 'f2_q2_id4' => 'Уверенность в будущем страны', 
        'f2_q2_id5' => 'Заработок', 'f2_q2_id6' => 'Социальная защищенность', 'f2_q2_id7' => 'Уровень культуры', 
        'f2_q2_id8' => 'Достойная работа и уважение к вам, как к специалисту'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f2_q3_id1' => 'Да', 'f2_q3_id2' => 'Нет'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f2_q4_id1' => 'Да', 'f2_q4_id2' => 'Нет', 'f2_q4_id3' => 'Не уверен'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f2_q6_id1' => 'Beginner, Elementary*', 'f2_q6_id2' => 'Intermediate (Pre/Up), Advanced*'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f2_q8_id1' => 'до 30', 'f2_q8_id2' => '30 - 40', 'f2_q8_id3' => '40 - 45', 'f2_q8_id4' => 'более 45*'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f2_q9_id1' => 'Да', 'f2_q9_id2' => 'Нет'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      expect(page).to have_selector("input[placeholder='Ваш e-mail для ответа адвоката *']")
      expect(page).to have_selector("input[placeholder='Ваше имя для обращения *']")
      expect(page).to have_selector('input[type="submit"]')
    end

    it 'all page components for "Low-qualified employee" are presence' do # наличие всех элементов для опции Ваш доход ниже среднего
      find_link('Ваш доход').click
      wait_for_ajax
      
      {'f3_q1_id1' => '3 мес', 'f3_q1_id2' => '6 мес', 'f3_q1_id3' => '1 год', 'f3_q1_id4' => '1.5 - 2 года'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f3_q2_id1' => 'Бизнес', 'f3_q2_id2' => 'Сохранение капитала', 'f3_q2_id3' => 'Дети и их будущее', 'f3_q2_id4' => 'Уверенность в будущем страны', 
        'f3_q2_id5' => 'Заработок', 'f3_q2_id6' => 'Социальная защищенность', 'f3_q2_id7' => 'Уровень культуры', 
        'f3_q2_id8' => 'Достойная работа и уважение к вам, как к специалисту'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f3_q3_id1' => 'Да', 'f3_q3_id2' => 'Нет'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f3_q6_id1' => 'Beginner, Elementary*', 'f3_q6_id2' => 'Intermediate (Pre/Up), Advanced*'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f3_q7_id1' => 'Да', 'f3_q7_id2' => 'Нет'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f3_q8_id1' => 'до 30', 'f3_q8_id2' => '30 - 40', 'f3_q8_id3' => '40 - 45', 'f3_q8_id4' => 'более 45*'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f3_q9_id1' => 'Да', 'f3_q9_id2' => 'Нет'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      expect(page).to have_selector("input[placeholder='Ваш e-mail для ответа адвоката *']")
      expect(page).to have_selector("input[placeholder='Ваше имя для обращения *']")
      expect(page).to have_selector('input[type="submit"]')
    end
  end

  context 'user can choose 1 of 3 types apllication forms' do
    it 'different combinations of "f*_q2_id*" changes their numbers' do
      find_link('Вы бизнесмен?').click
      wait_for_ajax
      find(:xpath, "//label[@for='f1_q1_id1']").click # 3 месяца
      uniq_numbers = ordered_uniq_rand_numbers(3, 1..8)
      p uniq_numbers
      random_buttons = []
      random_buttons <<  "//label[@for='f1_q2_id#{uniq_numbers[0]}']"
      random_buttons <<  "//label[@for='f1_q2_id#{uniq_numbers[1]}']"
      random_buttons <<  "//label[@for='f1_q2_id#{uniq_numbers[2]}']"
      p random_buttons
      random_buttons.each { |b| find(:xpath, b).click }
      (1..3).each { |i| page.should have_xpath(eval("random_buttons[#{i-1}]")+("//child::span[text()='#{i}']")) }
      sleep 5

    end

    it 'different types of filling "Buisness" form are works correct' do
      find_link('Вы бизнесмен?').click
      wait_for_ajax
      find(:xpath, "//label[@for='f1_q1_id1']").click # 3 месяца
            # find(:xpath, "//label[@for='f1_q1_id1']").click # 3 месяца
      # sleep 5

      # find_by_id('#f1_q1_id1').click # 3 месяца
      # page.choose('f1_q1_id2') # 6 месяцев
      # page.choose('f1_q1_id3') # 1 год
      # page.choose('f1_q1_id4') # 1,5-2 года
      # sleep 5
    end
  end
end
