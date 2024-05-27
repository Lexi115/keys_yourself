-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 27, 2024 at 05:59 PM
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
-- Table structure for table `carrelli`
--

CREATE TABLE `carrelli` (
  `utente` int NOT NULL,
  `gioco` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'The Witcher 3: Wild Hunt', '39.99', 'Esplora un vasto mondo aperto ricco di avventure e misteri.', 'CD Projekt Red'),
(2, 'Grand Theft Auto V', '29.99', 'Entra nel mondo del crimine e della corruzione in questa epica avventura open-world.', 'Rockstar Games'),
(3, 'Red Dead Redemption 2', '49.99', 'Vivi la vita di un fuorilegge nell\'epico Selvaggio West.', 'Rockstar Games'),
(4, 'Cyberpunk 2077', '59.99', 'Esplora Night City, una megalopoli ossessionata dal potere, dal glamour e dalla modifica del corpo.', 'CD Projekt Red'),
(5, 'Assassin\'s Creed Valhalla', '49.99', 'Guida i Vichinghi nella loro conquista dell\'Inghilterra nel nono secolo.', 'Ubisoft'),
(6, 'Minecraft', '19.99', 'Un gioco di creatività e sopravvivenza che ti permette di costruire e esplorare mondi infiniti.', 'Mojang'),
(7, 'FIFA 22', '59.99', 'Il simulatore di calcio più famoso al mondo con nuove funzionalità e modalità di gioco.', 'Electronic Arts'),
(8, 'NBA 2K22', '59.99', 'Vivi l\'esperienza dell\'NBA con una grafica mozzafiato e una modalità carriera coinvolgente.', '2K Sports'),
(9, 'The Legend of Zelda: Breath of the Wild', '59.99', 'Esplora il vasto regno di Hyrule in questa avventura epica.', 'Nintendo'),
(10, 'Super Mario Odyssey', '49.99', 'Un viaggio mozzafiato attraverso mondi straordinari e colorati.', 'Nintendo'),
(11, 'Pokémon Spada e Scudo', '59.99', 'Esplora la regione di Galar e cattura Pokémon in questa avventura RPG.', 'Nintendo'),
(12, 'Halo Infinite', '59.99', 'Torna a combattere il Brute Chief e scopri i segreti del nuovo Anello Halo.', '343 Industries'),
(13, 'Death Stranding', '49.99', 'Consegna pacchi in un mondo post-apocalittico, cercando di ricostruire la società.', 'Kojima Productions'),
(14, 'Ghost of Tsushima', '49.99', 'Diventa il leggendario samurai Jin Sakai in questo emozionante gioco d\'avventura.', 'Sucker Punch Productions'),
(15, 'Overwatch', '39.99', 'Un colorato sparatutto in prima persona in cui i giocatori si uniscono in squadre per combattere.', 'Blizzard Entertainment'),
(16, 'The Elder Scrolls V: Skyrim', '29.99', 'Esplora un vasto mondo di fantasy e scopri le sue profondità e i suoi segreti.', 'Bethesda Game Studios'),
(17, 'Dark Souls III', '39.99', 'Sfida la morte in questo avvincente gioco di ruolo d\'azione, noto per la sua difficoltà estrema.', 'FromSoftware'),
(18, 'The Last of Us Part II', '49.99', 'Esplora un mondo post-apocalittico e affronta sfide emotive in questa avventura epica.', 'Naughty Dog'),
(19, 'Animal Crossing: New Horizons', '59.99', 'Scappa alla tua isola deserta e crea una nuova vita in questo rilassante simulatore di vita.', 'Nintendo'),
(20, 'Resident Evil 3', '39.99', 'Un remake dell\'originale, affronta l\'orrore della città di Raccoon durante lo scoppio della epidemia del T-virus.', 'Capcom'),
(21, 'Resident Evil 4', '19.99', 'Leon S. Kennedy si trova a fronteggiare un\'insurrezione di orrori, in cerca della figlia del presidente rapita.', 'Capcom'),
(22, 'Resident Evil 5', '19.99', 'Insieme a Chris Redfield e Sheva Alomar affronta una minaccia bioterroristica in Africa.', 'Capcom'),
(23, 'Resident Evil 6', '19.99', 'Siamo nel 2013, Leon Kennedy e Chris Redfield sono sulle tracce di una cospirazione globale.', 'Capcom'),
(24, 'Resident Evil 7: Biohazard', '29.99', 'In prima persona, affronta il terrore nella casa della famiglia Baker con protagonisti nuovi personaggi.', 'Capcom'),
(25, 'Resident Evil: Village', '59.99', 'Un nuovo capitolo della serie, in un villaggio abitato da creature orribili, mentre Chris Redfield svolge un', 'Capcom'),
(26, 'FIFA 23', '59.99', 'Il nuovo capitolo della celebre serie di giochi di calcio con miglioramenti grafici e nuove modalità di gioco.', 'Electronic Arts'),
(27, 'Final Fantasy XVI', '59.99', 'Esplora un mondo di fantasy ricco di avventure, magia e intrighi politici in questo nuovo capitolo della serie.', 'Square Enix'),
(28, 'God of War Ragnarok', '59.99', 'Accompagna Kratos e Atreus in un viaggio epico attraverso i regni nordici mentre affrontano creature mitologiche e dèi.', 'Santa Monica Studio'),
(29, 'Horizon Forbidden West', '59.99', 'Esplora le terre selvagge e pericolose dell\'America post-apocalittica mentre Aloy cerca di salvare il mondo dalla distruzione.', 'Guerrilla Games'),
(30, 'Elden Ring', '59.99', 'Esplora un mondo fantasy oscuro e pieno di pericoli mentre cerchi l\'anello spezzato per salvare la terra.', 'FromSoftware'),
(31, 'Starfield', '59.99', 'Preparati per un viaggio epico nell\'universo Bethesda in questo nuovo gioco di ruolo e avventura spaziale.', 'Bethesda Game Studios'),
(32, 'Battlefield 2042', '59.99', 'Entra nella guerra del futuro con una vasta gamma di veicoli, armi e mappe dinamiche.', 'Electronic Arts'),
(33, 'Spider-Man 2', '59.99', 'Torna a vestire i panni di Spider-Man in questo nuovo capitolo della serie, affrontando nuovi nemici e sfide.', 'Insomniac Games'),
(34, 'The Sims 5', '59.99', 'Crea la tua vita virtuale e controlla ogni aspetto della vita dei tuoi Sims in questo nuovo e migliorato simulatore di vita.', 'Electronic Arts'),
(35, 'Forza Horizon 5', '59.99', 'Esplora il vasto paesaggio messicano in questo coinvolgente gioco di guida open-world.', 'Turn 10 Studios'),
(36, 'Diablo IV', '59.99', 'Affronta il male in questo nuovo capitolo della serie Diablo, esplorando un mondo oscuro e pericoloso.', 'Blizzard Entertainment'),
(37, 'Gotham Knights', '59.99', 'Proteggi Gotham City come Batman o uno dei suoi alleati nel combattimento contro il crimine in questo nuovo gioco d\'azione e avventura.', 'WB Games Montreal'),
(38, 'The Elder Scrolls VI', '59.99', 'Preparati per un altro viaggio epico nell\'immaginario mondo di Tamriel in questo nuovo capitolo della serie.', 'Bethesda Game Studios'),
(39, 'Dead Space', '59.99', 'Esplora una stazione spaziale infestata da orrori indicibili in questo remake del classico gioco survival horror.', 'Motive Studios'),
(40, 'Hogwarts Legacy', '59.99', 'Esplora la magica scuola di magia di Hogwarts e il mondo circostante in questo nuovo gioco di ruolo basato sul mondo di Harry Potter.', 'Portkey Games'),
(41, 'Far Cry 6', '59.99', 'Affronta un dittatore spietato e la sua violenta dittatura in questo nuovo capitolo della serie Far Cry, ambientato in un\'isola dei Caraibi.', 'Ubisoft'),
(42, 'Bayonetta 3', '59.99', 'Unisciti a Bayonetta in questo nuovo capitolo della serie, affrontando creature demoniache con stile e grazia.', 'PlatinumGames'),
(43, 'Baldur\'s Gate III', '59.99', 'Esplora un vasto mondo fantasy in questo nuovo capitolo della serie Baldur\'s Gate, pieno di avventure e misteri.', 'Larian Studios'),
(44, 'Deathloop', '59.99', 'Sopravvivi a cicli temporali mortali in questo innovativo gioco d\'azione e avventura di Arkane Studios.', 'Arkane Studios'),
(45, 'Rainbow Six Quarantine', '59.99', 'Combatti contro creature parassite in questo sparatutto tattico cooperativo basato sull\'universo di Rainbow Six.', 'Ubisoft'),
(46, 'Hollow Knight: Silksong', '59.99', 'Unisciti a Hornet in questo nuovo capitolo della serie Hollow Knight, esplorando nuovi mondi e affrontando nuovi nemici.', 'Team Cherry'),
(47, 'Suicide Squad: Kill the Justice League', '59.99', 'Unisciti al Suicide Squad in questo gioco d\'azione e avventura, dove devi fermare la Justice League diventata malvagia.', 'Rocksteady Studios'),
(48, 'Star Wars Jedi: Fallen Order 2', '59.99', 'Torna a vestire i panni di un Jedi in questa epica avventura nel mondo di Star Wars, piena di azione e misteri.', 'Respawn Entertainment'),
(49, 'Dragon Age 4', '59.99', 'Esplora un mondo fantasy ricco di intrighi politici, magia e avventure in questo nuovo capitolo della serie Dragon Age.', 'BioWare');

