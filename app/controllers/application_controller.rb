class ApplicationController < ActionController::Base
  helper_method :update_counter
  
  def update_total_pages(max_per_page)
    total_dogs = Dog.all.count
    @total_pages = (total_dogs.to_f / max_per_page).ceil
  end

  def update_counter
    if !@img_counter || @img_counter == 2
      @img_counter = 0
    end

    @img_counter += 1

    return @img_counter
  end
end
