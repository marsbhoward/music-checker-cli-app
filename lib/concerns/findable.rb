module Concerns::Findable
  def find_by_name(title)
    all.detect{ |o| o.title == title }
  end

  def find_or_create_by_name(title)
    find_by_name(name) || create(title)
  end
end
