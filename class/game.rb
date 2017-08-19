# Mehr über Klassen: http://wiki.ruby-portal.de/Klasse
class Game
  attr_accessor :currentround
  attr_reader :commitment

  # Ruby initialisiert Klassen über diesen Befehl, den musst du dir merken ;)
  # hier werden die Parameter bei der Initiierung übergeben und
  # in sogenannten Instanzvariablen (mit vorgestelltem "@") gespeichert.
  def initialize(commitment, player1, player2)
    @currentround = 1
    @commitment = commitment.to_f
    # mit der Übergabe der Player Instanzen an Instanzvariablen eines Gameobjekts
    # kann auf die Player Objekte zugegriffen werden, ohne die Objekte ständig in die
    # Methoden des Game Objekts übergeben zu müssen ;)
    @player1 = player1
    @player2 = player2
  end

  def check_money
    # überprüft den Kontostand der Spieler
    # BEACHTE:
    # @player1 ist die Instanz player1 in einer Instanz von Game.
    # @player1 = player1 der in "app.rb" initiiert wurde.

    # Haben beide Spieler genug Geld?
    if @player1.money > @commitment && @player2.money > @commitment
      cash_in_commitment
    else
      # falls nicht wird die game_over Methode aufgerufen
      return
    end
  end

  def cash_in_commitment
    # Der Einsatz wird vom Kontostand der Spieler abgezogen.
    @player1.money = @player1.money - @commitment
    @player2.money = @player2.money - @commitment
    # nun kann gewürfelt werden
    roll_dice
  end

  def roll_dice
    # Die Augen der Würfels werden als Array abgebildet
    # eine zufällige Zahl wird "gezogen"
    # sample: https://ruby-doc.org/core-2.2.0/Array.html#method-i-sample
    dice = [1, 2, 3, 4, 5, 6].sample
    # alternative: dice = (1..6).to_a.sample

    # Prüfe die gewürfelte Augenzahl gegen die definierten Gewinnnummern der Spieler.
    # winningnumbers wurde über attr_reader & initialize der Klasse Player vorgegeben
    if @player1.winningnumbers.include?(dice) # include: https://ruby-doc.org/core-2.2.0/String.html#method-i-include-3F
      # rufe player_wins Methode auf und übergib die Spieler als Parameter, je nachdem wer gewonnen oder verloren hat.
      player_wins(winner = @player1, loser = @player2)
    elsif @player2.winningnumbers.include?(dice)
      player_wins(winner = @player2, loser = @player1)
    end
  end

  def player_wins(winner, loser)
    # (2.0 * @commitment * winner.handicap)
    # bedeutet: 2 Spieler * Einsatz * prozentuale Gewinnverteilung
    #
    # "winner" und "loser" stehen stellv. für die Instanzen der Player
    # da in der Klasse Player attr_accessor :money definiert wurde
    # kann das Attribut "money" bearbeitet werden.
    # Der Zustand der Objektinstanz ändert sich durch die Bearbeitung eines Attributs.
    winner.money = (winner.money + (2.0 * @commitment * winner.handicap)).round(2)
    loser.money = (loser.money + (2.0 * @commitment * (1.0 - winner.handicap))).round(2)
  end

  def game_over(currentround = nil)
    # wurde keine currentround übergeben, wird currentround "nil" gesetzt.
    # nil: https://ruby-doc.org/core-2.2.0/NilClass.html
    puts "Das Spiel endet nach Runde: #{@currentround}"
    # bevor "exit" das Programm beendet, werden die Namen der Spieler und deren Kontostände ausgegeben.
    puts @player1.name + ': ' + @player1.money.to_s
    puts @player2.name + ': ' + @player2.money.to_s
    puts "#{"_"*30}\n\n"
    exit
  end
end
