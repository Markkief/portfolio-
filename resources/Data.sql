
INSERT INTO Provincia (nome_provincia) VALUES
('Roma'),
('Milano'),
('Napoli'),
('Torino'),
('Palermo'),
('Genova'),
('Bologna'),
('Firenze'),
('Bari'),
('Catania');
INSERT INTO Comune (id_provincia, nome_comune) VALUES
(1, 'Roma'),
(1, 'Tivoli'),
(1, 'Frascati'),
(2, 'Milano'),
(2, 'Monza'),
(2, 'Sesto San Giovanni'),
(3, 'Napoli'),
(3, 'Pompei'),
(3, 'Pozzuoli'),
(4, 'Torino'),
(4, 'Moncalieri'),
(4, 'Rivoli'),
(5, 'Palermo'),
(5, 'Monreale'),
(5, 'Bagheria'),
(6, 'Genova'),
(6, 'Rapallo'),
(6, 'Chiavari'),
(7, 'Bologna'),
(7, 'Imola'),
(7, 'Casalecchio di Reno'),
(8, 'Firenze'),
(8, 'Prato'),
(8, 'Scandicci'),
(9, 'Bari'),
(9, 'Modugno'),
(9, 'Bitonto'),
(10, 'Catania'),
(10, 'Acireale'),
(10, 'Paternò');
INSERT INTO CasaNova.TipologiaImmobile (tipologia) VALUES
('Appartamento'),
('Villa'),
('Casa indipendente'),
('Attico'),
('Loft'),
('Rustico'),
('Bilocale'),
('Trilocale'),
('Quadrilocale'),
('Monolocale');
INSERT INTO CasaNova.StatoImmobile (stato) VALUES
('Nuovo'),
('Ristrutturato'),
('Da ristrutturare'),
('Usato'),
('In costruzione');

INSERT INTO Casanova.MediazioneImmobile (mediazione) VALUES
('Vendita'),
('Affitto');

INSERT INTO User (user_id, username, password_hash, email, first_name, last_name, phone, role) VALUES
(1, 'mario.rossi', '$2a$10$xJwL5v5Jz5UZJZ5UZJZ5Ue', 'mario.rossi@email.com', 'Mario', 'Rossi', '3312345678', 'STANDARD'),
(2, 'luigi.bianchi', '$2a$10$xJwL5v5Jz5UZJZ5UZJZ5Ue', 'luigi.bianchi@email.com', 'Luigi', 'Bianchi', '3323456789', 'STANDARD'),
(3, 'anna.verdi', '$2a$10$xJwL5v5Jz5UZJZ5UZJZ5Ue', 'anna.verdi@email.com', 'Anna', 'Verdi', '3334567890', 'STANDARD'),
(4, 'paolo.neri', '$2a$10$xJwL5v5Jz5UZJZ5UZJZ5Ue', 'paolo.neri@email.com', 'Paolo', 'Neri', '3345678901', 'STANDARD'),
(5, 'laura.gialli', '$2a$10$xJwL5v5Jz5UZJZ5UZJZ5Ue', 'laura.gialli@email.com', 'Laura', 'Gialli', '3356789012', 'STANDARD'),
(6, 'giovanni.blu', '$2a$10$xJwL5v5Jz5UZJZ5UZJZ5Ue', 'giovanni.blu@email.com', 'Giovanni', 'Blu', '3367890123', 'REVISOR'),
(7, 'francesca.rosa', '$2a$10$xJwL5v5Jz5UZJZ5UZJZ5Ue', 'francesca.rosa@email.com', 'Francesca', 'Rosa', '3378901234', 'STANDARD'),
(8, 'marco.viola', '$2a$10$xJwL5v5Jz5UZJZ5UZJZ5Ue', 'marco.viola@email.com', 'Marco', 'Viola', '3389012345', 'STANDARD'),
(9, 'elena.arancione', '$2a$10$xJwL5v5Jz5UZJZ5UZJZ5Ue', 'elena.arancione@email.com', 'Elena', 'Arancione', '3390123456', 'ADMIN'),
(10, 'andrea.marrone', '$2a$10$xJwL5v5Jz5UZJZ5UZJZ5Ue', 'andrea.marrone@email.com', 'Andrea', 'Marrone', '3301234567', 'REVISOR');

