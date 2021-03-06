require 'spec_helper'

RSpec.describe "when main page is loaded", :type => :feature, js: true do
  before(:each) do
    page.driver.browser.manage.window.maximize
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

      {'f1_q8_id1' => 'до 30', 'f1_q8_id2' => '30 - 40', 'f1_q8_id3' => '40 - 45', 'f1_q8_id4' => 'более 45*'}.each{ |k, v|
        expect(find(:xpath, "//label[@for='#{k}']")).to have_content(v)
      }

      {'f1_q9_id1' => 'Да', 'f1_q9_id2' => 'Нет'}.each{ |k, v|
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
    it 'different combinations of "f*_q2_id*" changes their numbers correct' do
      find_link('Вы бизнесмен?').click
      wait_for_ajax
      find(:xpath, "//label[@for='f1_q1_id#{rand(1..4)}']").click # рандомный выбор f1_q1_id*
      uniq_numbers = ordered_uniq_rand_numbers(3, 1..8)
      # p uniq_numbers
      random_buttons = []
      random_buttons <<  "//label[@for='f1_q2_id#{uniq_numbers[0]}']"
      random_buttons <<  "//label[@for='f1_q2_id#{uniq_numbers[1]}']"
      random_buttons <<  "//label[@for='f1_q2_id#{uniq_numbers[2]}']"
      # p random_buttons
      random_buttons.each { |b| find(:xpath, b).click }
      (1..3).each { |i| page.should have_xpath(eval("random_buttons[#{i-1}]")+("//child::span[text()='#{i}']")) }
      page.find(:xpath, random_buttons[0]).click # отжимаем кнопку №1
      page.should have_xpath(eval("random_buttons[1]")+("//child::span[text()='1']")) # кнопка №2 стала №1
      page.should have_xpath(eval("random_buttons[2]")+("//child::span[text()='2']")) # кнопка №3 стала №2
      page.find(:xpath, random_buttons[0]).click # включаем кнопку №1
      (1..3).each { |i| page.should have_xpath(eval("random_buttons[#{i-1}]")+("//child::span[text()='#{i}']")) }
      page.find(:xpath, random_buttons[1]).click # отжимаем кнопку №2
      page.should have_xpath(eval("random_buttons[2]")+("//child::span[text()='2']")) # кнопка №3 стала №2
      page.find(:xpath, random_buttons[2]).click # отжимаем кнопку №2 (бывшую №3)
      page.should have_no_xpath(eval("random_buttons[1]")+("//child::span[text()='2']")) # на странице отсутствует кнопка №2
      page.should have_no_xpath(eval("random_buttons[2]")+("//child::span[text()='3']")) # на странице отсутствует кнопка №3
      page.find(:xpath, random_buttons[0]).click # отжимаем кнопку №1
      page.should have_no_xpath(eval("random_buttons[0]")+("//child::span[text()='1']")) # на странице отсутствует кнопка №1
    end

    it 'different types of filling "Buisness" form are works correct' do
      find_link('Вы бизнесмен?').click
      wait_for_ajax
      find(:xpath, "//label[@for='f1_q1_id#{rand(1..4)}']").click 
      expect(page).to have_button('Перейти к шагу №2', disabled: true)
        uniq_numbers = ordered_uniq_rand_numbers(3, 1..8)
        random_buttons = []
        random_buttons <<  "//label[@for='f1_q2_id#{uniq_numbers[0]}']"
        random_buttons <<  "//label[@for='f1_q2_id#{uniq_numbers[1]}']"
        random_buttons <<  "//label[@for='f1_q2_id#{uniq_numbers[2]}']"
        random_buttons.each { |b| find(:xpath, b).click }
      expect(page).to have_button('Перейти к шагу №2', disabled: true)
      find(:xpath, "//label[@for='f1_q3_id#{rand(1..2)}']").click
      expect(page).to have_button('Перейти к шагу №2', disabled: true)
      find(:xpath, "//label[@for='f1_q4_id#{rand(1..2)}']").click
      expect(page).to have_button('Перейти к шагу №2', disabled: true)
      find(:xpath, "//label[@for='f1_q5_id#{rand(1..3)}']").click
      expect(page).to have_button('Перейти к шагу №2', disabled: true)
      find(:xpath, "//label[@for='f1_q6_id#{rand(1..2)}']").click
      expect(page).to have_button('Перейти к шагу №2', disabled: true)
      find(:xpath, "//label[@for='f1_q7_id#{rand(1..2)}']").click
      expect(page).to have_button('Перейти к шагу №2', disabled: true)
      find(:xpath, "//label[@for='f1_q8_id#{rand(1..4)}']").click
      expect(page).to have_button('Перейти к шагу №2', disabled: true)
      find(:xpath, "//label[@for='f1_q9_id1']").click

      # red_button

      # Непонятно ожидаемое поведение  формы при нажатии красной кнопки. Жду ответа разработчика. 
      # Пока что спек будет считать, что красная кнопка - это конец заполнения формы

      find(:css, "input[placeholder='Ваш e-mail для ответа адвоката *']").set('xx@xx.xx')
      expect(page).to have_button('Перейти к шагу №2', disabled: true)
      find(:css, "input[placeholder='Ваше имя для обращения *']").set(@name = Faker::Name.name)
      expect(page).to have_button('Перейти к шагу №2', disabled: false)
      find(:css, "input[type='submit']").click
      sleep 3
      find(:xpath, "//input[@value='#{@name}']").native.send_key(:backspace)
      sleep 1
      find(:xpath, "//input[@value='xx@xx.xx']").native.send_key(:backspace)
      sleep 1
      find(:xpath, "//input[@name='fs2_phone']").set(@phone = Faker::PhoneNumber.cell_phone)
      find(:xpath, "//input[@name='fs2_skype']").set(@skype = 'TestSkype')
      expect(page).to have_button('Перейти к указанию скайпа', disabled: true)
      find(:xpath, "//input[@name='fs2_country']").set(Faker::Address.country)
      find(:xpath, "//input[@name='fs2_country_2']").set(Faker::Address.country)
      find(:xpath, "//label[@for='fs2_q1_id#{rand(1..3)}']").click
      find(:xpath, "//label[@for='fs2_q2_id#{rand(1..5)}']").click
      find(:xpath, "//label[@for='fs2_q3_id#{rand(1..4)}']").click
      find(:xpath, "//input[@name='fs2_q4']").set(Faker::Number.between(1, 12))
      expect(page).to have_button('Перейти к указанию скайпа', disabled: true)
      ([5, 6]).each { |i| fill_in "fs2_q#{i}", with: Faker::Company.profession }
      fill_in "fs2_q7", with: Faker::Number.between(1, 30)
      # кнопка 'Перейти к указанию скайпа' стала активной
      expect(page).to have_button('Перейти к указанию скайпа', disabled: false)
      ([8, 10, 12, 14, 15]).each { |i| fill_in "fs2_q#{i}", with: Faker::Company.profession }
      ([9, 11, 13]).each { |i| fill_in "fs2_q#{i}", with: Faker::Number.between(1, 30) }
      ([8, 9, 10, 11, 12, 13, 14, 15]).each { |i| fill_in "fs2_q#{i}", with: '' } # проверка удаления в необязательных полях
      (16..25).each { |i| check("fs2_q#{i}") } # включить все чебоксы
      (16..25).each { |i| uncheck("fs2_q#{i}") } # выключить все чебоксы
      rand(0..9).times{ check("fs2_q#{rand(16..25)}") } # ранд. кол-во раз кликнуть ранд. чекбоксы
      find(:css, "input[type='submit']").click
      sleep 6
      expect(page).to have_xpath("//input[@value='#{@skype}']")
      find_button('Прошу скайп-встречу').click
      sleep 1
      expect(page).to have_content("Запрос отправлен!")
      expect(page).to have_no_xpath("//input[@value='#{@skype}']")
      expect(page).to have_no_selector('Прошу скайп-встречу')
      find(:css, "input[placeholder='Укажите свой электронный адрес']").set('11111111') # проверка валидации эмейла
      find_button('Прошу уведомлять').click
      expect(page).to have_content("Неправильный email адрес")
      find(:xpath, "//img[@src = 'https://login.sendpulse.com/img/delete.gif']").click
      sleep 1
      find(:css, "input[placeholder='Укажите свой электронный адрес']").set(Faker::Internet.email)
      find_button('Прошу уведомлять').click
      sleep 2
      expect(page).to have_content("Подтверждение подписки")
      find(:xpath, "//img[@src = 'https://login.sendpulse.com/img/delete.gif']").click
    end
  end
end
