# folgende Argumente können an das Programm übergeben werden: rounds, commitment
# $ ruby app.rb rounds=100 commitment=1

# lade Dateien in das (Haupt-)Programm:
# in diesem Beispiel wurden die Klassen ausgelagert
# require_relative lädt sie zurück in die Hauptfile.
# So behält man bei komplexen Programmen die Übersicht.
require_relative 'class/player'
require_relative 'class/game'

def play_game(rounds, commitment)
  # die Spieler werden erstellt (siehe: class/player.rb)
  player1 = Player.new(name = 'Dr. Watson', money = 100.00, winningnumbers = [1, 2, 4, 6], handicap = 0.7)
  player2 = Player.new(name = 'Sherlock Holmes', money = 100.00, winningnumbers = [3, 5], handicap = 1.00)

  # Instanz von Game wird erstellt (siehe: class/game.rb)
  # und die zuvor erstellten Spieler als Parameter übergeben
  game_instance = Game.new(commitment, player1, player2)
  puts "#{"_"*30}\n\n"
  puts "Gespielt werden maximal #{rounds} Runden.\nDer Einsatz beträgt #{commitment} Euro."
  puts "#{"_"*30}\n\n"

  # Zähl- oder primäre Abbruchlogiken (hier: Rundenzahl und Geld) sollten außerhalb
  # der betreffenden Objekte (hier: Game/Player) durchgeführt werden:
  # https://www.google.de/search?q=ruby+stack+level+too+deep
  while player1.money > commitment && player2.money > commitment && game_instance.currentround < rounds
    # für die Objektinstanz "game_one" wird die Methode "check_money" aufgerufen
    # schau in die Klasse um zu sehen was passiert!
    game_instance.check_money
    # beende die Runde mit einem erhöhten Spielrundenzähler
    game_instance.currentround += 1
  end
  # ist das Abbruchkriterium der while-Schleife erreicht,
  # wird für das Spiel die Methode game_over aufgerufen.
  game_instance.game_over
end

# Standardparameter beim Start ohne Argumente
# 100 Runden, 1 Euro je Spieler je Spiel
def main(rounds=100, commitment=1)
  # falls Argumente beim Start des Spiels übergeben wurden, wird deren Gültigkeit geprüft.
  # "ARGV", das sind die Argumente beim Aufruf des Skripts als Array.
  # https://ruby-doc.org/core-2.4.1/Object.html#ARGV
  # $ ruby app.rb rounds=10 commitment=1
  # => ARGV === ["rounds=10", "commitment=1"]
  if ARGV.any?
    ARGV.each do |a|
      case # http://ruby-doc.org/core-2.4.1/doc/syntax/control_expressions_rdoc.html#label-case+Expression
      when a.include?("rounds=") # include: https://ruby-doc.org/core-2.2.0/String.html#method-i-include-3F
        rounds = a.split('=')[1].to_i # split: https://ruby-doc.org/core-2.2.0/String.html#method-i-split
      when a.include?('commitment=')
        commitment = a.split('=')[1].to_i # to_i: http://ruby-doc.org/core-2.0.0/String.html#method-i-to_i
      end
    end
  end
  play_game(rounds, commitment)
end

# Start der Ausführung
main
