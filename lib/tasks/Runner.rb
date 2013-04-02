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
      if system('waveform -W950 -H100 %s/tmp/waveform/%s.wav %s/tmp/waveform/%s.png' % [Rails.root.to_s, filename, Rails.root.to_s, filename])
        ActiveRecord::Base.logger.info("Generating waveform complete.")
        audio.wave = File.open("%s/tmp/waveform/%s.png" % [Rails.root.to_s, filename]);
        audio.save
      end
    else
      ActiveRecord::Base.logger.info("false")
    end
  end
  
  def self.process(clip)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    filename = UUIDTools::UUID.random_create.to_s
    path = ""
    if clip != nil
      path = clip.file.path
    else
      raise "Process Exception: no file to process"
    end
    
     if system('ffmpeg -i "%s" -f wav "%s/tmp/waveform/%s.wav"' % [path, Rails.root.to_s, filename])
        ActiveRecord::Base.logger.info("Converting mp3 to wav complete.")
        if system('waveform -W950 -H100 %s/tmp/waveform/%s.wav %s/tmp/waveform/%s.png' % [Rails.root.to_s, filename, Rails.root.to_s, filename])
          ActiveRecord::Base.logger.info("Generating waveform complete.")
          clip.wave = File.open("%s/tmp/waveform/%s.png" % [Rails.root.to_s, filename]);
          #if system('ffmpeg -b 192k -i "%s" -f mp3 "%s/tmp/waveform/%s.mp3"' % [path, Rails.root.to_s, filename])
            #clip.file = File.open("%s/tmp/waveform/%s.mp3" % [Rails.root.to_s, filename]);
            clip.save
          #end
        end
     else
        ActiveRecord::Base.logger.info("false")
     end
  end
  
end
