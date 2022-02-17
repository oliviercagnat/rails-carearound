class Tesseract
  def self.extract_text(image_path)
    image = RTesseract.new(image_path)
    result = image.to_s
    a = result.split(/\n/).compact.select { |w| w.size > 0 }
    cleared_a = []
    a.each { |e| cleared_a << e if e.match(/\w/) }
    cleared_a
  end
end
