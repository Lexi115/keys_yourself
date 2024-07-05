-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 05, 2024 at 04:27 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tsw`
--

-- --------------------------------------------------------

--
-- Table structure for table `generi`
--

CREATE TABLE `generi` (
  `id` int NOT NULL,
  `nome` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `generi`
--

INSERT INTO `generi` (`id`, `nome`) VALUES
(204, 'Azione'),
(205, 'Avventura'),
(206, 'RPG'),
(207, 'Sport'),
(208, 'Sparatutto'),
(209, 'Strategia'),
(210, 'Puzzle'),
(211, 'Piattaforma'),
(212, 'Simulazione'),
(213, 'Gestionale'),
(214, 'Horror'),
(215, 'Survival'),
(216, 'Fantasy'),
(217, 'FPS'),
(218, 'TPS'),
(219, 'MMORPG'),
(220, 'Casual'),
(221, 'Indie'),
(222, 'Racing'),
(223, 'Fighting'),
(224, 'Musica'),
(225, 'Party'),
(226, 'Educational'),
(227, 'Open-world'),
(228, 'Sci-fi'),
(229, 'Fantascienza'),
(230, 'Rompicapo'),
(231, 'Arcade'),
(232, 'Stealth'),
(233, 'Mondo aperto');

-- --------------------------------------------------------

--
-- Table structure for table `giochi`
--

CREATE TABLE `giochi` (
  `id` int NOT NULL,
  `nome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `descrizione` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `produttore` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `giochi`
--

