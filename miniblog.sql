-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 27. Mai 2022 um 15:13
-- Server-Version: 10.4.24-MariaDB
-- PHP-Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `miniblog`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_autoren`
--

CREATE TABLE `tbl_autoren` (
  `autor_id` int(11) NOT NULL,
  `autor_vorname` varchar(50) DEFAULT NULL,
  `autor_nachname` varchar(50) NOT NULL,
  `autor_email` varchar(100) NOT NULL,
  `autor_passwort` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_autoren`
--

INSERT INTO `tbl_autoren` (`autor_id`, `autor_vorname`, `autor_nachname`, `autor_email`, `autor_passwort`) VALUES
(1, 'Hamit', 'Yilmaz', 'hamit@yilmaz.istanbul', 'yilmaz'),
(2, 'Martin Luther', 'King', 'king@martin.de', 'martin'),
(3, 'Rene', 'Descartes', 'rene@descartes.frankreich', 'descartes'),
(4, 'Baybars', 'Vincent', 'baybars@vincent.de', 'baybars');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_kategorien`
--

CREATE TABLE `tbl_kategorien` (
  `kateg_id` int(11) NOT NULL,
  `kateg_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_kategorien`
--

INSERT INTO `tbl_kategorien` (`kateg_id`, `kateg_name`) VALUES
(1, 'Philosophie'),
(2, 'Leben');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_posts`
--