-- --------------------------------------------------------

--
-- Table structure for table `giochi_acquistati`
--

CREATE TABLE `giochi_acquistati` (
  `id_ordine` int NOT NULL,
  `gioco` int DEFAULT NULL,
  `nome_gioco` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `codice_gioco` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 204),
(1, 205),
(1, 206),
(2, 204),
(2, 206),
(2, 208),
(2, 217),
(2, 218),
(3, 204),
(3, 206),
(4, 204),
(4, 206),
(4, 228),
(5, 205),
(5, 206),
(5, 211),
(6, 205),
(6, 220),
(6, 226),
(7, 207),
(7, 220),
(8, 207),
(8, 220),
(9, 204),
(9, 205),
(9, 215),
(9, 227),
(10, 205),
(10, 211),
(10, 220),
(10, 227),
(11, 216),
(11, 227),
(12, 208),
(12, 217),
(12, 228),
(13, 205),
(13, 227),
(14, 204),
(14, 205),
(15, 208),
(15, 217),
(15, 218),
(16, 205),
(16, 206),
(16, 216),
(17, 206),
(17, 215),
(17, 216),
(18, 204),
(18, 205),
(18, 214),
(18, 215),
(19, 210),
(19, 220),
(19, 226),
(20, 204),
(20, 208),
(20, 214),
(20, 215),
(21, 204),
(21, 208),
(21, 214),
(21, 215),
(22, 204),
(22, 208),
(22, 214),
(22, 215),
(24, 204),
(24, 208),
(24, 214),
(24, 215),
(25, 204),
(25, 208),
(25, 214),
(25, 215),
(26, 207),
(26, 209),
(26, 212),
(27, 204),
(27, 205),
(27, 206),
(27, 216),
(28, 204),
(28, 205),
(28, 210),
(28, 216),
(29, 204),
(29, 205),
(29, 218),
(29, 220),
(29, 227),
(30, 204),
(30, 205),
(30, 206),
(30, 216),
(30, 227),
(31, 204),
(31, 205),
(31, 208),
(31, 212),
(31, 217),
(31, 227),
(32, 204),
(32, 208),
(32, 212),
(32, 217),
(33, 205),
(33, 209),
(33, 211),
(33, 220),
(33, 227),
(34, 212),
(34, 213),
(34, 220),
(35, 205),
(35, 207),
(35, 212),
(35, 222),
(35, 227),
(36, 205),
(36, 206),
(36, 209),
(36, 216),
(36, 219),
(37, 204),
(37, 216),
(37, 221),
(38, 204),
(38, 205),
(38, 210),
(38, 216),
(38, 219),
(38, 227),
(39, 205),
(39, 208),
(39, 214),
(39, 215),
(39, 218),
(39, 228),
(40, 205),
(40, 206),
(40, 210),
(40, 216),
(41, 204),
(41, 205),
(41, 208),
(41, 215),
(41, 217),
(41, 227),
(42, 205),
(42, 206),
(42, 209),
(42, 216),
(43, 205),
(43, 206),
(43, 209),
(43, 210),
(43, 216),
(43, 221),
(43, 227),
(44, 204),
(44, 208),
(44, 210),
(44, 217),
(44, 228),
(45, 204),
(45, 208),
(45, 214),
(45, 217),
(45, 228),
(46, 205),
(46, 206),
(46, 210),
(46, 211),
(46, 221),
(47, 204),
(47, 205),
(48, 204),
(48, 205),
(48, 206),
(48, 211),
(48, 216),
(48, 228),
(49, 204),
(49, 205),
(49, 213),
(49, 223);

