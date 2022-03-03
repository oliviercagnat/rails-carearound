class Ocr
  def self.extract_text(file_path)
    require "google/cloud/vision"
    vision = Google::Cloud::Vision.image_annotator
    image = vision.text_detection(image: Cloudinary::Utils.cloudinary_url(file_path.key))
    #image = vision.text_detection(image: Cloudinary::Api.update(file_path.key, :ocr => "adv_ocr"))
    image.responses.first.text_annotations.first.description.split("\n").map(&:downcase).map(&:capitalize)
  end
end

#test url below
# image = vision.text_detection(image: "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1598299038-p427419-av-01-zoom.jpg?crop=0.667xw:1xh;center,top&resize=480:*")