-- Inserimenti per la tabella Immobile (ID da 50 a 79)
INSERT INTO Immobile (id_immobile, id_comune, id_provincia, id_tipologia_immobile, superficie, indirizzo, locali, ascensore, terrazzo, piano, balcone, giardino, garage, bagno) VALUES
(50, 1, 1, 1, '75', 'Via Roma 10', 3, 1, 1, 2, 1, 0, 1, 2),
(51, 4, 2, 2, '120', 'Via Milano 5', 4, 0, 0, 1, 0, 1, 1, 2),
(52, 7, 3, 3, '90', 'Via Napoli 15', 3, 1, 1, 3, 1, 0, 0, 1),
(53, 10, 4, 4, '60', 'Via Torino 20', 2, 1, 1, 5, 1, 0, 0, 1),
(54, 13, 5, 5, '110', 'Via Palermo 8', 3, 0, 0, 0, 0, 1, 1, 2),
(55, 16, 6, 6, '200', 'Via Genova 12', 5, 0, 0, 0, 0, 1, 1, 3),
(56, 19, 7, 7, '45', 'Via Bologna 7', 1, 1, 0, 2, 0, 0, 0, 1),
(57, 22, 8, 8, '85', 'Via Firenze 9', 3, 1, 1, 1, 1, 0, 1, 1),
(58, 25, 9, 9, '130', 'Via Bari 11', 4, 0, 0, 0, 0, 1, 1, 2),
(59, 28, 10, 10, '30', 'Via Catania 3', 1, 1, 0, 3, 0, 0, 0, 1),
(60, 2, 1, 1, '80', 'Via Tivoli 14', 3, 0, 1, 1, 1, 0, 1, 2),
(61, 5, 2, 2, '150', 'Via Monza 22', 5, 1, 0, 2, 0, 1, 1, 3),
(62, 8, 3, 3, '95', 'Via Pompei 6', 3, 0, 1, 0, 1, 1, 0, 2),
(63, 11, 4, 4, '70', 'Via Moncalieri 18', 2, 1, 1, 4, 1, 0, 0, 1),
(64, 14, 5, 5, '100', 'Via Monreale 9', 3, 0, 0, 1, 0, 0, 1, 2),
(65, 17, 6, 6, '180', 'Via Rapallo 5', 4, 0, 0, 0, 0, 1, 1, 2),
(66, 20, 7, 7, '50', 'Via Imola 13', 1, 1, 0, 3, 0, 0, 0, 1),
(67, 23, 8, 8, '90', 'Via Prato 8', 3, 1, 1, 2, 1, 0, 1, 1),
(68, 26, 9, 9, '140', 'Via Modugno 7', 4, 0, 0, 0, 0, 1, 1, 3),
(69, 29, 10, 10, '35', 'Via Acireale 4', 1, 1, 0, 2, 0, 0, 0, 1),
(70, 3, 1, 1, '85', 'Via Frascati 16', 3, 0, 1, 2, 1, 0, 1, 2),
(71, 6, 2, 2, '160', 'Via Sesto San Giovanni 11', 5, 1, 0, 3, 0, 1, 1, 3),
(72, 9, 3, 3, '100', 'Via Pozzuoli 7', 3, 0, 1, 1, 1, 1, 0, 2),
(73, 12, 4, 4, '75', 'Via Rivoli 19', 2, 1, 1, 5, 1, 0, 0, 1),
(74, 15, 5, 5, '105', 'Via Bagheria 10', 3, 0, 0, 2, 0, 0, 1, 2),
(75, 18, 6, 6, '190', 'Via Chiavari 6', 4, 0, 0, 0, 0, 1, 1, 2),
(76, 21, 7, 7, '55', 'Via Casalecchio di Reno 12', 1, 1, 0, 4, 0, 0, 0, 1),
(77, 24, 8, 8, '95', 'Via Scandicci 9', 3, 1, 1, 1, 1, 0, 1, 1),
(78, 27, 9, 9, '145', 'Via Bitonto 8', 4, 0, 0, 0, 0, 1, 1, 3),
(79, 30, 10, 10, '40', 'Via Paternò 5', 1, 1, 0, 3, 0, 0, 0, 1);
-- Inserimenti per la tabella Listing (ID da 50 a 79)
INSERT INTO Listing (id_listing, id_mediazione_immobile, id_immagine_immobile, id_stato_immobile, id_utente, title, prezzo, descrizione, listing_status, id_immobile) VALUES
(50, 1, 1, 1, 1, 'Appartamento centrale a Roma', 250000, 'Appartamento luminoso in zona centrale', 'SELL', 50),
(51, 2, 2, 2, 2, 'Villa con giardino a Milano', 1200, 'Villa indipendente con ampio giardino', 'RENT', 51),
(52, 1, 3, 3, 3, 'Casa da ristrutturare a Napoli', 180000, 'Ottima opportunità per investimento', 'SELL', 52),
(53, 2, 4, 4, 4, 'Attico con vista a Torino', 900, 'Attico panoramico in zona residenziale', 'RENT', 53),
(54, 1, 5, 5, 5, 'Loft spazioso a Palermo', 320000, 'Loft moderno in zona trendy', 'SELL', 54),
(55, 2, 6, 1, 6, 'Rustico con terreno a Genova', 500, 'Rustico con terreno agricolo', 'RENT', 55),
(56, 1, 7, 2, 7, 'Bilocale nuovo a Bologna', 150000, 'Appartamento nuovo con finiture di pregio', 'SELL', 56),
(57, 2, 8, 3, 8, 'Trilocale da ristrutturare a Firenze', 650, 'Appartamento in buona posizione', 'RENT', 57),
(58, 1, 9, 4, 9, 'Quadrilocale usato a Bari', 280000, 'Casa spaziosa con garage', 'SELL', 58),
(59, 2, 10, 5, 10, 'Monolocale in costruzione a Catania', 400, 'Nuova costruzione in zona universitaria', 'RENT', 59),
(60, 1, 11, 1, 1, 'Appartamento a Tivoli', 220000, 'Appartamento tranquillo vicino al centro', 'SELL', 60),
(61, 2, 12, 2, 2, 'Villa con piscina a Monza', 1500, 'Villa di lusso con piscina', 'RENT', 61),
(62, 1, 13, 3, 3, 'Casa con giardino a Pompei', 190000, 'Casa con ampio giardino', 'SELL', 62),
(63, 2, 14, 4, 4, 'Attico in centro a Moncalieri', 950, 'Attico con terrazzo panoramico', 'RENT', 63),
(64, 1, 15, 5, 5, 'Loft industriale a Monreale', 290000, 'Spazio open space in stile industriale', 'SELL', 64),
(65, 2, 16, 1, 6, 'Rustico con vista mare a Rapallo', 550, 'Rustico ristrutturato con vista', 'RENT', 65),
(66, 1, 17, 2, 7, 'Bilocale ristrutturato a Imola', 170000, 'Appartamento completamente rinnovato', 'SELL', 66),
(67, 2, 18, 3, 8, 'Trilocale centrale a Prato', 700, 'Appartamento in zona servita', 'RENT', 67),
(68, 1, 19, 4, 9, 'Quadrilocale con garage a Modugno', 300000, 'Ampia casa con posto auto', 'SELL', 68),
(69, 2, 20, 5, 10, 'Monolocale nuovo a Acireale', 450, 'Nuova costruzione vicino al mare', 'RENT', 69),
(70, 1, 21, 1, 1, 'Appartamento a Frascati', 230000, 'Appartamento con terrazzo', 'SELL', 70),
(71, 2, 22, 2, 2, 'Villa esclusiva a Sesto San Giovanni', 1700, 'Villa con ampio parco privato', 'RENT', 71),
(72, 1, 23, 3, 3, 'Casa con terrazzo a Pozzuoli', 200000, 'Casa con ampio terrazzo vista mare', 'SELL', 72),
(73, 2, 24, 4, 4, 'Attico di lusso a Rivoli', 1100, 'Attico con finiture di pregio', 'RENT', 73),
(74, 1, 25, 5, 5, 'Loft creativo a Bagheria', 310000, 'Spazio unico per artisti', 'SELL', 74),
(75, 2, 26, 1, 6, 'Rustico con cantina a Chiavari', 600, 'Rustico con cantina vinicola', 'RENT', 75),
(76, 1, 27, 2, 7, 'Bilocale premium a Casalecchio di Reno', 180000, 'Appartamento con design moderno', 'SELL', 76),
(77, 2, 28, 3, 8, 'Trilocale zona stazione a Scandicci', 750, 'Appartamento comodo ai trasporti', 'RENT', 77),
(78, 1, 29, 4, 9, 'Quadrilocale con giardino a Bitonto', 320000, 'Casa con giardino e garage', 'SELL', 78),
(79, 2, null , 5, 10, 'Monolocale moderno a Paternò', 500, 'Nuova costruzione con arredi', 'RENT', 79);

