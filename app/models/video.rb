class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  has_attached_file :video, styles: {
    :medium => {
      :geometry => "640x480",
      :format => 'mp4'
    },
    :thumb => { 
    	:geometry => "160x120", 
    	:format => 'jpeg', 
    	:time => 10}
  }, :processors => [:transcoder]

 validates_attachment_presence :video
 validates_attachment_size :video, :less_than => 100.megabytes
 validates_attachment_content_type :video, :content_type => ['video/mp4']


end
