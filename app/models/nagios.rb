class Nagios < Monitoring
  
  def evaluate_state(doc)
     @state = "ok" if doc.xpath("//*[@class=\"serviceOK\"]").children.first.text.include?("OK")
  end
end
