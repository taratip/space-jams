class Album
  # Define your Album class here.

  attr_accessor :tracks
  attr_reader :id, :title, :artists

  def initialize(id, title, artists)
    @id = id
    @title = title
    @artists = artists
    @tracks = []
  end

  def summary
    summary_string = "Name: #{@title}\n"
    summary_string += "Artist(s): #{@artists}\n"
    summary_string += "Duration (min.): #{'%.2f' %duration_min}\n"
    summary_string += "Tracks: \n"
    summary_string += "#{track_summary}\n"
    summary_string
  end

  def duration_min
    total_duration = 0.0
    @tracks.each do |track|
      total_duration += track.duration_ms.to_i
    end
    total_duration/60000
  end

  def track_summary
    track_desc = ""
    @tracks.each do |track|
      track_desc += "- #{track.title}\n"
    end
    track_desc
  end
end
