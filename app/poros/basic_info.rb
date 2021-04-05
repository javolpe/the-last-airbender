class BasicInfo 
  attr_reader :id,
              :name,
              :allies,
              :enemies,
              :affiliation,
              :photo

  def initialize(data)
    @id = data[:_id]
    @name = data[:name]
    @allies = format_allies(data[:allies])
    @enemies = format_enemies(data[:enemies])
    @affiliation = data[:affiliation]
    @photo = data[:photoUrl]
  end

  def format_allies(allies)
    if allies.first.nil? 
      ["None"]
    else  
      allies
    end
  end

  def format_enemies(enemies)
    if enemies.first.nil? 
     enemies =  ["None"]
    else 
      enemies
    end
  end

  def format_affiliations(affiliation)
    if affiliation == ""
     ["None"]
    else 
      affiliations
    end
  end
end