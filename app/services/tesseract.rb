class Tesseract
  def self.extract_text(image_path)
    image = RTesseract.new(image_path)
    result = image.to_s
    a = result.split(/\n/).compact.select { |w| w.size > 0 }
  end


end
