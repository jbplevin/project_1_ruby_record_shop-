class Artist
  attr_reader :id, :name, :profile

  def initialize options
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @profile = options['profile']
    @image = options['image']
  end

end
