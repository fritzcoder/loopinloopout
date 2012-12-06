require "uuidtools"

class Runner
  def self.generate_waveform(audio)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    filename = UUIDTools::UUID.random_create.to_s
    ActiveRecord::Base.logger.info(audio.audio)
    path = ""
    if audio.audio != nil 
      path = audio.file.path
    elsif audio.preview != nil
      path = audio.preview.path
    else
      raise "Runner Exception: no file to process waveform"
    end
    
    if system('ffmpeg -i "%s" -f wav "%s/tmp/waveform/%s.wav"' % [path, Rails.root.to_s, filename])
      ActiveRecord::Base.logger.info("Converting mp3 to wav complete.")
      if system('waveform -W800 -H50 %s/tmp/waveform/%s.wav %s/tmp/waveform/%s.png' % [Rails.root.to_s, filename, Rails.root.to_s, filename])
        ActiveRecord::Base.logger.info("Generating waveform complete.")
        audio.wave = File.open("%s/tmp/waveform/%s.png" % [Rails.root.to_s, filename]);
        audio.save
      end
    else
      ActiveRecord::Base.logger.info("false")
    end
  end
end
