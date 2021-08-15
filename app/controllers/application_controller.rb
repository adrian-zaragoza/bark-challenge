class ApplicationController < ActionController::Base
  # the helper method allows for the update counter method to be used in the views
  helper_method :update_counter

  # update total pages updates the total pages instance 
  def update_total_pages(max_per_page)
    total_dogs = Dog.all.count
    @total_pages = (total_dogs.to_f / max_per_page).ceil
  end

  # update counts the number of photos to be used for the ad image.
  def update_counter
    if !@img_counter || @img_counter == 2
      @img_counter = 0
    end

    @img_counter += 1
    return @img_counter
  end
end
