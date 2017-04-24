class Icinga < Monitoring
  
  def evaluate_state(doc)
     @state = "State:#{doc.xpath("//*[@class=\"data table\"]").text}:" #if doc.xpath("//*[@class=\"data table\"]").children.first.text.include?("OK")
     logger.error("state is :#{doc.xpath("//*[@class=\"data table\"]").text.delete("\n").empty?}:")
  end
end