INSERT INTO `giochi` (`id`, `nome`, `prezzo`, `descrizione`, `produttore`) VALUES
(4, 'Cyberpunk 2077', '59.99', 'Esplora Night City, una megalopoli ossessionata dal potere, dal glamour e dalla modifica del corpo.', 'CD Projekt Red'),
(6, 'Minecraft', '9.99', 'Un gioco di creatività e sopravvivenza che ti permette di costruire e esplorare mondi infiniti.', 'Mojang'),
(7, 'FIFA 22', '59.99', 'Il simulatore di calcio più famoso al mondo con nuove funzionalità e modalità di gioco.', 'Electronic Arts'),
(8, 'NBA 2K22', '59.99', 'Vivi l\'esperienza dell\'NBA con una grafica mozzafiato e una modalità carriera coinvolgente.', '2K Sports'),
(9, 'The Legend of Zelda: Breath of the Wild', '59.99', 'Esplora il vasto regno di Hyrule in questa avventura epica.', 'Nintendo'),
(10, 'Super Mario Odyssey', '49.99', 'Un viaggio mozzafiato attraverso mondi straordinari e colorati.', 'Nintendo'),
(11, 'Pokémon Spada e Scudo', '19.99', 'Esplora la regione di Galar e cattura Pokémon in questa avventura RPG.', 'Nintendo'),
(12, 'Halo Infinite', '7.99', 'Torna a combattere il Brute Chief e scopri i segreti del nuovo Anello Halo.', '343 Industries'),
(13, 'Death Stranding', '49.99', 'Consegna pacchi in un mondo post-apocalittico, cercando di ricostruire la società.', 'Kojima Productions'),
(14, 'Ghost of Tsushima', '49.99', 'Diventa il leggendario samurai Jin Sakai in questo emozionante gioco d\'avventura.', 'Sucker Punch Productions'),
(15, 'Overwatch', '9.99', 'Un colorato sparatutto in prima persona in cui i giocatori si uniscono in squadre per combattere.', 'Blizzard Entertainment'),
(16, 'The Elder Scrolls V: Skyrim', '29.99', 'Esplora un vasto mondo di fantasy e scopri le sue profondità e i suoi segreti.', 'Bethesda Game Studios'),
(17, 'Dark Souls III', '15.99', 'Sfida la morte in questo avvincente gioco di ruolo d\'azione, noto per la sua difficoltà estrema.', 'FromSoftware'),
(18, 'The Last of Us Part II', '49.99', 'Esplora un mondo post-apocalittico e affronta sfide emotive in questa avventura epica.', 'Naughty Dog'),
(19, 'Animal Crossing: New Horizons', '59.99', 'Scappa alla tua isola deserta e crea una nuova vita in questo rilassante simulatore di vita.', 'Nintendo'),
(20, 'Resident Evil 3', '4.99', 'Un remake dell\'originale, affronta l\'orrore della città di Raccoon durante lo scoppio della epidemia del T-virus.', 'Capcom'),
(21, 'Resident Evil 4', '9.99', 'Leon S. Kennedy si trova a fronteggiare un\'insurrezione di orrori, in cerca della figlia del presidente rapita.', 'Capcom'),
(22, 'Resident Evil 5', '19.99', 'Insieme a Chris Redfield e Sheva Alomar affronta una minaccia bioterroristica in Africa.', 'Capcom'),
(24, 'Resident Evil 7: Biohazard', '29.99', 'In prima persona, affronta il terrore nella casa della famiglia Baker con protagonisti nuovi personaggi.', 'Capcom'),
(25, 'Resident Evil: Village', '59.99', 'Un nuovo capitolo della serie, in un villaggio abitato da creature orribili, mentre Chris Redfield svolge un', 'Cap'),
(26, 'FIFA 23', '59.99', 'Il nuovo capitolo della celebre serie di giochi di calcio con miglioramenti grafici e nuove modalità di gioco.', 'Electronic Arts'),
(27, 'Final Fantasy XVI', '6.99', 'Esplora un mondo di fantasy ricco di avventure, magia e intrighi politici in questo nuovo capitolo della serie.', 'Square Enix'),
(28, 'God of War Ragnarok', '59.99', 'Accompagna Kratos e Atreus in un viaggio epico attraverso i regni nordici mentre affrontano creature mitologiche e dèi.', 'Santa Monica Studio'),
(29, 'Horizon Forbidden West', '59.99', 'Esplora le terre selvagge e pericolose dell\'America post-apocalittica mentre Aloy cerca di salvare il mondo dalla distruzione.', 'Guerrilla Games'),
(30, 'Elden Ring', '59.99', 'Esplora un mondo fantasy oscuro e pieno di pericoli mentre cerchi l\'anello spezzato per salvare la terra.', 'FromSoftware'),
(31, 'Starfield', '59.99', 'Preparati per un viaggio epico nell\'universo Bethesda in questo nuovo gioco di ruolo e avventura spaziale.', 'Bethesda Game Studios'),
(32, 'Battlefield 2042', '8.99', 'Entra nella guerra del futuro con una vasta gamma di veicoli, armi e mappe dinamiche.', 'Electronic Arts'),
(33, 'Spider-Man 2', '59.99', 'Torna a vestire i panni di Spider-Man in questo nuovo capitolo della serie, affrontando nuovi nemici e sfide.', 'Insomniac Games'),
(34, 'The Sims 5', '12.99', 'Crea la tua vita virtuale e controlla ogni aspetto della vita dei tuoi Sims in questo nuovo e migliorato simulatore di vita.', 'Electronic Arts'),
(35, 'Forza Horizon 5', '59.99', 'Esplora il vasto paesaggio messicano in questo coinvolgente gioco di guida open-world.', 'Turn 10 Studios'),
(36, 'Diablo IV', '59.99', 'Affronta il male in questo nuovo capitolo della serie Diablo, esplorando un mondo oscuro e pericoloso.', 'Blizzard Entertainment'),
(37, 'Gotham Knights', '59.99', 'Proteggi Gotham City come Batman o uno dei suoi alleati nel combattimento contro il crimine in questo nuovo gioco d\'azione e avventura.', 'WB Games Montreal'),
(38, 'The Elder Scrolls VI', '59.99', 'Preparati per un altro viaggio epico nell\'immaginario mondo di Tamriel in questo nuovo capitolo della serie.', 'Bethesda Game Studios'),
(39, 'Dead Space', '19.99', 'Esplora una stazione spaziale infestata da orrori indicibili in questo remake del classico gioco survival horror.', 'Motive Studios'),
(40, 'Hogwarts Legacy', '59.99', 'Esplora la magica scuola di magia di Hogwarts e il mondo circostante in questo nuovo gioco di ruolo basato sul mondo di Harry Potter.', 'Portkey Games'),
(41, 'Far Cry 6', '59.99', 'Affronta un dittatore spietato e la sua violenta dittatura in questo nuovo capitolo della serie Far Cry, ambientato in un\'isola dei Caraibi.', 'Ubisoft'),
(42, 'Bayonetta 3', '59.99', 'Unisciti a Bayonetta in questo nuovo capitolo della serie, affrontando creature demoniache con stile e grazia.', 'PlatinumGames'),
(43, 'Baldur\'s Gate III', '59.99', 'Esplora un vasto mondo fantasy in questo nuovo capitolo della serie Baldur\'s Gate, pieno di avventure e misteri.', 'Larian Studios'),
(44, 'Deathloop', '4.99', 'Sopravvivi a cicli temporali mortali in questo innovativo gioco d\'azione e avventura di Arkane Studios.', 'Arkane Studios'),
(45, 'Rainbow Six Quarantine', '59.99', 'Combatti contro creature parassite in questo sparatutto tattico cooperativo basato sull\'universo di Rainbow Six.', 'Ubisoft'),
(46, 'Hollow Knight: Silksong', '19.99', 'Unisciti a Hornet in questo nuovo capitolo della serie Hollow Knight, esplorando nuovi mondi e affrontando nuovi nemici.', 'Team Cherry'),
(47, 'Suicide Squad: Kill the Justice League', '0.99', 'Unisciti al Suicide Squad in questo gioco d\'azione e avventura, dove devi fermare la Justice League diventata malvagia.', 'Rocksteady Studios'),
(48, 'Star Wars Jedi: Fallen Order 2', '59.99', 'Torna a vestire i panni di un Jedi in questa epica avventura nel mondo di Star Wars, piena di azione e misteri.', 'Respawn Entertainment');

-- --------------------------------------------------------

--
-- Table structure for table `giochi_acquistati`
--