-- Inserimenti per la tabella Preferiti (solo alcuni)
INSERT INTO Preferiti (id_preferiti, id_listing, id_utente) VALUES
(50, 50, 2),
(51, 51, 3),
(52, 52, 4),
(53, 53, 5),
(54, 54, 6),
(55, 60, 7),
(56, 61, 8),
(57, 62, 9),
(58, 63, 10),
(59, 70, 1),
(60, 71, 2),
(61, 72, 3),
(62, 73, 4);
INSERT INTO ImmagineImmobile (id_immagine_immobile,immagine,id_listing)VALUES
(1, "https://pwm.im-cdn.it/image/1635039087/xxs-c.jpg", 50),
(2, "https://pwm.im-cdn.it/image/1618140655/xxs-c.jpg", 52),
(3, "https://pwm.im-cdn.it/image/1669651727/xxs-c.jpg", 53),
(4, "https://pwm.im-cdn.it/image/1614678391/xxs-c.jpg", 54),
(5, "https://pwm.im-cdn.it/image/1629327821/xxs-c.jpg", 55),
(6, "https://pwm.im-cdn.it/image/1617541483/xxs-c.jpg", 56),
(7, "https://pwm.im-cdn.it/image/1617629563/xxs-c.jpg", 57),
(8, "https://pwm.im-cdn.it/image/1677201129/xxs-c.jpg", 58),
(9, "https://pwm.im-cdn.it/image/1664291397/xxs-c.jpg", 59),
(10, "https://pwm.im-cdn.it/image/1667363505/xxs-c.jpg", 60),
(11, "https://pwm.im-cdn.it/image/1662678917/xxs-c.jpg",61),
(12, "https://pwm.im-cdn.it/image/1666365175/xxs-c.jpg", 62),
(13, "https://pwm.im-cdn.it/image/1665650387/xxs-c.jpg",63),
(14, "https://pwm.im-cdn.it/image/1624712225/xxs-c.jpg",64),
(15, "https://pwm.im-cdn.it/image/1626324795/xxs-c.jpg",65),
(16, "https://pwm.im-cdn.it/image/1635039087/xxs-c.jpg", 66),
(17, "https://pwm.im-cdn.it/image/1635039087/xxs-c.jpg", 67),
(18, "https://pwm.im-cdn.it/image/1618140655/xxs-c.jpg", 68),
(19, "https://pwm.im-cdn.it/image/1669651727/xxs-c.jpg", 69),
(20, "https://pwm.im-cdn.it/image/1614678391/xxs-c.jpg", 70),
(21, "https://pwm.im-cdn.it/image/1629327821/xxs-c.jpg", 71),
(22, "https://pwm.im-cdn.it/image/1617541483/xxs-c.jpg", 71),
(23, "https://pwm.im-cdn.it/image/1617629563/xxs-c.jpg", 73),
(24, "https://pwm.im-cdn.it/image/1677201129/xxs-c.jpg", 74),
(25, "https://pwm.im-cdn.it/image/1664291397/xxs-c.jpg", 75),
(26, "https://pwm.im-cdn.it/image/1667363505/xxs-c.jpg", 76),
(27, "https://pwm.im-cdn.it/image/1662678917/xxs-c.jpg",77),
(28, "https://pwm.im-cdn.it/image/1666365175/xxs-c.jpg", 78),
(29, "https://pwm.im-cdn.it/image/1665650387/xxs-c.jpg",79);