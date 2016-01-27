class Raindrops
  VERSION = 1

  def self.convert integer
    raindrop = ""
    raindrop.concat "Pling" if integer % 3 == 0
    raindrop.concat "Plang" if integer % 5 == 0
    raindrop.concat "Plong" if integer % 7 == 0

    raindrop.length > 0 ? raindrop : integer.to_s
  end

end