class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    return self.genre.name if self.genre != nil
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name:name) if Genre.find_by(name:name) != nil
  end

  def artist_name
    return self.artist.name if self.artist != nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name:name)
  end

  def note_contents=(notes)
    notes.each do |content|
      if content != ''
        note = Note.create(content: content)
        self.notes << note
      end
    end
  end

  def note_contents
    notes_content = []
    self.notes.each do |note|
      notes_content << note.content
    end
    notes_content
  end

end