-- --------------------------------------------------------

--
-- Table structure for table `ordini`
--

CREATE TABLE `ordini` (
  `id` int NOT NULL,
  `utente` int DEFAULT NULL,
  `nome` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `cognome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(320) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `indirizzo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `citta` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `regione` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `cap` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `stato` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `data_acquisto` date NOT NULL,
  `prezzo` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(46, 'mario@email.com', 'password123', 'Mario', 'Rossi', 'Via Roma 1', '1234567890', '1', NULL),
(47, 'luigi@email.com', 'securepass', 'Luigi', 'Verdi', 'Via Garibaldi 2', '0987654321', '0', NULL),
(48, 'peppino@email.com', 'topsecret', 'Peppino', 'Bianchi', 'Corso Italia 3', '111222333', '0', NULL),
(49, 'gianni@email.com', 'giannipass', 'Gianni', 'Neri', 'Viale Kennedy 4', '444555666', '0', NULL),
(50, 'anna@email.com', 'password123', 'Anna', 'Gialli', 'Piazza Dante 5', '777888999', '0', NULL),
(51, 'francesco@email.com', 'securepass', 'Francesco', 'Rosa', 'Via Garibaldi 6', '666555444', '0', NULL),
(52, 'giulia@email.com', 'topsecret', 'Giulia', 'Viola', 'Corso Vittorio Emanuele 7', '123123123', '0', NULL),
(53, 'giovanni@email.com', 'giannipass', 'Giovanni', 'Blu', 'Via Po 8', '456456456', '0', NULL),
(54, 'carmela@email.com', 'password123', 'Carmela', 'Arancione', 'Piazza Duomo 9', '789789789', '0', NULL),
(55, 'carlo@email.com', 'securepass', 'Carlo', 'Celeste', 'Corso Umberto 10', '987987987', '0', NULL),
(56, 'maria@email.com', 'topsecret', 'Maria', 'Marrone', 'Viale dei Fiori 11', '654654654', '0', NULL),
(57, 'rosario@email.com', 'giannipass', 'Rosario', 'Turchese', 'Via della Libertà 12', '321321321', '0', NULL),
(58, 'simona@email.com', 'password123', 'Simona', 'Lilla', 'Piazza dei Miracoli 13', '111222333', '0', NULL),
(59, 'paolo@email.com', 'securepass', 'Paolo', 'Indaco', 'Corso Matteotti 14', '444555666', '0', NULL),
(60, 'caterina@email.com', 'topsecret', 'Caterina', 'Azzurro', 'Via Roma 15', '777888999', '0', NULL),
(61, 'andrea@email.com', 'giannipass', 'Andrea', 'Rosa', 'Viale dei Pini 16', '666555444', '0', NULL),
(62, 'elena@email.com', 'password123', 'Elena', 'Giallo', 'Corso Cavour 17', '123123123', '0', NULL),
(63, 'vincenzo@email.com', 'securepass', 'Vincenzo', 'Verde', 'Piazza Maggiore 18', '456456456', '0', NULL),
(64, 'marta@email.com', 'topsecret', 'Marta', 'Blu', 'Via San Lorenzo 19', '789789789', '0', NULL),
(65, 'sergio@email.com', 'giannipass', 'Sergio', 'Celeste', 'Viale dei Tigli 20', '987987987', '0', NULL),
(66, 'laura@email.com', 'password123', 'Laura', 'Arancione', 'Corso Italia 21', '654654654', '0', NULL),
(67, 'roberta@email.com', 'topsecret', 'Roberta', 'Marrone', 'Via Roma 23', '111222333', '0', NULL),
(68, 'davide@email.com', 'giannipass', 'Davide', 'Turchese', 'Corso Matteotti 24', '444555666', '0', NULL),
(69, 'silvia@email.com', 'password123', 'Silvia', 'Lilla', 'Piazza Garibaldi 25', '777888999', '0', NULL),
(70, 'antonio@email.com', 'securepass', 'Antonio', 'Indaco', 'Via XX Settembre 26', '666555444', '0', NULL),
(71, 'chiara@email.com', 'topsecret', 'Chiara', 'Azzurro', 'Viale dei Pini 27', '123123123', '0', NULL),
(72, 'luca@email.com', 'giannipass', 'Luca', 'Rosa', 'Corso Italia 28', '456456456', '0', NULL),
(73, 'elisa@email.com', 'password123', 'Elisa', 'Verde', 'Via Garibaldi 29', '789789789', '0', NULL),
(74, 'gabriele@email.com', 'securepass', 'Gabriele', 'Blu', 'Corso Vittorio Emanuele 30', '987987987', '0', NULL),
(75, 'ciao@ciao', 'b133a0c0e9bee3be20163d2ad31d6248db292aa6dcb1ee087a2aa50e0fc75ae2', 'ggg', 'gigi', 'waddawawd', '42342342', '0', '49eac2a51955ae67df6cfe5cdc21056079d70edac8b0e88cd8774d8ad5cc312a'),
(76, 'admin@admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin', 'admin', '23', '23423', '0', 'd0366ab1a7d1eff3767fe2e8f3869769395a3b889e4b756177f79b877e6f3fdb');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carrelli`
--
ALTER TABLE `carrelli`
  ADD PRIMARY KEY (`utente`,`gioco`),
  ADD KEY `user` (`utente`),
  ADD KEY `product` (`gioco`);

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
  ADD KEY `gioco` (`gioco`),
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `ordini`
--
ALTER TABLE `ordini`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `utenti`
--
ALTER TABLE `utenti`
  MODIFY `uid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carrelli`
--
ALTER TABLE `carrelli`
  ADD CONSTRAINT `carrelli_ibfk_1` FOREIGN KEY (`gioco`) REFERENCES `giochi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carrelli_ibfk_2` FOREIGN KEY (`utente`) REFERENCES `utenti` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `giochi_generi_ibfk_1` FOREIGN KEY (`gioco`) REFERENCES `giochi` (`id`),
  ADD CONSTRAINT `giochi_generi_ibfk_2` FOREIGN KEY (`genere`) REFERENCES `generi` (`id`),
  ADD CONSTRAINT `giochi_generi_ibfk_3` FOREIGN KEY (`genere`) REFERENCES `generi` (`id`),
  ADD CONSTRAINT `giochi_generi_ibfk_4` FOREIGN KEY (`gioco`) REFERENCES `giochi` (`id`);

--
-- Constraints for table `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`ruolo`) REFERENCES `ruoli` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