CREATE TABLE `giochi_acquistati` (
  `id_ordine` int NOT NULL,
  `gioco` int DEFAULT NULL,
  `nome_gioco` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `codice_gioco` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `giochi_acquistati`
--

INSERT INTO `giochi_acquistati` (`id_ordine`, `gioco`, `nome_gioco`, `codice_gioco`) VALUES
(32, 47, 'Suicide Squad: Kill the Justice League', 'CUEZ-1GKT-A2LW-LH1S'),
(32, 6, 'Minecraft', '28N3-HYRL-5I67-OBB5'),
(32, 45, 'Rainbow Six Quarantine', 'QMS6-B19F-Q63S-URJ4'),
(32, 46, 'Hollow Knight: Silksong', 'C66P-MUVN-9RGN-0B8H'),
(32, 12, 'Halo Infinite', 'QK77-DTWU-FFF5-IRII'),
(33, 39, 'Dead Space', '2WSF-5TPI-NLN7-2MSW'),
(34, 32, 'Battlefield 2042', 'Y8DR-QV46-M03I-JBZT'),
(35, 9, 'The Legend of Zelda: Breath of the Wild', 'XN4U-2M3A-XNLL-MCYK'),
(36, 12, 'Halo Infinite', 'RL50-ZPUQ-J0HR-PNUF'),
(36, 40, 'Hogwarts Legacy', 'J88B-1JI7-YU4M-8WX4'),
(36, 8, 'NBA 2K22', 'FG28-9KLQ-NQX2-1Z8P'),
(37, 7, 'FIFA 22', 'TYVF-46V9-MXVM-CCG4'),
(38, 4, 'Cyberpunk 2077', 'XBTS-01NW-OZAO-8ODQ'),
(38, 6, 'Minecraft', 'P2GR-BHR8-8PRO-RZC6'),
(39, 21, 'Resident Evil 4', 'FJK6-KO2B-L4PM-BZ2X'),
(40, 36, 'Diablo IV', 'BUV0-QILD-IK9E-98V4'),
(41, 28, 'God of War Ragnarok', 'SL1P-AIUT-0QPQ-GRJK'),
(41, 26, 'FIFA 23', 'RW14-2NVX-8MQ1-5ALC'),
(42, 7, 'FIFA 22', 'YVZ7-7U7C-VQ0T-HUY9'),
(43, 15, 'Overwatch', '9JEQ-Q89C-FN27-Z9K1'),
(43, 14, 'Ghost of Tsushima', 'Y026-DOQV-S3N3-QQTX'),
(44, 47, 'Suicide Squad: Kill the Justice League', 'JVSC-ADZY-TGWI-TCY0'),
(45, 42, 'Bayonetta 3', 'MB7F-D3VQ-TV8D-4Y6X'),
(45, 46, 'Hollow Knight: Silksong', 'R8BA-4784-FQX0-11EE'),
(46, 38, 'The Elder Scrolls VI', 'WJ1W-7Y27-2056-8UC6'),
(46, 27, 'Final Fantasy XVI', 'DP4Q-FYR9-COBJ-V7XA'),
(46, 10, 'Super Mario Odyssey', 'ZS2G-YL8M-E5FU-S2TZ'),
(47, 28, 'God of War Ragnarok', 'LN7A-AGYZ-YOPZ-X4K3'),
(48, 22, 'Resident Evil 5', '436R-GVPN-D9O1-KY32'),
(48, 15, 'Overwatch', 'LKSH-LBIS-DN56-IIGK'),
(49, 32, 'Battlefield 2042', 'FF96-6AZT-XV3E-56YH'),
(49, 46, 'Hollow Knight: Silksong', 'IIT4-VF0I-T1SI-YDK5'),
(50, 20, 'Resident Evil 3', '3HIS-4ARL-VG3J-HVR2'),
(50, 36, 'Diablo IV', '1XH1-510Y-65YS-1DAY'),
(50, 15, 'Overwatch', 'ZXQT-XAF7-IS6N-9UKR'),
(51, 13, 'Death Stranding', '6ER8-LJTM-1ARF-PIRD'),
(51, 11, 'Pokémon Spada e Scudo', 'RU2L-F2EC-E5Y9-YG8Q'),
(52, 14, 'Ghost of Tsushima', 'ZB31-2M72-GMR1-MOJ0'),
(52, 29, 'Horizon Forbidden West', '1GJD-4HNQ-SRRQ-3TI9'),
(52, 19, 'Animal Crossing: New Horizons', 'RLFC-6ZFE-FTSO-E5A4');

-- --------------------------------------------------------

--
-- Table structure for table `giochi_generi`
--

CREATE TABLE `giochi_generi` (
  `gioco` int NOT NULL,
  `genere` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `giochi_generi`
--

INSERT INTO `giochi_generi` (`gioco`, `genere`) VALUES
(4, 204),
(9, 204),
(14, 204),
(18, 204),
(20, 204),
(21, 204),
(22, 204),
(24, 204),
(25, 204),
(27, 204),
(28, 204),
(29, 204),
(30, 204),
(31, 204),
(32, 204),
(37, 204),
(38, 204),
(41, 204),
(44, 204),
(45, 204),
(47, 204),
(48, 204),
(6, 205),
(9, 205),
(10, 205),
(13, 205),
(14, 205),
(16, 205),
(18, 205),
(27, 205),
(28, 205),
(29, 205),
(30, 205),
(31, 205),
(33, 205),
(35, 205),
(36, 205),
(38, 205),
(39, 205),
(40, 205),
(41, 205),
(42, 205),
(43, 205),
(46, 205),
(47, 205),
(48, 205),
(4, 206),
(16, 206),
(17, 206),
(27, 206),
(30, 206),
(36, 206),
(40, 206),
(42, 206),
(43, 206),
(46, 206),
(48, 206),
(7, 207),
(8, 207),
(26, 207),
(35, 207),
(12, 208),
(15, 208),
(20, 208),
(21, 208),
(22, 208),
(24, 208),
(25, 208),
(31, 208),
(32, 208),
(39, 208),
(41, 208),
(44, 208),
(45, 208),
(26, 209),
(33, 209),
(36, 209),
(42, 209),
(43, 209),
(19, 210),
(28, 210),
(38, 210),
(40, 210),
(43, 210),
(44, 210),
(46, 210),
(10, 211),
(33, 211),
(46, 211),
(48, 211),
(26, 212),
(31, 212),
(32, 212),
(34, 212),
(35, 212),
(34, 213),
(18, 214),
(20, 214),
(21, 214),
(22, 214),
(24, 214),
(25, 214),
(39, 214),
(45, 214),
(6, 215),
(9, 215),
(17, 215),
(18, 215),
(20, 215),
(21, 215),
(22, 215),
(24, 215),
(25, 215),
(39, 215),
(41, 215),
(11, 216),
(16, 216),
(17, 216),
(27, 216),
(28, 216),
(30, 216),
(36, 216),
(37, 216),
(38, 216),
(40, 216),
(42, 216),
(43, 216),
(48, 216),
(12, 217),
(15, 217),
(31, 217),
(32, 217),
(41, 217),
(44, 217),
(45, 217),
(15, 218),
(29, 218),
(39, 218),
(36, 219),
(38, 219),
(7, 220),
(8, 220),
(10, 220),
(11, 220),
(19, 220),
(29, 220),
(33, 220),
(34, 220),
(37, 221),
(43, 221),
(46, 221),
(35, 222),
(6, 226),
(19, 226),
(6, 227),
(9, 227),
(10, 227),
(11, 227),
(13, 227),
(29, 227),
(30, 227),
(31, 227),
(33, 227),
(35, 227),
(38, 227),
(41, 227),
(43, 227),
(4, 228),
(12, 228),
(39, 228),
(44, 228),
(45, 228),
(48, 228);

-- --------------------------------------------------------

--
-- Table structure for table `ordini`
--

CREATE TABLE `ordini` (
  `id` int NOT NULL,
  `utente` int DEFAULT NULL,
  `nome` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cognome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `indirizzo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `citta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `regione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cap` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stato` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data_acquisto` date NOT NULL,
  `prezzo` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordini`
--

INSERT INTO `ordini` (`id`, `utente`, `nome`, `cognome`, `email`, `telefono`, `indirizzo`, `citta`, `regione`, `cap`, `stato`, `data_acquisto`, `prezzo`) VALUES
(32, 83, 'Antonio', 'Ceruso', 'b@b.it', '+390468799984', 'Via Boh', 'Idk', 'Campania', '84098', 'Mercato San Severino', '2024-07-05', '98.95'),
(33, 85, 'Giulia', 'Bianchi', 'giulia.bianchi2@mail.com', '+393312345671', 'Via Milano, 2', 'Milano', 'Lombardia', '00010', 'Italia', '2024-07-05', '19.99'),
(34, 82, 'Annachiara', 'Gerofalo', 'annachiara@email.com', '+393838383838', 'Via Domodossola 12', 'Chieti', 'Abruzzo', '12345', 'Italia', '2024-07-05', '8.99'),
(35, 85, 'Giulia', 'Bianchi', 'giulia.bianchi2@mail.com', '+393312345671', 'Via Milano, 2', 'Milano', 'Lombardia', '00010', 'Italia', '2024-07-05', '59.99'),
(36, 107, 'Ilaria', 'Bianchi', 'ilaria.bianchi24@mail.com', '+393312345693', 'Via Lecce, 24', 'Lecce', 'Puglia', '53423', 'Italia', '2024-07-05', '127.97'),
(37, 107, 'Ilaria', 'Bianchi', 'ilaria.bianchi24@mail.com', '+393312345693', 'Via Lecce, 24', 'Lecce', 'Puglia', '34525', 'Italia', '2024-07-05', '59.99'),
(38, 114, 'Matteo', 'Rossi', 'matteo.rossi31@mail.com', '+393312345700', 'Via Varese, 31', 'Varese', 'Lombardia', '23132', 'Italia', '2024-07-05', '69.98'),
(39, 114, 'Matteo', 'Rossi', 'matteo.rossi31@mail.com', '+393312345700', 'Via Varese, 31', 'Varese', 'Lombardia', '32432', 'Italia', '2024-07-05', '9.99'),
(40, 114, 'Matteo', 'Rossi', 'matteo.rossi31@mail.com', '+393312345700', 'Via Varese, 31', 'Varese', 'Lombardia', '32453', 'Italia', '2024-07-05', '59.99'),
(41, 124, 'Francesco', 'Verdi', 'francesco.verdi41@mail.com', '+393312345710', 'Via Pisa, 41', 'Pisa', 'Toscana', '45654', 'Italia', '2024-07-05', '119.98'),
(42, 82, 'Annachiara', 'Gerofalo', 'annachiara@email.com', '+393838383838', 'Via Domodossola 12', 'Villers-devant-orval', 'Bruxelles', '68231', 'Belgio', '2024-07-05', '59.99'),
(43, 124, 'Francesco', 'Verdi', 'francesco.verdi41@mail.com', '+393312345710', 'Via Pisa, 41, Pisa', 'Pisa', 'Toscana', '43545', 'Italia', '2024-07-05', '59.98'),
(44, 129, 'Ludovica', 'Neri', 'ludovica.neri46@mail.com', '+393312345715', 'Via Oristano, 46', 'Oristano', 'Sardegna', '32454', 'Italia', '2024-07-05', '0.99'),
(45, 133, 'Stefania', 'Neri', 'stefania.neri50@mail.com', '+393312345719', 'Via Olbia, 50', 'Olbia', 'Sardegna', '32478', 'Italia', '2024-07-05', '79.98'),
(46, 82, 'Annachiara', 'Gerofalo', 'annachiara@email.com', '+393838383838', 'Via Domodossola 12', 'Milano', 'Lombardia', '10203', 'Italia', '2024-07-05', '116.97'),
(47, 106, 'Alessio', 'Rossi', 'alessio.rossi23@mail.com', '+393312345692', 'Via Rimini, 23', 'Rimini', 'Emilia Romagna', '56754', 'Italia', '2024-07-05', '59.99'),
(48, -1, 'Dario', 'Lezzo', 'dariolezzo@gmail.com', '+393893783526', 'Via Dario Lezzi 39', 'Modena', 'Emilia Romagna', '43534', 'Italia', '2024-07-05', '29.98'),
(49, 97, 'Elisa', 'Neri', 'elisa.neri14@mail.com', '+393312345683', 'Via Modena, 14', 'Modena', 'Emilia Romagna', '34587', 'Italia', '2024-07-05', '28.98'),
(50, 121, 'Sabrina', 'Neri', 'sabrina.neri38@mail.com', '+393312345707', 'Via Pavia, 38, Pavia', 'Florenville', 'Magia', '00000', 'Italia', '2024-07-05', '74.97'),
(51, 121, 'Sabrina', 'Neri', 'sabrina.neri38@mail.com', '+393312345707', 'Via Pavia, 38, Pavia', 'Pavia', 'Lombardia', '93012', 'Cina', '2024-07-05', '69.98'),
(52, 121, 'Sabrina', 'Neri', 'sabrina.neri38@mail.com', '+393312345707', 'Via Pavia, 38', 'Pavia', 'Lombardia', '02019', 'Italia', '2024-07-05', '169.97');

-- --------------------------------------------------------

--
-- Table structure for table `ruoli`
--

CREATE TABLE `ruoli` (
  `id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nome_ruolo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ruoli`
--

INSERT INTO `ruoli` (`id`, `nome_ruolo`) VALUES
('0', 'utente'),
('1', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `utenti`
--

CREATE TABLE `utenti` (
  `uid` int NOT NULL,
  `email` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nome` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cognome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `indirizzo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ruolo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'default',
  `auth_token` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utenti`
--

INSERT INTO `utenti` (`uid`, `email`, `password`, `nome`, `cognome`, `indirizzo`, `telefono`, `ruolo`, `auth_token`) VALUES
(75, 'ciao@ciao', 'b133a0c0e9bee3be20163d2ad31d6248db292aa6dcb1ee087a2aa50e0fc75ae2', 'ggg', 'gigi', 'waddawawd', '42342342', '0', '49eac2a51955ae67df6cfe5cdc21056079d70edac8b0e88cd8774d8ad5cc312a'),
(76, 'admin@admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin', 'admin', '23', '23423', '1', 'b5ba93bc7e7ea74a20ad433d9932f44fdbccf1c72ad40e17f49ad821fe2c5b76'),
(82, 'annachiara@email.com', '1e403b8bc8bbee528960835de4a16e6efe5e4782faaa928815f9c6929d9f2c7b', 'Annachiara', 'Gerofalo', 'Via Domodossola 12', '+393838383838', '0', 'e9785eaac6c8954672065c5ccf27f9b6b61c537fbbc713e328665ffd238b798f'),
(83, 'b@b.it', 'cb1018298c947740ebdfd24bbfaf1cac6b2b15637cd9e67f00517913ae1fbdb6', 'Antonio', 'Ceruso', 'Via Rossi', '+391231231232', '0', 'b25792af704d72700e4f26a9b01683936789ee391064bf5af7809d3c285eba58'),
(84, 'mario.rossi1@mail.com', 'f9843c1ce42046f9f600c20a71a48e8eb26b5ec5c117bedf75b7cd52adb31d1b', 'Mario', 'Rossi', 'Via Roma, 1, Roma', '+393312345670', '0', 'edcd5d258e73ba620a8b399aece23acfc06fa552abab16938e62af76fd6c7555'),
(85, 'giulia.bianchi2@mail.com', '1f706087ab2e59df53ebfbb5ce3c8989d6fff3f65af5e47d344dedbd3d678d65', 'Giulia', 'Bianchi', 'Via Milano, 2, Milano', '+393312345671', '0', '49345b4d9d98c41b04614fc1868f1d8c0c94753add9efa511e2eefc747401b3e'),
(86, 'luca.verdi3@mail.com', '91d9c021561b11e8e815419463b3e79111583b2f4cd405296762e2ba02c9435d', 'Luca', 'Verdi', 'Via Napoli, 3, Napoli', '+393312345672', '0', NULL),
(87, 'laura.neri4@mail.com', '4700e9e5f4b70945b6e8522191f837c7e3b5cdedcb08b9bde7a782c8bcf65197', 'Laura', 'Neri', 'Via Torino, 4, Torino', '+393312345673', '0', NULL),
(88, 'alessandro.gialli5@mail.com', 'e699249ba1aca4d9b1db48a55a28d99c58cedaaef320edbf7608eb4cb5f359de', 'Alessandro', 'Gialli', 'Via Firenze, 5, Firenze', '+393312345674', '0', NULL),
(89, 'federica.marroni6@mail.com', '84523b8780a9f2177e9c9862d0a8d5c41dda83d347d543cee5f6f336197a0fc3', 'Federica', 'Marroni', 'Via Bologna, 6, Bologna', '+393312345675', '0', NULL),
(90, 'andrea.rossi7@mail.com', '1d3b2213a00f339a23b2cc9fb133a5207da83420e0e03815dd3612748e0acc4e', 'Andrea', 'Rossi', 'Via Venezia, 7, Venezia', '+393312345676', '0', NULL),
(91, 'chiara.bianchi8@mail.com', '4aa95bf4720f143b7092c588b3ece19b5fb01831069317a05bc97c636f78e4ae', 'Chiara', 'Bianchi', 'Via Verona, 8, Verona', '+393312345677', '0', NULL),
(92, 'simone.verdi9@mail.com', '0ee065821f348f42e5b415a6bf4b469940dd5509492e464fdab1a458b0032aa6', 'Simone', 'Verdi', 'Via Genova, 9, Genova', '+393312345678', '0', NULL),
(93, 'sara.neri10@mail.com', '3cb7874549cf648d26917b04cdae2d6579c80a6b3f722d8d272b79d19cbd1d20', 'Sara', 'Neri', 'Via Trieste, 10, Trieste', '+393312345679', '0', NULL),
(94, 'marco.rossi11@mail.com', '09a69d240e602cadbac20b266b7dff9c76b4aa57602758b5d8f613d3781de407', 'Marco', 'Rossi', 'Via Palermo, 11, Palermo', '+393312345680', '0', NULL),
(95, 'francesca.bianchi12@mail.com', 'a194c3522e11db4da1acf7d3df20c96416857a0c4a1989167f9a1442a1551e00', 'Francesca', 'Bianchi', 'Via Bari, 12, Bari', '+393312345681', '0', NULL),
(96, 'davide.verdi13@mail.com', '9d0f7c22454919bbd585a2e86e878886c66e8b38cf52bd5cd52be7a6643321b3', 'Davide', 'Verdi', 'Via Parma, 13, Parma', '+393312345682', '0', NULL),
(97, 'elisa.neri14@mail.com', 'c72c844529832c28f95d306ba672c3bf8b31cb81365ba6424c7aebec6faea664', 'Elisa', 'Neri', 'Via Modena, 14, Modena', '+393312345683', '0', 'adb69da4e37c33662c2e1fb4f3b60c55c5d4e26df01b03321a34fffdc34f72a3'),
(98, 'fabio.rossi15@mail.com', '7393bb9eba2da703c5ec274d266b822b84299a0ef958d424a6f9294d788fcc3e', 'Fabio', 'Rossi', 'Via Livorno, 15, Livorno', '+393312345684', '0', NULL),
(99, 'valentina.bianchi16@mail.com', '06cde9f5777ec1b8b1d89b20149aaa71bb229e9dcce117452b749862b5d9cd90', 'Valentina', 'Bianchi', 'Via Catania, 16, Catania', '+393312345685', '0', NULL),
(100, 'riccardo.verdi17@mail.com', '6100999cb7c38461bd783784cf3c92b032742337a74c744dc7064f9a6ba59ff8', 'Riccardo', 'Verdi', 'Via Prato, 17, Prato', '+393312345686', '0', NULL),
(101, 'anna.neri18@mail.com', 'eddce887f694122e67bf31acd816924e85b2ffb9b482e5c734d18b82f364d22d', 'Anna', 'Neri', 'Via Latina, 18, Latina', '+393312345687', '0', NULL),
(102, 'giuseppe.rossi19@mail.com', '56a75be62b29f49fff0ee5b85f9a83f0c75e63ba32f16a27b8302331024fe0ba', 'Giuseppe', 'Rossi', 'Via Salerno, 19, Salerno', '+393312345688', '0', NULL),
(103, 'martina.bianchi20@mail.com', 'cbbbf4e427b83b00671278f6817ae1bf331b7ef39bb0001b868ac4f8df9a563a', 'Martina', 'Bianchi', 'Via Siena, 20, Siena', '+393312345689', '0', NULL),
(104, 'stefano.verdi21@mail.com', '86a930f921f0d82cf5243be0a1254ea879e999a65cfdc47b4334e6847e143359', 'Stefano', 'Verdi', 'Via Terni, 21, Terni', '+393312345690', '0', NULL),
(105, 'federica.neri22@mail.com', '11d33948b6c2bab9c6de1cc744536b34c862c3fe60e58338e284c0f1021bb02e', 'Federica', 'Neri', 'Via Ferrara, 22, Ferrara', '+393312345691', '0', NULL),
(106, 'alessio.rossi23@mail.com', '79936fd1a425c19d3b62241c30634515a88e4a28cf27dbcb718a5787cc961243', 'Alessio', 'Rossi', 'Via Rimini, 23, Rimini', '+393312345692', '0', 'eaa6290f31af638c90b9e1d8dbe02728936edbd9698c83894b8cbfe12c2564f9'),
(107, 'ilaria.bianchi24@mail.com', '43863383e5aba4c59ae50900e276e5b8c6d3c462d24069b16a2b2caaa1b2367f', 'Ilaria', 'Bianchi', 'Via Lecce, 24, Lecce', '+393312345693', '0', '27cd7bfd92df832403c57d3872e8a0e30a0dc5c82bd2ca6670c18a92ea44aadc'),
(108, 'emanuele.verdi25@mail.com', '5905b1177d50dee8abdfc590605945400182152d973ad390726edcb479d7dfcf', 'Emanuele', 'Verdi', 'Via Trento, 25, Trento', '+393312345694', '0', NULL),
(109, 'beatrice.neri26@mail.com', 'e3e9f5402960a4fb108009eadcaa2fae4e8ea4f3810b25f3e307c80b15fd7d0b', 'Beatrice', 'Neri', 'Via Bolzano, 26, Bolzano', '+393312345695', '0', NULL),
(110, 'michele.rossi27@mail.com', '5e540560eda0a6ce44208ab7429c893a7a382207a0a4e74136609a0f1afcce81', 'Michele', 'Rossi', 'Via Ancona, 27, Ancona', '+393312345696', '0', NULL),
(111, 'sofia.bianchi28@mail.com', 'e1b00ae265b43c5ef0ccc23500bc5b3a4848b5218d115086d555def714afb926', 'Sofia', 'Bianchi', 'Via Treviso, 28, Treviso', '+393312345697', '0', NULL),
(112, 'lorenzo.verdi29@mail.com', '37548851565db974457880c5430f7621f1a6945e361b01ae4798a7be744bf4db', 'Lorenzo', 'Verdi', 'Via Belluno, 29, Belluno', '+393312345698', '0', NULL),
(113, 'arianna.neri30@mail.com', '8e999d87b864ee0260df5053ff4e32243d4c3e3fa79bf83ee57661c9d65c7a38', 'Arianna', 'Neri', 'Via Gorizia, 30, Gorizia', '+393312345699', '0', NULL),
(114, 'matteo.rossi31@mail.com', 'fdbe50b831391b0f13bd66f7833418a5cc4a890972478e34b4505df2e3d2a125', 'Matteo', 'Rossi', 'Via Varese, 31, Varese', '+393312345700', '0', '49953344aa20a5301210bce0d1b7bfc05436310772f5560d31a56d76f339e0d1'),
(115, 'alessandra.bianchi32@mail.com', '2e3cf34138e373ffe71c446db1798e392f3cd8fa5ca632aea37740984a511271', 'Alessandra', 'Bianchi', 'Via Aosta, 32, Aosta', '+393312345701', '0', NULL),
(116, 'giovanni.verdi33@mail.com', '56e1f3250d73ea697f8b2ff30e70e419a60ec940c3aae73b4f248a2dd81daa89', 'Giovanni', 'Verdi', 'Via Biella, 33, Biella', '+393312345702', '0', NULL),
(117, 'giorgia.neri34@mail.com', '998f0ab6aee5e86e2f5f3c1271196203c0dc56262db92f27a507a79c4d0c75e8', 'Giorgia', 'Neri', 'Via Como, 34, Como', '+393312345703', '0', NULL),
(118, 'daniele.rossi35@mail.com', '10dff443722a3c19a82a58fd1fc97ec2e796304435d624d4eec493d3d0a543d8', 'Daniele', 'Rossi', 'Via Udine, 35, Udine', '+393312345704', '0', NULL),
(119, 'marta.bianchi36@mail.com', '763202bb87dd7a941211d18a5af561967a970b2bb6479d0705ea1ade73638a3c', 'Marta', 'Bianchi', 'Via Bari, 36, Bari', '+393312345705', '0', NULL),
(120, 'gabriele.verdi37@mail.com', 'eb2bf633a148f9c71a63148b239efd6e3c894f0df70da92f29393aeb4fc39d87', 'Gabriele', 'Verdi', 'Via Lodi, 37, Lodi', '+393312345706', '0', NULL),
(121, 'sabrina.neri38@mail.com', 'b14e00719d9efdb3e28cfb98945aed79fabe05e51558dd0d2b3ec613db5c1675', 'Sabrina', 'Neri', 'Via Pavia, 38, Pavia', '+393312345707', '0', '8e58e8ed4da59c1a53d6082992c9d080cff674e7ba5b07199f5b0d87d074906a'),
(122, 'roberto.rossi39@mail.com', '415c840fe4efd486ec5bb49b8fad05fe25b6325f8aac825521ff3f0fb21dc174', 'Roberto', 'Rossi', 'Via Latina, 39, Latina', '+393312345708', '0', NULL),
(123, 'giada.bianchi40@mail.com', 'e7f5fd6565d45b401de7d0c8fa1db7650898e64d25f9dcb15f674078067c2758', 'Giada', 'Bianchi', 'Via Asti, 40, Asti', '+393312345709', '0', NULL),
(124, 'francesco.verdi41@mail.com', 'f9c7f2c48b0738d76a26ce3a26fac894193d58e30b28d978bb31a9b5d0dc2874', 'Francesco', 'Verdi', 'Via Pisa, 41, Pisa', '+393312345710', '0', 'e318e257e48acb0c21acdda146270dec325190dfa2e87f417d54db5d218e744e'),
(125, 'camilla.neri42@mail.com', 'c891a63fb9c321954ba715854c6727b60a50514afd4d15d3907d1d8435a80ee3', 'Camilla', 'Neri', 'Via Sondrio, 42, Sondrio', '+393312345711', '0', NULL),
(126, 'antonio.rossi43@mail.com', '948f0df33c91257e4319da4667f851d1db84634063dd8e397b21ff4d5bd47b4a', 'Antonio', 'Rossi', 'Via Taranto, 43, Taranto', '+393312345712', '0', NULL),
(127, 'elena.bianchi44@mail.com', '438a694c3e8113f9ddc7745286fc52b485b4e0dc2fc6cdb05690a793f4f15f86', 'Elena', 'Bianchi', 'Via Trapani, 44, Trapani', '+393312345713', '0', NULL),
(128, 'paolo.verdi45@mail.com', 'a4aadb33891666331119341d3337f9805b56409d5fa9843256617efdc8db2ae8', 'Paolo', 'Verdi', 'Via Ragusa, 45, Ragusa', '+393312345714', '0', NULL),
(129, 'ludovica.neri46@mail.com', 'be3c4749c2ec8ddc3a714869e542c1319083aed6615d65f3e1127c59f600bec2', 'Ludovica', 'Neri', 'Via Oristano, 46, Oristano', '+393312345715', '0', '6ff783b341ca68c54f838acf5c35399e788727f0356020169267957977b11c3b'),
(130, 'davide.rossi47@mail.com', '67b7b5215057b25a344e2e15a33e38670ff1e68ecade3d840112379d88468f2a', 'Davide', 'Rossi', 'Via Siracusa, 47, Siracusa', '+393312345716', '0', NULL),
(131, 'ilaria.bianchi48@mail.com', '52483f843ab616c176b45b9da8d9f025e3d3d07ac750e2cffaaf014ed1866404', 'Ilaria', 'Bianchi', 'Via Nuoro, 48, Nuoro', '+393312345717', '0', NULL),
(132, 'giacomo.verdi49@mail.com', '26ee475ae70083751c41a25b29037e1276750d695fa7c312006d193aa2408825', 'Giacomo', 'Verdi', 'Via Sassari, 49, Sassari', '+393312345718', '0', NULL),
(133, 'stefania.neri50@mail.com', '78af459f3d02b0a53785fe1e730fc0818fc677d8af30a1926b610472634129f0', 'Stefania', 'Neri', 'Via Olbia, 50, Olbia', '+393312345719', '0', '5debfc3ccc7d00e1e9a5b970087326a4f50e0b9d87d5ff5d659ddd4ff26ac19c');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `generi`
--
ALTER TABLE `generi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `giochi`
--
ALTER TABLE `giochi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `giochi_acquistati`
--
ALTER TABLE `giochi_acquistati`
  ADD KEY `gioco` (`gioco`),
  ADD KEY `id_ordine` (`id_ordine`);

--
-- Indexes for table `giochi_generi`
--
ALTER TABLE `giochi_generi`
  ADD PRIMARY KEY (`gioco`,`genere`),
  ADD KEY `genere` (`genere`);

--
-- Indexes for table `ordini`
--
ALTER TABLE `ordini`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utente` (`utente`);

--
-- Indexes for table `ruoli`
--
ALTER TABLE `ruoli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role` (`ruolo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `generi`
--
ALTER TABLE `generi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `giochi`
--
ALTER TABLE `giochi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT for table `ordini`
--
ALTER TABLE `ordini`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `utenti`
--
ALTER TABLE `utenti`
  MODIFY `uid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `giochi_acquistati`
--
ALTER TABLE `giochi_acquistati`
  ADD CONSTRAINT `giochi_acquistati_ibfk_3` FOREIGN KEY (`gioco`) REFERENCES `giochi` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `giochi_acquistati_ibfk_4` FOREIGN KEY (`id_ordine`) REFERENCES `ordini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `giochi_generi`
--
ALTER TABLE `giochi_generi`
  ADD CONSTRAINT `giochi_generi_ibfk_1` FOREIGN KEY (`gioco`) REFERENCES `giochi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `giochi_generi_ibfk_2` FOREIGN KEY (`genere`) REFERENCES `generi` (`id`),
  ADD CONSTRAINT `giochi_generi_ibfk_3` FOREIGN KEY (`genere`) REFERENCES `generi` (`id`),
  ADD CONSTRAINT `giochi_generi_ibfk_4` FOREIGN KEY (`gioco`) REFERENCES `giochi` (`id`),
  ADD CONSTRAINT `giochi_generi_ibfk_5` FOREIGN KEY (`gioco`) REFERENCES `giochi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`ruolo`) REFERENCES `ruoli` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
