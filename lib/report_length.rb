def report_length(str)
  length = str.length
  unit = length == 1 ? 'character' : 'characters'
  "This string was #{length} #{unit} long."
end