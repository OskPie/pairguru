class  TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    string = record.title

     if !brackets_validation?(string)
      record.errors.add(string, "has invalid title")
    end
  end

  def brackets_validation?(string)
    strim = string.gsub(/[^\[\]\(\)\{\}]/,'')
      return true if strim.empty?
      return false if strim.size.odd?
    loop do
      s = strim.gsub('()','').gsub('[]','').gsub('{}','')
      return true if s.empty?
      return false if s == strim
      strim = s
    end
  end
end
