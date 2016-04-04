module Defs  
  
  def ordered_uniq_rand_numbers (how_many, range)
    a = []
    while a.size < how_many do
      a << rand(range)
      a.uniq!
    end
    a.sort
  end

  # def name
  #   @name = Faker::Name.name
  # end

  def red_button     
  @button = "//label[@for='f1_q9_id#{rand(1..2)}']"
  find(:xpath, @button).click
    if @button == "//label[@for='f1_q9_id2']"
      2.times { page.driver.browser.switch_to.alert.accept 
        sleep 1}
      page.execute_script "window.close();"
      # page.driver.browser.switch_to.alert.accept
    else
      page.should have_no_xpath("//div[@class='text_red text_red_f1']") # проверка отсутствия div'a 'Если вы выбрали ячейки,..'
      expect(page).to have_button('Перейти к шагу №2', disabled: true)
    end
  end

end
