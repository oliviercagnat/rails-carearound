class Ocr
  def self.extract_text(file_path)
    require "google/cloud/vision"
    vision = Google::Cloud::Vision.image_annotator
    #image = vision.text_detection(image: Cloudinary::Utils.cloudinary_url(file_path))
    #image = vision.text_detection(image: Cloudinary::Api.update(open(file_path).read), :ocr => "adv_ocr"))
    image = vision.text_detection(image: URI.open(file_path))
    image.responses.first.text_annotations.first.description.split("\n").map(&:downcase).map(&:capitalize)
  end
end


#test url below
# image = vision.text_detection(image: "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1598299038-p427419-av-01-zoom.jpg?crop=0.667xw:1xh;center,top&resize=480:*")
    #result = $cloudinary->uploadApi()->upload(file_path, ["ocr" => "adv_ocr"]);
    #if($result["info"]["ocr"]["adv_ocr"]["status"] == "complete"){
     # $data = $result["info"]["ocr"]["adv_ocr"]["data"];
  #end
