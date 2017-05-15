# Ziel dieses Projekts
* Simulation von 100 Würfelrunden
* Verständnis für OOP vermitteln
* Spass beim Coden haben

_Die Aufgabenstellung soll als Beispielübung für objektorientierte Programmierung in Ruby dienen._

# (Original) Aufgabenstellung:
[Quelle: trainyourprogrammer.de #ruby #116](https://trainyourprogrammer.de/index.pl?page=ruby&seite=2#for_scrollposition)
## Das Würfelspiel
Du hast einen spielsüchtigen Mitbürger getroffen, nennen wir ihn _den Banker_. Nach einiger Zeit schlägt dir der Banker ein einfaches Würfelspiel vor:
* du gewinnst, wenn eine gerade Zahl fällt.
* Er gewinnt bei einer ungeraden Zahl.

Du erwiderst, dass du an einem solchen Spiel - bei dem die Chancen 50/50 stehen - kein Interesse hast.

Der Banker bleibt hartnäckig. Er bietet dir an, dass du auch gewinnst, wenn eine Eins gewürfelt wird. Hiermit bist du einverstanden, denn deine Chancen sind mit 4 zu 2 wesentlich besser.

Der Banker fügt hinzu: "Mir ist natürlich klar, dass Du in diesem Fall die bessere Position hast. Als Ausgleich bekommst du im Falle eines Gewinnes nur 4 von 6 Anteilen des Einsatzes ausgezahlt, der Rest geht an mich."

Du erwiderst: "Na, dann geht es wieder ums Glück. Ich habe kein Interesse."

Der Banker bleibt am Ball: "Okay, gewinnt deine Augenzahl, bekommst du nicht nur 4/6, sondern sogar 70 % des Einsatzes. Diesen kleinen Nachteil werde ich mit meinem glücklicheren Händchen wieder ausgleichen."
Es scheint dir plausibel und das Spiel beginnt.

**Ist die Aussage des Bankers wahr, dass du mit 70 % (leicht) im Vorteil bist?**

Zur Beantwortung der Frage führt ein experimenteller und ein theoretischer Weg. Hier soll ein Experiment (Simulation) den Sachverhalt klären:
  * beide Spieler starten mit 100 €
  * der Einsatz bei jeder Runde beträgt 1 €
  * gespielt werden 100 Würfe (keine negativen Werte möglich)



**Wer ist tatsächlich im Vorteil? Hat dich der Banker übers Ohr gehauen?**

**Liebst du Ruby? Ruby liebt dich!**

# Hä?
  Spiel starten:

  `$ ruby app.rb rounds=100 commitment=1`
