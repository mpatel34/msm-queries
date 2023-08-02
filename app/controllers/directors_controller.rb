class DirectorsController < ApplicationController
  def index
    render({:template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({:id => the_id})

    @the_director = matching_records.at(0)

    render({:template => "director_templates/details"})
  end

  def youngest

    directors_list_ordered = Director.all.order ({:dob => :desc})
    
    @youngest = directors_list_ordered.at(0)

    render({:template => "director_templates/youngest"})
  end


  def oldest

    directors_list_ordered = Director.all.order ({:dob => :asc})
    
    @oldest = directors_list_ordered.at(0)

    render({:template => "director_templates/oldest"})
  end
  

end
