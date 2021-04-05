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
end