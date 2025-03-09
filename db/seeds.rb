require 'soda/client'
require 'json'

client = SODA::Client.new({
  domain: "data.cityofnewyork.us",
  app_token: ENV["NYC_OPEN_DATA_APP_TOKEN"].strip
})

puts "Fetching GreenThumb Garden Info from NYC Open Data..."

begin
  response = client.get("p78i-pat6", { "$limit" => 5000 })
  
  # Check if the response body is already an Array or a String
  gardens_data = if response.respond_to?(:body) && response.body.is_a?(String)
                   JSON.parse(response.body)
                 elsif response.respond_to?(:body)
                   response.body
                 else
                   response
                 end

  puts "Fetched #{gardens_data.size} records from the API."
rescue StandardError => e
  puts "Error fetching data: #{e.message}"
  exit
end

puts "Seeding garden records..."

gardens_data.each_with_index do |record, index|
  begin
    Garden.create!(
        assemblydist:       record["assemblydist"] ? record["assemblydist"].to_i : nil,
        address:            record["address"],
        borough:            record["borough"],
        communityboard:     record["communityboard"] ? record["communityboard"].to_i : nil,
        congressionaldist:  record["congressionaldist"] ? record["congressionaldist"].to_i : nil,
        coundist:           record["coundist"] ? record["coundist"].to_i : nil,
        gardenname:         record["gardenname"],
        juris:              record["juris"],
        multipolygon:       record["multipolygon"].is_a?(String) ? record["multipolygon"] : record["multipolygon"].to_json,
        openhrsf:           record["openhrsf"],
        openhrsm:           record["openhrsm"],
        openhrssa:          record["openhrssa"],
        openhrssu:          record["openhrssu"],
        openhrsth:          record["openhrsth"],
        openhrstu:          record["openhrstu"],
        openhrsw:           record["openhrsw"],
        parksid:            record["parksid"],
        policeprecinct:     record["policeprecinct"],
        statesenatedist:    record["statesenatedist"] ? record["statesenatedist"].to_i : nil,
        status:             record["status"],
        zipcode:            record["zipcode"]
      )      
    puts "Seeded garden ##{index + 1}: #{record['gardenname']}"
  rescue StandardError => e
    puts "Error seeding record ##{index + 1} (#{record['gardenname']}): #{e.message}"
  end
end

puts "Seeding complete!"
