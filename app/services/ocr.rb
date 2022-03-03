class Ocr
  def self.extract_text(file_path)
    require "google/cloud/vision"
    vision = Google::Cloud::Vision.image_annotator
    image = vision.text_detection(image: Cloudinary::Utils.cloudinary_url(file_path.key))
    image.responses.first.text_annotations.first.description.split("\n").map(&:downcase).map(&:capitalize)
  end
end
