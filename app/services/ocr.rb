class Ocr
  def self.extract_text(scan_path)
    require "google/cloud/vision"
    vision = Google::Cloud::Vision.image_annotator
    image = vision.text_detection(image: scan_path {:cosmetic_image})
    image.responses.first.text_annotations.first.description.split("\n").map(&:downcase).map(&:capitalize)
  end
end
