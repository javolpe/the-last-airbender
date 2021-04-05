class AirbenderService
  def self.conn 
    Faraday.new(url: "https://last-airbender-api.herokuapp.com/api/v1/characters")
  end

  def self.total_members(nation)
    format_nation = nation.gsub('_', '+').titleize
    response = conn.get("?affiliation=#{format_nation}&perPage=100")
    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed.count
  end

  def self.first_25_members(nation)
    members = []
    format_nation = nation.gsub('_', '+').titleize
    response = conn.get("?affiliation=#{format_nation}&perPage=25")
    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed.map do |member|
      members << BasicInfo.new(member)
    end
    members
  end
end