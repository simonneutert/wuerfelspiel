# Mehr über Klassen: http://wiki.ruby-portal.de/Klasse
class Player
  attr_accessor :money
  attr_reader :name, :winningnumbers, :handicap
  # Ruby initialisiert Klassen über diesen Befehl, den musst du dir merken ;)
  def initialize(name, money, winningnumbers, handicap)
    # Instanzvariablen (mit vorgestelltem "@")
    @name = name
    @winningnumbers = winningnumbers
    @handicap = handicap
    @money = money
  end
end
