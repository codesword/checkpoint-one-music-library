module Concerns::Findable
    def find_by_name name
      result = nil
      all.each do |item|
        if item.name == name
          result = item
        end
      end
      result
    end

    def find_or_create_by_name name
      if find_by_name(name)
        return find_by_name(name)
      else
        create(name)
      end
    end

end