CREATE TABLE `tbl_posts` (
  `posts_id` int(11) NOT NULL,
  `posts_autor_id_ref` int(11) NOT NULL,
  `posts_kateg_id_ref` int(11) NOT NULL,
  `posts_titel` varchar(50) NOT NULL,
  `posts_inhalt` text NOT NULL,
  `posts_bild` varchar(100) NOT NULL,
  `posts_angelegt` datetime NOT NULL DEFAULT current_timestamp(),
  `posts_geaendert` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_posts`
--

INSERT INTO `tbl_posts` (`posts_id`, `posts_autor_id_ref`, `posts_kateg_id_ref`, `posts_titel`, `posts_inhalt`, `posts_bild`, `posts_angelegt`, `posts_geaendert`) VALUES
(1, 1, 2, 'Nur laufen am Tag?', 'Fakt ist: Viele Menschen bewegen sich zu wenig. Jetzt ist der richtige Zeitpunkt, um in ein aktiveres Leben zu starten! Wir haben uns mit Fitness-Profi Prof. Dr. Ingo Froböse darüber unterhalten, wie effektives Spazierengehen aussieht und welche Übungen eine gute Ergänzung dazu sind.\r\n\r\nEigentlich sind wir Menschen auf Bewegung ausgelegt. Doch viel zu oft hält uns der innere Schweinehund vom Training ab. Eine gute Alternative: Sanftes Training in Eigenregie.\r\nSpazierengehen hat positive Effekte auf den Körper\r\nSpazierengehen ist gesund, das belegen zahlreiche Studien. \"Man weiß inzwischen, dass Spaziergänger geringere Cholesterinwerte haben als Nicht-Spaziergänger\", erklärt der Sportwissenschaftler Prof. Dr. Ingo Froböse. Aber nicht nur das.\r\n\r\nWer regelmäßig spazieren geht, stärkt seine Muskeln, reduziert das Risiko für Herz-Kreislauf-Erkrankungen und viele andere chronische Krankheiten, mobilisiert das Immunsystem – und sogar der Nachtschlaf wird verbessert. Spazierengehen ist dann aber nicht mit gemütlichem Schlendern gleichzusetzen, sondern mit strammem Gehen.  ', 'bilder/leben.jpg', '2022-05-25 11:20:58', '2022-05-27 11:19:15'),
(2, 2, 1, 'Ich habe einen Traum', 'Ansprache während des Marsches auf Washington für Arbeitsplätze und Freiheit\r\n\r\n28. August 1963\r\nWashington, D.C.\r\n\r\nIch freue mich, dass ich mich diesem heutigen Ereignis anschließen kann, das in der Geschichte als größte Demonstration für Freiheit in der Geschichte unserer Nation vermerkt werden wird.\r\n\r\nVor einem Jahrhundert unterschrieb ein berühmter Amerikaner, in dessen symbolischen Schatten wir heute stehen, die Freiheitsproklamation. Dieser bedeutungsvolle Erlaß kam als heller Leitstern der Hoffnung zu Millionen von Negersklaven, die in den Flammen der vernichtenden Ungerechtigkeit versengt wurden. Er kam als ein freudiger Tagesanbruch am Ende der langen Nacht ihrer Gefangenschaft.\r\n\r\nAber einhundert Jahre später ist der Neger immer noch nicht frei. Einhundert Jahre später ist das Leben des Negers leider immer noch von den Handfesseln der Rassentrennung und den Ketten der Diskriminierung eingeschränkt. Einhundert Jahre später lebt der Neger immer noch auf einer einsamen Insel der Armut in der Mitte eines weiten, weiten Ozeans des materiellen Wohlstandes. Einhundert Jahre später vegetiert der Neger immer noch an den Rändern der amerikanischen Gesellschaft dahin und befindet sich im Exil in seinem eigenen Land.\r\n\r\nWir sind daher heute hierher gekommen, um diesen beschämenden Zustand zu dramatisieren. In diesem Sinn sind wir zur Hauptstadt unserer Nation gekommen, um einen Scheck einzulösen. Als die Architekten unserer Republik die grandiosen Worte der Verfassung und der Unabhängigkeitserklärung schrieben, unterzeichneten sie einen Schuldschein, dessen Erbe jeder Amerikaner sein sollte. Dieser Schuldschein war ein Versprechen, dass allen Menschen ja, schwarzen Menschen wie auch weißen Menschen die unveräußerlichen Rechte von Leben, Freiheit und dem Streben nach Glück garantiert wären.\r\n\r\nEs ist heute offensichtlich, dass Amerika diesem Schuldschein nicht eingelöst hat und zwar in Hinsicht auf seine farbigen Bürger. Amerika, anstatt diese heilige Verpflichtung zu honorieren, hat den Negern einen ungedeckten Scheck gegeben, einen Scheck, der mit dem Stempel ungenügende Deckung zurückgekommen ist. Wir weigern uns aber, daran zu glauben, dass die Bank der Gerechtigkeit bankrott ist. Wir weigern uns, daran zu glauben, dass es eine ungenügende Deckung in den großen Tresorräumen der Gerechtigkeit dieser Nation gibt. Wir sind daher hierher gekommen, um diesen Scheck einzulösen, einen Scheck, der uns auf Verlangen die Reichtümer der Freiheit und die Sicherheit auf Gerechtigkeit gewähren wird.\r\n\r\nWir sind auch zu diesem heiligen Ort gekommen, um Amerika an die dringlichen Forderungen der Gegenwart zu erinnern. Dies ist nicht die Zeit, sich den Luxus der Abkühlung zu gestatten oder das Beruhigungsmittel der Allmählichkeit einzunehmen. Es ist jetzt die Zeit, die Versprechen der Demokratie zu verwirklichen. Es ist jetzt die Zeit, sich aus dem dunklen und trostlosen Tal der Rassentrennung zum sonnenbestrahlten Pfad der Rassengerechtigkeit zu erheben. Es ist jetzt die Zeit, unsere Nation von den Treibsänden der rassistischen Ungerechtigkeit zum festen Felsen der Gemeinschaft aller Menschen zu erhöhen. Es ist jetzt die Zeit, die Gerechtigkeit zu einer Realität für alle Kinder Gottes zu machen. Es wäre tödlich für unsere Nation, die Dringlichkeit des Moments zu übersehen. Der heiße Sommer der berechtigten Unzufriedenheit der Neger wird nicht vorbeigehen, bis es einen belebenden Herbst der Freiheit und Gleichheit gibt.\r\n\r\nNeunzehnhundertdreiundsechzig ist kein Ende sondern ein Anfang. Diejenigen, die hoffen, dass der Neger nur Dampf ablassen muss und jetzt zufrieden sein wird, werden ein böses Erwachen haben, sollte die Nation zu seinen alten Methoden zurückkehren. Es wird weder Ruhe noch Frieden in Amerika geben, bis dem Neger seine Bürgerrechte gegeben werden. Die Wirbelstürme der Revolte werden weiterhin das Fundament unserer Nation schütteln, bin der helle Tag der Gerechtigkeit erscheint.\r\n\r\nEs gibt aber etwas, was ich meinen Brüdern sagen muss, die auf der abgenutzten Schwelle stehen, die zum Palast der Gerechtigkeit führt. Bei dem Prozess, den gerechten Platz zu erreichen, dürfen wir nicht ungerechter Taten schuldig werden. Versuchen wir nicht, unseren Durst nach Freiheit zufriedenzustellen, indem wir vom Becher der Bitterkeit und des Hasses trinken. Wir müssen unseren Kampf immer auf der hohen Ebene der Würde und Disziplin führen. Wir dürfen nicht erlauben, dass unser kreativer Protest in physische Gewalt degeneriert. Wir müssen uns immer wieder zu den majestätischen Höhen erheben und physische Gewalt mit der Macht der Seele konfrontieren. Die wunderbare neue Kampfbereitschaft, welche die Gemeinschaft der Neger umgibt, darf nicht zum Misstrauen von allen weißen Menschen führen. Viele unserer weißen Brüder, wie es sich durch ihre Anwesenheit hier zeigt, haben erkannt, dass ihr Schicksal mit unserem Schicksal verbunden ist. Sie haben auch erkannt, dass ihre Freiheit unentwirrbar mit unserer Freiheit verbunden ist. Wir können nicht alleine gehen. Während wir gehen, müssen wir ein Gelöbnis ablegen, dass wir immer weiter marschieren werden. Wir können nicht umkehren.\r\n\r\nEs gibt diejenigen, die die Anhänger des Bürgerrechts fragen: Wann werdet ihr zufrieden sein? Wir können niemals zufrieden sein, solange der Neger ein Opfer von unbeschreiblichen Grauenhaftigkeiten der Polizeigewalt ist. Wir können niemals zufrieden sein, solange unsere Körper, schwer von der Müdigkeit der Reise, keine Unterkunft in den Motels an den Autobahnen und in den Hotels der Städte finden. Wir können niemals zufrieden sein, solange die grundsätzliche Mobilität der Neger darin besteht, sich von einem kleineren Ghetto in ein größeres zu bewegen. Wir können niemals zufrieden sein, solange unsere Kinder ihres Selbstbewusstseins und ihrer Würde mit Schildern Nur für Weiße beraubt werden. Wir können niemals zufrieden sein, solange der Neger in Mississippi kein Wahlrecht hat und der Neger in New York überzeugt ist, dass er nichts hat, für das er wählen kann. Nein! Nein, wir sind nicht zufrieden, und wir werden nicht zufrieden sein, bis die Gerechtigkeit wie ein Gewässer und Rechtschaffenheit wie ein mächtiger Strom herunterquellen.\r\n\r\nIch bin mir dessen bewusst, dass einige von ihnen hierher aus großen problematischen und widerwärtigen Situationen gekommen sind. Einige von ihnen kommen gerade aus engen Gefängnissen. Einige von ihnen kommen aus Gegenden, wo ihre Suche nach Freiheit sie von den Stürmen der Verfolgung mißhandelt und von den Winden der Polizeigewalt zum Schwanken gebracht hat. Sie waren die Veteranen von schöpferischen Leiden. Arbeiten sie weiter mit dem Glauben, dass unverdientes Leiden erlösend ist. Gehen Sie zurück nach Mississippi! Gehen sie zurück nach Alabama! Gehen sie zurück nach South Carolina! Gehen sie zurück nach Georgia! Gehen sie zurück nach Louisiana! Gehen sie zurück zu den Slums und Ghettos unserer nördlichen Staaten und wissen sie, dass die Situation irgendwie geändert werden kann und wird. Wir werden nicht im Tal der Verzweiflung schweigen.\r\n\r\nDeswegen sage ich ihnen, meine Freunde, dass ich immer noch einen Traum habe, obwohl wir den Schwierigkeiten von heute und morgen entgegensehen. Es ist ein Traum, der seine Wurzel tief im amerikanischen Traum hat, dass sich diese Nation eines Tages sich erheben wird und der wahren Bedeutung seines Glaubensbekenntnisses, wir halten diese Wahrheiten als offensichtlich, dass alle Menschen gleich geschaffen sind, gerecht wird. Ich habe einen Traum, dass eines Tages die Söhne von früheren Sklaven und die Söhne von früheren Sklavenbesitzern auf den roten Hügeln von Georgia sich am Tisch der Bruderschaft gemeinsam niedersetzen können. Ich habe einen Traum, dass eines Tages selbst der Staat Mississippi, ein Staat, der mit der Hitze der Ungerechtigkeit und mit der Hitze der Unterdrückung schmort, zu einer Oase der Freiheit und Gerechtigkeit transformiert wird. Ich habe einen Traum, dass meine vier kleinen Kinder eines Tages in einer Nation leben werden, in der sie nicht wegen der Farbe ihrer Haut, sondern nach dem Wesen ihres Charakters beurteilt werden.\r\n\r\nICH HABE EINEN TRAUM!\r\n\r\nIch habe einen Traum, dass eines Tages unten in Alabama mit den brutalen Rassisten, mit einem Gouverneur, von dessen Lippen Worte der Einsprüche und Annullierungen tropfen dass eines Tages wirklich in Alabama kleine schwarze Jungen und Mädchen mit kleinen weißen Jungen und weißen Mädchen als Schwestern und Brüder Hände halten können.\r\n\r\nICH HABE EINEN TRAUM!\r\n\r\nIch habe einen Traum, dass eines Tages jedes Tal erhöht und jeder Hügel und Berg erniedrigt werden. Die unebenen Plätze werden flach und die gewundenen Plätze gerade, und die Herrlichkeit des Herrn soll offenbart werden und alles Fleisch miteinander wird es sehen. Dies ist unsere Hoffnung. Dies ist der Glaube, mit dem ich in den Süden zurückgehen werde. Mit diesem Glauben werden wir den Berg der Verzweiflung behauen, einen Stein der Hoffnung. Mit diesem Glauben werden wir gemeinsam arbeiten können, gemeinsam beten können, gemeinsam kämpfen können, gemeinsam in das Gefängnis gehen können, um gemeinsam einen Stand für Freiheit mit dem Wissen zu machen, dass wir eines Tages frei sein werden. Und dies wird der Tag sein. Dies wird der Tag sein, wenn alle Kinder Gottes mit neuer Bedeutung singen können: Mein Land, es ist über dir, süßes Land der Freiheit, über das ich singe, Land, wo mein Vater starb, Land des Pilgers Stolz, von jedem Berghang, lass die Glocken der Freiheit läuten. Wenn Amerika eine großartige Nation sein soll, dann muß dies wahr werden.\r\n\r\nLass daher die Glocken der Freiheit von den wunderbaren Hügeln von New Hampshires läuten. Lass die Glocken der Freiheit läuten von den mächtigen Bergen New Yorks. Lass die Glocken der Freiheit von den Höhen der Alleghenies in Pennsylvania läuten. Lass die Glocken von den schneebedeckten Gipfeln der Rockies in Colorado läuten. Lass die Glocken der Freiheit vom Lookout Mountain in Tennessee läuten. Lass die Glocken der Freiheit von jedem Hügel und Maulwurfshügel in Mississippi läuten. Von jedem Berghang lass die Glocken der Freiheit läuten.\r\n\r\nWenn dies geschieht, und wenn wir erlauben, dass die Glocken der Freiheit läuten und wenn wir sie von jedem Dorf und jedem Weiler, von jedem Staat und jeder Stadt läuten lassen, werden wir diesen Tag schneller erleben, wenn alle Kinder Gottes, schwarzer Mann und weißer Mann, Juden und Christen, Protestanten und Katholiken Hände halten können und die Worte des alten Neger-Spirituals Endlich frei, endlich frei. Danke Gott, Allmächtiger, endlich frei singen.', 'bilder/traum.jpg', '2022-05-25 11:29:37', '2022-05-27 11:18:54'),
(3, 3, 1, 'Cogito ergo sum ', 'Ich denke, also bin ich: Das steckt hinter dem Zitat\r\nDas Zitat „Ich denke, als bin ich“ – im Lateinischen: „Cogito, ergo sum“ – stammt vom Philosophen René Descartes. Dahinter verbirgt sich die grundlegende Annahme, dass alles, was der Mensch wahrnimmt, angezweifelt werden muss.\r\n\r\nDescartes geht davon aus, dass die Sinneswahrnehmungen des Menschen täuschen können. Nur weil der Mensch die Welt so sieht, wie er sie wahrnimmt, heißt nicht, dass die Welt tatsächlich auch so ist.\r\nDiese Argumentation kann als schlüssig gesehen werden: Häufig gibt es optische Täuschungen, die die Wirklichkeit verzerren. Außerdem gibt es genügend andere Individuen auf dieser Erde, die ihre Umgebung anders wahrnehmen als wir dies tun.\r\nNach Descartes könnten diese verzerrten Wahrnehmungen durch einen bösen Dämon verursacht sein, der bewusst versucht uns zu täuschen.\r\nDescartes kommt daher zum Ergebnis: „Um die Wahrheit zu finden, muss einmal im Leben an allem, soweit es möglich ist, gezweifelt werden.“\r\nAusgehend von der Prämisse, dass alles angezweifelt werden muss und nichts gewiss ist, kommt René Descartes zu einer weiteren Schlussfolgerung: Wenn wir alles anzweifeln, indem wir darüber nachdenken, kann dieser Zweifel nicht unecht sein – der Zweifel selbst muss echt sein.\r\nDer Zweifel selbst führt uns zu der Gewissheit, dass das Denken, das dem Zweifeln zugrunde liegt, echt sein muss. Und wenn das Denken, das den Zweifel verursacht, echt sein muss, dann muss auch ich selbst echt sein – schließlich bin ich für jenen Denkvorgang verantwortlich.\r\nDas Zitat „Ich denke, also bin ich“ und die damit einhergehende Argumentation zeigt also auf, dass sich der Mensch nicht gänzlich auf seine Wahrnehmung verlassen kann, sich aber seiner Existenz sicher sein kann – zumindest, solange er aktiv Dinge anzweifelt und darüber nachdenkt.', 'bilder/cogito.jpg', '2022-05-25 12:26:24', '2022-05-27 11:18:35'),
(4, 4, 2, 'Geheimnisse', 'Was bedeutet es, ein Geheimnis zu haben?\r\n\r\nUrsprünglich hatten wir angenommen, dass es nur dann kritisch wird, wenn wir in Situationen kommen, in denen das Geheimnis leicht offenbar werden könnte. Damit lagen wir falsch. Sondern es ist tatsächlich insgesamt schwierig und sehr ambivalent, mit einem Geheimnis zu leben. Probanden berichteten, dass ihnen Geheimnisse immer wieder in den Sinn kommen, sie ständig daran denken. Dies ist am häufigsten der Fall, wenn das Geheimnis als beschämend erlebt wird.\r\n\r\nZunächst haben wir festgestellt, dass jeder von uns mindestens ein Geheimnis hat. Im Durchschnitt sind es pro Person dreizehn, und davon teilen wir fünf mit niemandem. Bei den anderen acht gibt es zumindest eine Mitwisserin oder einen Mitwisser. Inhaltlich drehen sich Geheimnisse am häufigsten um unsere Beziehungen. So verraten Menschen nicht, dass sie unzufrieden sind mit dem Sex, sie verschweigen es, wenn sie fremdgehen oder wenn sie heimlich an Sex mit anderen denken, wenn sie gelogen oder Vertrauen verletzt haben. Darüber hinaus gibt es eine ganze Band­breite anderer Themen: Auch Hobbys, Süchte oder Konflikte mit dem Gesetz werden vertuscht – und manchmal sogar freudige Überraschungen für andere. Insgesamt haben wir fast alle Geheimnisse 38 thematischen Kategorien zuordnen können.  \r\nWas bedeutet es, ein Geheimnis zu haben?\r\n\r\nUrsprünglich hatten wir angenommen, dass es nur dann kritisch wird, wenn wir in Situationen kommen, in denen das Geheimnis leicht offenbar werden könnte. Damit lagen wir falsch. Sondern es ist tatsächlich insgesamt schwierig und sehr ambivalent, mit einem Geheimnis zu leben. Probanden berichteten, dass ihnen Geheimnisse immer wieder in den Sinn kommen, sie ständig daran denken. Dies ist am häufigsten der Fall, wenn das Geheimnis als beschämend erlebt wird.\r\n\r\nWarum ist das so belastend?\r\n\r\nGenerell kommt uns das Geheimnis einfach immer wieder in den Sinn, das zeigt ein Teil unserer Studien. Teilnehmerinnen berichteten uns, entweder ganz bewusst daran zu denken oder das Gegenteil zu tun, die Gedanken daran möglichst zu unterdrücken. Aber je intensiver man eine dieser beiden Strategien einsetzt, desto stärker wird die jeweils andere und desto häufiger wird das Grübeln über das Geheimnis. Es entwickelt sich ein Teufelskreis. Welche Strategie wir einsetzen, hängt von der persönlichen Bedeutung des Geheimnisses ab. Ist es uns wichtig, wollen wir uns immer wieder gedanklich damit beschäftigen. Ist es trivial, versuchen wir, die Gedanken daran zu unterdrücken.\r\n\r\nWarum halten wir Informationen über uns vor anderen geheim?\r\n\r\nIm Wesentlichen haben wir vier Gründe gefunden: Am häufigsten war der Wunsch, die eigene Reputation zu schüt­zen, also die Angst davor, nach der Offenlegung schlecht dazustehen und kritisiert zu werden. Dazu kommen der Wunsch danach, Konflikte zu vermeiden, die Beziehung nicht zu gefährden sowie das Streben nach Zugehörigkeit und Akzeptanz.\r\n\r\nWenn man ein lange gehütetes Geheimnis offenbaren will, wie geht man da am besten vor?\r\n\r\nEin günstiger Moment ist, wenn sich die Offenlegung ohnehin abzeichnet. Wenn man es aber nicht direkt der betroffenen Person sagen möchte, kann man eine dritte Person um Rat fragen. Die Erfahrung zeigt: Menschen sind hilfsbereiter, als man denkt. Manche Menschen leben jedoch sehr lange mit ihren Geheimnissen und gewöhnen sich daran. Dies wird allerdings im Lauf der Zeit schwieriger, gerade wenn man eine Geschichte vor dem Partner oder einem engen Freund geheim hält.', 'bilder/geheimnisse.jpg', '2022-05-25 12:26:24', '2022-05-27 11:52:49'),
(5, 1, 1, 'hallo', 'was geht ab ', 'hihi', '2022-05-27 13:23:05', '2022-05-27 13:23:05'),
(6, 2, 2, 'naja ', 'komm bitte nicht', 'es gibt keinen Pfad', '2022-05-27 13:25:43', '2022-05-27 13:25:43'),
(7, 2, 2, 'sher gut', 'diese seite ist sher gut geworden!', '', '2022-05-27 13:39:05', '2022-05-27 13:39:05');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_autoren`
--
ALTER TABLE `tbl_autoren`
  ADD PRIMARY KEY (`autor_id`),
  ADD UNIQUE KEY `autor_email` (`autor_email`);

--
-- Indizes für die Tabelle `tbl_kategorien`
--
ALTER TABLE `tbl_kategorien`
  ADD PRIMARY KEY (`kateg_id`);

--
-- Indizes für die Tabelle `tbl_posts`
--
ALTER TABLE `tbl_posts`
  ADD PRIMARY KEY (`posts_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_autoren`
--
ALTER TABLE `tbl_autoren`
  MODIFY `autor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `tbl_kategorien`
--
ALTER TABLE `tbl_kategorien`
  MODIFY `kateg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `tbl_posts`
--
ALTER TABLE `tbl_posts`
  MODIFY `posts_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
