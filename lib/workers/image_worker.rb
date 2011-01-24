file_path = File.join(RAILS_ROOT,'tmp','pids','image_worker.pid')
if File.exists?(file_path)
  raise "The image worker is already running."
  Process.exit
end
pid_file = File.open(file_path,"w")
pid_file.write(Process.pid)
pid_file.close
ActiveRecord::Base.logger = Logger.new('log/image_worker.log')
include Minion
job "image.upload" do |args|
  puts args["image_id"]
  post_image = ContentImageTmp.find(args["image_id"])
  post_image.move_to_s3
  {"image_id" => args["image_id"]}
end
job "image.process" do |args|
  puts args["image_id"]
  post_image = ContentImage.find(args["image_id"])
  post_image.regenerate_styles!
end
