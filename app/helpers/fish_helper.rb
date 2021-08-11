module FishHelper

        def index_header_location
        if @location 
            content_tag(:h1, "#{@location.city} Fish:")
        else 
            content_tag(:h1, "All of the Fish!")
        end
    end

    def new_header_location 
        if @location 
            content_tag(:h1, "Create #{@location.city} Fish:")
        else 
            content_tag(:h1, "Create Fish: ")
        end
    end
    def fields_for_location(f) 
        if @location 
        f.hidden_field :location_id, value: @location.id 
        else 
         render partial: "location_fields", locals: { f: f } 
        end 
   end
end
