require "uuidtools"

class Runner
  def self.generate_waveform(audio)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    filename = UUIDTools::UUID.random_create.to_s
    if system('ffmpeg -i "%s" -f wav "%s/tmp/waveform/%s.wav"' % [audio.file.path, Rails.root.to_s, filename])
      ActiveRecord::Base.logger.info("Converting mp3 to wav complete.")
      if system('waveform -W600 -H100 %s/tmp/waveform/%s.wav %s/tmp/waveform/%s.png' % [Rails.root.to_s, filename, Rails.root.to_s, filename])
        ActiveRecord::Base.logger.info("Generating waveform complete.")
        audio.wave = File.open("%s/tmp/waveform/%s.png" % [Rails.root.to_s, filename]);
        audio.save
      end
    else
      ActiveRecord::Base.logger.info("false")
    end
  end
end
