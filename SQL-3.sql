
--Tworzenie tabeli

CREATE TABLE Sportowcy (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Imie VARCHAR(50),
    Nazwisko VARCHAR(50),
    DataUrodzenia DATE,
    Narodowosc VARCHAR(50),
    Dyscyplina VARCHAR(50),
    LiczbaMedali INT,
    OstatnieZawody VARCHAR(100),
    DataOstatnichZawodow DATE,
    PozycjaOstatnichZawodow INT,
    WynikOstatnichZawodow DECIMAL(5,2)
);

-- Wstawianie przykładowych 
INSERT INTO Sportowcy (Imie, Nazwisko, DataUrodzenia, Narodowosc, Dyscyplina, LiczbaMedali, OstatnieZawody, DataOstatnichZawodow, PozycjaOstatnichZawodow, WynikOstatnichZawodow) VALUES
('Adam', 'Kowalski', '1990-01-15', 'Polska', 'Biegi', 5, 'Maraton Warszawski', '2024-06-12', 1, 123.45),
('Marta', 'Nowak', '1985-03-10', 'Polska', 'Pływanie', 8, 'Mistrzostwa Europy', '2024-04-20', 2, 59.21),
('Tomasz', 'Wójcik', '1993-11-25', 'Polska', 'Koszykówka', 3, 'Liga Światowa', '2024-07-05', 3, 95.80),
('Anna', 'Zielińska', '1991-07-18', 'Polska', 'Tenis', 10, 'Wimbledon', '2024-06-30', 4, 78.92),
('Piotr', 'Wiśniewski', '1988-09-01', 'Polska', 'Siatkówka', 2, 'Mistrzostwa Świata', '2024-05-15', 5, 100.00),
('Kasia', 'Mazurek', '1996-12-05', 'Polska', 'Szachy', 12, 'Mistrzostwa Polski', '2024-08-18', 1, 2500.00),
('Karol', 'Lewandowski', '1994-05-17', 'Polska', 'Piłka nożna', 1, 'Mistrzostwa Europy', '2024-07-12', 6, 90.50),
--Dodanie kolejnych wierszy...
;

SELECT 

-- 1. Wybierz wszystkie dane sportowców
SELECT * FROM Sportowcy;

-- 2. Wybierz imię, nazwisko i dyscyplinę sportową
SELECT Imie, Nazwisko, Dyscyplina FROM Sportowcy;

-- 3. Wybierz sportowców, którzy zdobyli więcej niż 5 medali
SELECT Imie, Nazwisko, LiczbaMedali FROM Sportowcy WHERE LiczbaMedali > 5;

-- 4. Wybierz nazwiska sportowców, którzy ostatnio wzięli udział w zawodach "Wimbledon"
SELECT Nazwisko FROM Sportowcy WHERE OstatnieZawody = 'Wimbledon';

-- 5. Wybierz imiona i wyniki sportowców z ostatnich zawodów
SELECT Imie, WynikOstatnichZawodow FROM Sportowcy;

-- 6. Wybierz sportowców z Polski
SELECT Imie, Nazwisko FROM Sportowcy WHERE Narodowosc = 'Polska';

-- 7. Wybierz sportowców urodzonych po 1990 roku
SELECT Imie, Nazwisko, DataUrodzenia FROM Sportowcy WHERE DataUrodzenia > '1990-01-01';

-- 8. Wybierz sportowców, którzy zajęli 1 miejsce w ostatnich zawodach
SELECT Imie, Nazwisko FROM Sportowcy WHERE PozycjaOstatnichZawodow = 1;

-- 9. Wybierz imiona i dyscypliny sportowców, którzy zdobyli dokładnie 3 medale
SELECT Imie, Dyscyplina FROM Sportowcy WHERE LiczbaMedali = 3;

-- 10. Wybierz sportowców, których wynik w ostatnich zawodach przekroczył 100
SELECT Imie, Nazwisko, WynikOstatnichZawodow FROM Sportowcy WHERE WynikOstatnichZawodow > 100;

--WHERE

-- 1. Wybierz sportowców, którzy są narodowości "Polska"
SELECT * FROM Sportowcy WHERE Narodowosc = 'Polska';

-- 2. Wybierz sportowców, którzy zdobyli więcej niż 5 medali
SELECT * FROM Sportowcy WHERE LiczbaMedali > 5;

-- 3. Wybierz sportowców, którzy urodzili się przed 1990 rokiem
SELECT * FROM Sportowcy WHERE DataUrodzenia < '1990-01-01';

-- 4. Wybierz sportowców, którzy zajęli 1 miejsce w ostatnich zawodach
SELECT * FROM Sportowcy WHERE PozycjaOstatnichZawodow = 1;

-- 5. Wybierz sportowców, którzy startowali w zawodach po 2024-05-01
SELECT * FROM Sportowcy WHERE DataOstatnichZawodow > '2024-05-01';

-- 6. Wybierz sportowców, których wynik w ostatnich zawodach był mniejszy niż 60
SELECT * FROM Sportowcy WHERE WynikOstatnichZawodow < 60;

-- 7. Wybierz sportowców, którzy zdobyli medale i startowali w zawodach "Maraton Warszawski"
SELECT * FROM Sportowcy WHERE LiczbaMedali > 0 AND OstatnieZawody = 'Maraton Warszawski';

-- 8. Wybierz sportowców, których imię zaczyna się na literę 'A'
SELECT * FROM Sportowcy WHERE Imie LIKE 'A%';

-- 9. Wybierz sportowców z dyscypliny "Koszykówka" i "Piłka nożna"
SELECT * FROM Sportowcy WHERE Dyscyplina IN ('Koszykówka', 'Piłka nożna');

-- 10. Wybierz sportowców, którzy zdobyli dokładnie 10 medali
SELECT * FROM Sportowcy WHERE LiczbaMedali = 10;


--GROUP BY 

-- 1. Grupuj sportowców według narodowości
SELECT Narodowosc, COUNT(*) AS LiczbaSportowcow FROM Sportowcy GROUP BY Narodowosc;

-- 2. Grupuj sportowców według dyscypliny
SELECT Dyscyplina, COUNT(*) AS LiczbaSportowcow FROM Sportowcy GROUP BY Dyscyplina;

-- 3. Grupuj sportowców według liczby medali
SELECT LiczbaMedali, COUNT(*) AS LiczbaSportowcow FROM Sportowcy GROUP BY LiczbaMedali;

-- 4. Grupuj sportowców według narodowości i dyscypliny
SELECT Narodowosc, Dyscyplina, COUNT(*) AS LiczbaSportowcow FROM Sportowcy GROUP BY Narodowosc, Dyscyplina;

-- 5. Grupuj sportowców według roku urodzenia
SELECT YEAR(DataUrodzenia) AS RokUrodzenia, COUNT(*) AS LiczbaSportowcow FROM Sportowcy GROUP BY YEAR(DataUrodzenia);

-- 6. Grupuj sportowców według wyniku ostatnich zawodów
SELECT WynikOstatnichZawodow, COUNT(*) AS LiczbaSportowcow FROM Sportowcy GROUP BY WynikOstatnichZawodow;

-- 7. Grupuj sportowców według pozycji na ostatnich zawodach
SELECT PozycjaOstatnichZawodow, COUNT(*) AS LiczbaSportowcow FROM Sportowcy GROUP BY PozycjaOstatnichZawodow;

-- 8. Grupuj sportowców według narodowości i liczby medali
SELECT Narodowosc, LiczbaMedali, COUNT(*) AS LiczbaSportowcow FROM Sportowcy GROUP BY Narodowosc, LiczbaMedali;

-- 9. Grupuj sportowców według dyscypliny i liczby medali
SELECT Dyscyplina, LiczbaMedali, COUNT(*) AS LiczbaSportowcow FROM Sportowcy GROUP BY Dyscyplina, LiczbaMedali;

-- 10. Grupuj sportowców według dyscypliny i narodowości
SELECT Dyscyplina, Narodowosc, COUNT(*) AS LiczbaSportowcow FROM Sportowcy GROUP BY Dyscyplina, Narodowosc;


--DISTINCT

-- 1. Wybierz unikalne narodowości sportowców
SELECT DISTINCT Narodowosc FROM Sportowcy;

-- 2. Wybierz unikalne dyscypliny sportowe
SELECT DISTINCT Dyscyplina FROM Sportowcy;

-- 3. Wybierz unikalne liczby medali zdobytych przez sportowców
SELECT DISTINCT LiczbaMedali FROM Sportowcy;

-- 4. Wybierz unikalne zawody, w których brali udział sportowcy
SELECT DISTINCT OstatnieZawody FROM Sportowcy;

-- 5. Wybierz unikalne daty ostatnich zawodów
SELECT DISTINCT DataOstatnichZawodow FROM Sportowcy;

-- 6. Wybierz unikalne wyniki ostatnich zawodów
SELECT DISTINCT WynikOstatnichZawodow FROM Sportowcy;

-- 7. Wybierz unikalne pozycje zajmowane przez sportowców na ostatnich zawodach
SELECT DISTINCT PozycjaOstatnichZawodow FROM Sportowcy;

-- 8. Wybierz unikalne imiona sportowców
SELECT DISTINCT Imie FROM Sportowcy;

-- 9. Wybierz unikalne nazwiska sportowców
SELECT DISTINCT Nazwisko FROM Sportowcy;

-- 10. Wybierz unikalne kombinacje narodowości i dyscypliny sportowej
SELECT DISTINCT Narodowosc, Dyscyplina FROM Sportowcy;


--MIN/MAX

-- 1. Znajdź minimalną liczbę medali zdobytych przez sportowców
SELECT MIN(LiczbaMedali) AS MinimalnaLiczbaMedali FROM Sportowcy;

-- 2. Znajdź maksymalną liczbę medali zdobytych przez sportowców
SELECT MAX(LiczbaMedali) AS MaksymalnaLiczbaMedali FROM Sportowcy;

-- 3. Znajdź minimalny wynik ostatnich zawodów
SELECT MIN(WynikOstatnichZawodow) AS MinimalnyWynik FROM Sportowcy;

-- 4. Znajdź maksymalny wynik ostatnich zawodów
SELECT MAX(WynikOstatnichZawodow) AS MaksymalnyWynik FROM Sportowcy;

-- 5. Znajdź minimalną datę urodzenia sportowca
SELECT MIN(DataUrodzenia) AS NajstarszaDataUrodzenia FROM Sportowcy;

-- 6. Znajdź maksymalną datę urodzenia sportowca
SELECT MAX(DataUrodzenia) AS NajmłodszaDataUrodzenia FROM Sportowcy;

-- 7. Znajdź minimalną pozycję zajmowaną na ostatnich zawodach
SELECT MIN(PozycjaOstatnichZawodow) AS NajlepszaPozycja FROM Sportowcy;

-- 8. Znajdź maksymalną pozycję zajmowaną na ostatnich zawodach
SELECT MAX(PozycjaOstatnichZawodow) AS NajgorszaPozycja FROM Sportowcy;

-- 9. Znajdź minimalny wiek sportowca
SELECT MIN(DATEDIFF(CURRENT_DATE, DataUrodzenia)/365) AS NajmłodszyWiek FROM Sportowcy;

-- 10. Znajdź maksymalny wiek sportowca
SELECT MAX(DATEDIFF(CURRENT_DATE, DataUrodzenia)/365) AS NajstarszyWiek FROM Sportowcy;


--SUM/AVG

-- 1. Oblicz sumę wszystkich zdobytych medali
SELECT SUM(LiczbaMedali) AS SumaMedali FROM Sportowcy;

-- 2. Oblicz średnią liczbę medali na sportowca
SELECT AVG(LiczbaMedali) AS SredniaMedali FROM Sportowcy;

-- 3. Oblicz sumę wyników sportowców z ostatnich zawodów
SELECT SUM(WynikOstatnichZawodow) AS SumaWynikow FROM Sportowcy;

-- 4. Oblicz średni wynik sportowców z ostatnich zawodów
SELECT AVG(WynikOstatnichZawodow) AS SredniWynik FROM Sportowcy;

-- 5. Oblicz sumę pozycji zajętych na ostatnich zawodach przez wszystkich sportowców
SELECT SUM(PozycjaOstatnichZawodow) AS SumaPozycji FROM Sportowcy;

-- 6. Oblicz średnią pozycję zajmowaną przez sportowców na ostatnich zawodach
SELECT AVG(PozycjaOstatnichZawodow) AS SredniaPozycja FROM Sportowcy;

-- 7. Oblicz sumę liczby lat, które mają sportowcy
SELECT SUM(DATEDIFF(CURRENT_DATE, DataUrodzenia)/365) AS SumaLat FROM Sportowcy;

-- 8. Oblicz średni wiek sportowców
SELECT AVG(DATEDIFF(CURRENT_DATE, DataUrodzenia)/365) AS SredniWiek FROM Sportowcy;

-- 9. Oblicz sumę liczby sportowców w każdej narodowości
SELECT Narodowosc, COUNT(*) AS LiczbaSportowcow FROM Sportowcy GROUP BY Narodowosc;

-- 10. Oblicz średnią liczbę medali na narodowość
SELECT Narodowosc, AVG(LiczbaMedali) AS SredniaMedali FROM Sportowcy GROUP BY Narodowosc;


--HAVING

-- 1. Wybierz narodowości, które mają średnią liczbę medali większą niż 5
SELECT Narodowosc, AVG(LiczbaMedali) AS SredniaMedali FROM Sportowcy GROUP BY Narodowosc HAVING AVG(LiczbaMedali) > 5;

-- 2. Wybierz dyscypliny, w których sportowcy zdobyli więcej niż 10 medali w sumie
SELECT Dyscyplina, SUM(LiczbaMedali) AS SumaMedali FROM Sportowcy GROUP BY Dyscyplina HAVING SUM(LiczbaMedali) > 10;

-- 3. Wybierz narodowości, które mają co najmniej jednego sportowca z wynikiem powyżej 100
SELECT Narodowosc, MAX(WynikOstatnichZawodow) AS NajwyzszyWynik FROM Sportowcy GROUP BY Narodowosc HAVING MAX(WynikOstatnichZawodow) > 100;

-- 4. Wybierz dyscypliny, które mają średnią pozycję w zawodach poniżej 3
SELECT Dyscyplina, AVG(PozycjaOstatnichZawodow) AS SredniaPozycja FROM Sportowcy GROUP BY Dyscyplina HAVING AVG(PozycjaOstatnichZawodow) < 3;

-- 5. Wybierz narodowości, które mają łącznie więcej niż 20 medali
SELECT Narodowosc, SUM(LiczbaMedali) AS SumaMedali FROM Sportowcy GROUP BY Narodowosc HAVING SUM(LiczbaMedali) > 20;

-- 6. Wybierz dyscypliny, które mają średni wynik zawodów poniżej 70
SELECT Dyscyplina, AVG(WynikOstatnichZawodow) AS SredniWynik FROM Sportowcy GROUP BY Dyscyplina HAVING AVG(WynikOstatnichZawodow) < 70;

-- 7. Wybierz narodowości, które mają średnią liczbę lat sportowców poniżej 30
SELECT Narodowosc, AVG(DATEDIFF(CURRENT_DATE, DataUrodzenia)/365) AS SredniaWiek FROM Sportowcy GROUP BY Narodowosc HAVING AVG(DATEDIFF(CURRENT_DATE, DataUrodzenia)/365) < 30;

-- 8. Wybierz dyscypliny, które mają co najmniej jednego sportowca, który zajmował 1 miejsce w zawodach
SELECT Dyscyplina FROM Sportowcy GROUP BY Dyscyplina HAVING MAX(PozycjaOstatnichZawodow) = 1;

-- 9. Wybierz narodowości, które mają średnią pozycję na zawodach większą niż 5
SELECT Narodowosc, AVG(PozycjaOstatnichZawodow) AS SredniaPozycja FROM Sportowcy GROUP BY Narodowosc HAVING AVG(PozycjaOstatnichZawodow) > 5;

-- 10. Wybierz narodowości, które mają łącznie więcej niż 5 sportowców
SELECT Narodowosc, COUNT(*) AS LiczbaSportowcow FROM Sportowcy GROUP BY Narodowosc HAVING COUNT(*) > 5;


--ORDER BY

-- 1. Posortuj sportowców według liczby zdobytych medali rosnąco
SELECT * FROM Sportowcy ORDER BY LiczbaMedali ASC;

-- 2. Posortuj sportowców według liczby zdobytych medali malejąco
SELECT * FROM Sportowcy ORDER BY LiczbaMedali DESC;

-- 3. Posortuj sportowców według daty urodzenia rosnąco
SELECT * FROM Sportowcy ORDER BY DataUrodzenia ASC;

-- 4. Posortuj sportowców według daty urodzenia malejąco
SELECT * FROM Sportowcy ORDER BY DataUrodzenia DESC;

-- 5. Posortuj sportowców według nazwiska alfabetycznie
SELECT * FROM Sportowcy ORDER BY Nazwisko ASC;

-- 6. Posortuj sportowców według wyniku ostatnich zawodów rosnąco
SELECT * FROM Sportowcy ORDER BY WynikOstatnichZawodow ASC;

-- 7. Posortuj sportowców według wyniku ostatnich zawodów malejąco
SELECT * FROM Sportowcy ORDER BY WynikOstatnichZawodow DESC;

-- 8. Posortuj sportowców według pozycji na ostatnich zawodach rosnąco
SELECT * FROM Sportowcy ORDER BY PozycjaOstatnichZawodow ASC;

-- 9. Posortuj sportowców według pozycji na ostatnich zawodach malejąco
SELECT * FROM Sportowcy ORDER BY PozycjaOstatnichZawodow DESC;

-- 10. Posortuj sportowców według liczby zdobytych medali, a następnie według nazwiska
SELECT * FROM Sportowcy ORDER BY LiczbaMedali DESC, Nazwisko ASC;


--LIMIT

-- 1. Wybierz pierwszych 5 sportowców
SELECT * FROM Sportowcy LIMIT 5;

-- 2. Wybierz pierwszych 10 sportowców posortowanych według liczby medali
SELECT * FROM Sportowcy ORDER BY LiczbaMedali DESC LIMIT 10;

-- 3. Wybierz pierwszych 3 sportowców urodzonych po 1990 roku
SELECT * FROM Sportowcy WHERE DataUrodzenia > '1990-01-01' LIMIT 3;

-- 4. Wybierz sportowców, którzy zajęli najlepsze 5 miejsca w ostatnich zawodach
SELECT * FROM Sportowcy ORDER BY PozycjaOstatnichZawodow ASC LIMIT 5;

-- 5. Wybierz 5 sportowców o najwyższym wyniku w ostatnich zawodach
SELECT * FROM Sportowcy ORDER BY WynikOstatnichZawodow DESC LIMIT 5;

-- 6. Wybierz 10 sportowców z najmniejszą liczbą medali
SELECT * FROM Sportowcy ORDER BY LiczbaMedali ASC LIMIT 10;

-- 7. Wybierz pierwszych 7 sportowców o najniższym wyniku w ostatnich zawodach
SELECT * FROM Sportowcy ORDER BY WynikOstatnichZawodow ASC LIMIT 7;

-- 8. Wybierz pierwszych 3 sportowców z Polski
SELECT * FROM Sportowcy WHERE Narodowosc = 'Polska' LIMIT 3;

-- 9. Wybierz pierwszych 10 sportowców z dyscypliny "Pływanie"
SELECT * FROM Sportowcy WHERE Dyscyplina = 'Pływanie' LIMIT 10;

-- 10. Wybierz pierwszych 5 sportowców urodzonych przed 1990 rokiem
SELECT * FROM Sportowcy WHERE DataUrodzenia < '1990-01-01' LIMIT 5;


--Tworzenie dodatkowej tabeli Zawody

CREATE TABLE Zawody (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NazwaZawodow VARCHAR(100),
    DataZawodow DATE,
    Miejsce VARCHAR(100),
    Dyscyplina VARCHAR(50),
    TypZawodow VARCHAR(50),
    ZwyciezcaID INT,
    LiczbaUczestnikow INT,
    NagrodaZaPierwszeMiejsce DECIMAL(10,2),
    RekordZawodow DECIMAL(5,2),
    Organizator VARCHAR(100)
);

-- Wstawianie przykładowych rekordów
INSERT INTO Zawody (NazwaZawodow, DataZawodow, Miejsce, Dyscyplina, TypZawodow, ZwyciezcaID, LiczbaUczestnikow, NagrodaZaPierwszeMiejsce, RekordZawodow, Organizator) VALUES
('Maraton Warszawski', '2024-06-12', 'Warszawa', 'Biegi', 'Indywidualne', 1, 5000, 10000.00, 123.45, 'Polski Związek Lekkiej Atletyki'),
('Mistrzostwa Europy', '2024-04-20', 'Berlin', 'Pływanie', 'Indywidualne', 2, 2000, 50000.00, 59.21, 'Europejska Federacja Pływacka'),
('Liga Światowa', '2024-07-05', 'Nowy Jork', 'Koszykówka', 'Drużynowe', 3, 15000, 100000.00, 95.80, 'Międzynarodowa Federacja Koszykówki'),
('Wimbledon', '2024-06-30', 'Londyn', 'Tenis', 'Indywidualne', 4, 8000, 300000.00, 78.92, 'Międzynarodowa Federacja Tenisowa'),
('Mistrzostwa Świata', '2024-05-15', 'Paryż', 'Siatkówka', 'Drużynowe', 5, 12000, 150000.00, 100.00, 'Międzynarodowa Federacja Siatkówki'),
--Dodanie kolenych rekordów
;


--INNER JOIN 

-- 1. Wybierz sportowców i nazwę zawodów, w których wygrali
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.NazwaZawodow
FROM Sportowcy
INNER JOIN Zawody ON Sportowcy.ID = Zawody.ZwyciezcaID;

-- 2. Wybierz sportowców i rekordy zawodów, które pobili
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.RekordZawodow
FROM Sportowcy
INNER JOIN Zawody ON Sportowcy.ID = Zawody.ZwyciezcaID;

-- 3. Wybierz sportowców, nazwę zawodów i datę zawodów
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.NazwaZawodow, Zawody.DataZawodow
FROM Sportowcy
INNER JOIN Zawody ON Sportowcy.ID = Zawody.ZwyciezcaID;

-- 4. Wybierz dyscypliny sportowców i odpowiednie zawody
SELECT Sportowcy.Dyscyplina, Zawody.NazwaZawodow
FROM Sportowcy
INNER JOIN Zawody ON Sportowcy.Dyscyplina = Zawody.Dyscyplina;

-- 5. Wybierz sportowców i organizatorów zawodów, które wygrali
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.Organizator
FROM Sportowcy
INNER JOIN Zawody ON Sportowcy.ID = Zawody.ZwyciezcaID;


--LEFT JOIN 

-- 1. Wybierz wszystkich sportowców i zawody, które wygrali (jeśli takie są)
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.NazwaZawodow
FROM Sportowcy
LEFT JOIN Zawody ON Sportowcy.ID = Zawody.ZwyciezcaID;

-- 2. Wybierz sportowców i rekordy zawodów, jeśli pobili jakiś rekord
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.RekordZawodow
FROM Sportowcy
LEFT JOIN Zawody ON Sportowcy.ID = Zawody.ZwyciezcaID;

-- 3. Wybierz wszystkich sportowców wraz z zawodami, w których brali udział (jeśli takie są)
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.NazwaZawodow
FROM Sportowcy
LEFT JOIN Zawody ON Sportowcy.ID = Zawody.ZwyciezcaID;

-- 4. Wybierz sportowców i organizatorów zawodów, które wygrali (jeśli takie są)
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.Organizator
FROM Sportowcy
LEFT JOIN Zawody ON Sportowcy.ID = Zawody.ZwyciezcaID;

-- 5. Wybierz wszystkie zawody i sportowców, którzy je wygrali (jeśli tacy są)
SELECT Zawody.NazwaZawodow, Sportowcy.Imie, Sportowcy.Nazwisko
FROM Zawody
LEFT JOIN Sportowcy ON Zawody.ZwyciezcaID = Sportowcy.ID;


--RIGHT JOIN 

-- 1. Wybierz zawody i sportowców, którzy je wygrali (jeśli tacy są)
SELECT Zawody.NazwaZawodow, Sportowcy.Imie, Sportowcy.Nazwisko
FROM Zawody
RIGHT JOIN Sportowcy ON Zawody.ZwyciezcaID = Sportowcy.ID;

-- 2. Wybierz zawody i rekordy sportowców, jeśli takie ustanowili
SELECT Zawody.NazwaZawodow, Zawody.RekordZawodow, Sportowcy.Imie, Sportowcy.Nazwisko
FROM Zawody
RIGHT JOIN Sportowcy ON Zawody.ZwyciezcaID = Sportowcy.ID;

-- 3. Wybierz zawody i daty zawodów oraz sportowców, którzy je wygrali (jeśli tacy są)
SELECT Zawody.NazwaZawodow, Zawody.DataZawodow, Sportowcy.Imie, Sportowcy.Nazwisko
FROM Zawody
RIGHT JOIN Sportowcy ON Zawody.ZwyciezcaID = Sportowcy.ID;

-- 4. Wybierz zawody i dyscypliny sportowe oraz sportowców, którzy wygrali (jeśli tacy są)
SELECT Zawody.NazwaZawodow, Zawody.Dyscyplina, Sportowcy.Imie, Sportowcy.Nazwisko
FROM Zawody
RIGHT JOIN Sportowcy ON Zawody.ZwyciezcaID = Sportowcy.ID;

-- 5. Wybierz organizatorów zawodów i sportowców, którzy je wygrali (jeśli tacy są)
SELECT Zawody.Organizator, Sportowcy.Imie, Sportowcy.Nazwisko
FROM Zawody
RIGHT JOIN Sportowcy ON Zawody.ZwyciezcaID = Sportowcy.ID;


--FULL OUTER JOIN 

-- 1. Wybierz wszystkich sportowców i zawody, które wygrali (jeśli takie są)
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.NazwaZawodow
FROM Sportowcy
FULL OUTER JOIN Zawody ON Sportowcy.ID = Zawody.ZwyciezcaID;

-- 2. Wybierz wszystkie zawody i sportowców, którzy je wygrali (jeśli tacy są)
SELECT Zawody.NazwaZawodow, Sportowcy.Imie, Sportowcy.Nazwisko
FROM Zawody
FULL OUTER JOIN Sportowcy ON Zawody.ZwyciezcaID = Sportowcy.ID;

-- 3. Wybierz wszystkie zawody i rekordy oraz sportowców, którzy je pobili (jeśli tacy są)
SELECT Zawody.NazwaZawodow, Zawody.RekordZawodow, Sportowcy.Imie, Sportowcy.Nazwisko
FROM Zawody
FULL OUTER JOIN Sportowcy ON Zawody.ZwyciezcaID = Sportowcy.ID;

-- 4. Wybierz wszystkie sportowców i zawody, w których brali udział (jeśli takie są)
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.NazwaZawodow
FROM Sportowcy
FULL OUTER JOIN Zawody ON Sportowcy.ID = Zawody.ZwyciezcaID;

-- 5. Wybierz wszystkich organizatorów zawodów i sportowców, którzy je wygrali (jeśli tacy są)
SELECT Zawody.Organizator, Sportowcy.Imie, Sportowcy.Nazwisko
FROM Zawody
FULL OUTER JOIN Sportowcy ON Zawody.ZwyciezcaID = Sportowcy.ID;


--CROSS JOIN 

-- 1. Wybierz wszystkie kombinacje sportowców i zawodów
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.NazwaZawodow
FROM Sportowcy
CROSS JOIN Zawody;

-- 2. Wybierz wszystkie kombinacje sportowców i dyscyplin zawodów
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.Dyscyplina
FROM Sportowcy
CROSS JOIN Zawody;

-- 3. Wybierz wszystkie kombinacje sportowców i dat zawodów
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.DataZawodow
FROM Sportowcy
CROSS JOIN Zawody;

-- 4. Wybierz wszystkie kombinacje sportowców i miejsc zawodów
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.Miejsce
FROM Sportowcy
CROSS JOIN Zawody;

-- 5. Wybierz wszystkie kombinacje sportowców i organizatorów zawodów
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.Organizator
FROM Sportowcy
CROSS JOIN Zawody;


--NATURAL JOIN

-- 1. Wybierz wszystkich sportowców i zawody, które wygrali
SELECT * FROM Sportowcy NATURAL JOIN Zawody;

-- 2. Wybierz sportowców i nazwy zawodów, w których pobili rekord
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.NazwaZawodow FROM Sportowcy NATURAL JOIN Zawody;

-- 3. Wybierz sportowców i organizatorów zawodów, które wygrali
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.Organizator FROM Sportowcy NATURAL JOIN Zawody;

-- 4. Wybierz wszystkich sportowców i dyscypliny zawodów, w których brali udział
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.Dyscyplina FROM Sportowcy NATURAL JOIN Zawody;

-- 5. Wybierz sportowców i nagrody za pierwsze miejsce, które zdobyli
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.NagrodaZaPierwszeMiejsce FROM Sportowcy NATURAL JOIN Zawody;

-- 6. Wybierz sportowców i rekordy zawodów, które pobili
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.RekordZawodow FROM Sportowcy NATURAL JOIN Zawody;

-- 7. Wybierz wszystkich sportowców i miejsca, w których odbywały się zawody
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.Miejsce FROM Sportowcy NATURAL JOIN Zawody;

-- 8. Wybierz sportowców i daty zawodów, które wygrali
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.DataZawodow FROM Sportowcy NATURAL JOIN Zawody;

-- 9. Wybierz sportowców i typy zawodów, które wygrali
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.TypZawodow FROM Sportowcy NATURAL JOIN Zawody;

-- 10. Wybierz wszystkich sportowców i liczbę uczestników zawodów, w których brali udział
SELECT Sportowcy.Imie, Sportowcy.Nazwisko, Zawody.LiczbaUczestnikow FROM Sportowcy NATURAL JOIN Zawody;


--UNION

-- 1. Wybierz wszystkie unikalne dyscypliny sportowców i zawodów
SELECT Dyscyplina FROM Sportowcy UNION SELECT Dyscyplina FROM Zawody;

-- 2. Wybierz wszystkie unikalne miejsca zamieszkania sportowców oraz miejsca zawodów
SELECT MiejsceUrodzenia AS Miejsce FROM Sportowcy UNION SELECT Miejsce FROM Zawody;

-- 3. Wybierz wszystkie unikalne narodowości sportowców i organizatorów zawodów
SELECT Narodowosc FROM Sportowcy UNION SELECT Organizator FROM Zawody;

-- 4. Wybierz wszystkie unikalne imiona sportowców i organizatorów zawodów
SELECT Imie AS Nazwa FROM Sportowcy UNION SELECT Organizator AS Nazwa FROM Zawody;

-- 5. Wybierz wszystkie unikalne typy zawodów i dyscypliny sportowców
SELECT TypZawodow FROM Zawody UNION SELECT Dyscyplina FROM Sportowcy;

-- 6. Wybierz wszystkie unikalne nazwiska sportowców oraz miejsca zawodów
SELECT Nazwisko AS Nazwa FROM Sportowcy UNION SELECT Miejsce AS Nazwa FROM Zawody;

-- 7. Wybierz wszystkie unikalne daty urodzenia sportowców i daty zawodów
SELECT DataUrodzenia AS Data FROM Sportowcy UNION SELECT DataZawodow AS Data FROM Zawody;

-- 8. Wybierz wszystkie unikalne miasta urodzenia sportowców oraz miejsca zawodów
SELECT MiejsceUrodzenia AS Miejsce FROM Sportowcy UNION SELECT Miejsce FROM Zawody;

-- 9. Wybierz wszystkie unikalne narodowości sportowców oraz zwycięzców zawodów
SELECT Narodowosc FROM Sportowcy UNION SELECT ZwyciezcaID FROM Zawody;

-- 10. Wybierz wszystkie unikalne liczby medali sportowców i liczby uczestników zawodów
SELECT LiczbaMedali FROM Sportowcy UNION SELECT LiczbaUczestnikow FROM Zawody;


--UNION ALL 

-- 1. Wybierz wszystkie dyscypliny sportowców i zawodów (z duplikatami)
SELECT Dyscyplina FROM Sportowcy UNION ALL SELECT Dyscyplina FROM Zawody;

-- 2. Wybierz wszystkie miejsca zamieszkania sportowców oraz miejsca zawodów (z duplikatami)
SELECT MiejsceUrodzenia AS Miejsce FROM Sportowcy UNION ALL SELECT Miejsce FROM Zawody;

-- 3. Wybierz wszystkie narodowości sportowców i organizatorów zawodów (z duplikatami)
SELECT Narodowosc FROM Sportowcy UNION ALL SELECT Organizator FROM Zawody;

-- 4. Wybierz wszystkie imiona sportowców i organizatorów zawodów (z duplikatami)
SELECT Imie AS Nazwa FROM Sportowcy UNION ALL SELECT Organizator AS Nazwa FROM Zawody;

-- 5. Wybierz wszystkie typy zawodów i dyscypliny sportowców (z duplikatami)
SELECT TypZawodow FROM Zawody UNION ALL SELECT Dyscyplina FROM Sportowcy;

-- 6. Wybierz wszystkie nazwiska sportowców oraz miejsca zawodów (z duplikatami)
SELECT Nazwisko AS Nazwa FROM Sportowcy UNION ALL SELECT Miejsce AS Nazwa FROM Zawody;

-- 7. Wybierz wszystkie daty urodzenia sportowców i daty zawodów (z duplikatami)
SELECT DataUrodzenia AS Data FROM Sportowcy UNION ALL SELECT DataZawodow AS Data FROM Zawody;

-- 8. Wybierz wszystkie miasta urodzenia sportowców oraz miejsca zawodów (z duplikatami)
SELECT MiejsceUrodzenia AS Miejsce FROM Sportowcy UNION ALL SELECT Miejsce FROM Zawody;

-- 9. Wybierz wszystkie narodowości sportowców oraz zwycięzców zawodów (z duplikatami)
SELECT Narodowosc FROM Sportowcy UNION ALL SELECT ZwyciezcaID FROM Zawody;

-- 10. Wybierz wszystkie liczby medali sportowców i liczby uczestników zawodów (z duplikatami)
SELECT LiczbaMedali FROM Sportowcy UNION ALL SELECT LiczbaUczestnikow FROM Zawody;


--UPDATE 

-- 1. Zaktualizuj liczbę medali dla sportowca o ID 1
UPDATE Sportowcy SET LiczbaMedali = 10 WHERE ID = 1;

-- 2. Zaktualizuj datę urodzenia sportowca o ID 2
UPDATE Sportowcy SET DataUrodzenia = '1995-08-15' WHERE ID = 2;

-- 3. Zaktualizuj narodowość wszystkich sportowców na 'Polska'
UPDATE Sportowcy SET Narodowosc = 'Polska';

-- 4. Zaktualizuj wynik ostatnich zawodów dla sportowca o ID 3
UPDATE Sportowcy SET WynikOstatnichZawodow = 12.34 WHERE ID = 3;

-- 5. Zaktualizuj dyscyplinę sportowca o ID 4 na 'Piłka nożna'
UPDATE Sportowcy SET Dyscyplina = 'Piłka nożna' WHERE ID = 4;

-- 6. Zaktualizuj liczbę uczestników dla zawodów o ID 1
UPDATE Zawody SET LiczbaUczestnikow = 6000 WHERE ID = 1;

-- 7. Zaktualizuj miejsce zawodów o ID 2 na 'Warszawa'
UPDATE Zawody SET Miejsce = 'Warszawa' WHERE ID = 2;

-- 8. Zaktualizuj nazwę zawodów o ID 3 na 'Mistrzostwa Europy'
UPDATE Zawody SET NazwaZawodow = 'Mistrzostwa Europy' WHERE ID = 3;

-- 9. Zaktualizuj rekord zawodów o ID 4
UPDATE Zawody SET RekordZawodow = 9.58 WHERE ID = 4;

-- 10. Zaktualizuj nagrodę za pierwsze miejsce dla zawodów o ID 5 na 5000 PLN
UPDATE Zawody SET NagrodaZaPierwszeMiejsce = 5000 WHERE ID = 5;


--DROP

-- 1. Usuń tabelę Sportowcy
DROP TABLE Sportowcy;

-- 2. Usuń tabelę Zawody
DROP TABLE Zawody;

-- 3. Usuń indeks na kolumnie Imie z tabeli Sportowcy
DROP INDEX idx_imie ON Sportowcy;

-- 4. Usuń widok SportowcyView
DROP VIEW SportowcyView;

-- 5. Usuń widok ZawodyView
DROP VIEW ZawodyView;

-- 6. Usuń procedurę składowaną UsunSportowca
DROP PROCEDURE UsunSportowca;

-- 7. Usuń funkcję LiczbaMedali
DROP FUNCTION LiczbaMedali;

-- 8. Usuń wyzwalacz TrigerUsunZawody
DROP TRIGGER TrigerUsunZawody;

-- 9. Usuń sekwencję SeqID
DROP SEQUENCE SeqID;

-- 10. Usuń bazę danych SportDB
DROP DATABASE SportDB;


--TRUNCATE 

-- 1. Wyczyść tabelę Sportowcy
TRUNCATE TABLE Sportowcy;

-- 2. Wyczyść tabelę Zawody
TRUNCATE TABLE Zawody;

-- 3. Wyczyść tabelę HistoriaSportowcow
TRUNCATE TABLE HistoriaSportowcow;

-- 4. Wyczyść tabelę RekordyZawodow
TRUNCATE TABLE RekordyZawodow;

-- 5. Wyczyść tabelę UczestnicyZawodow
TRUNCATE TABLE UczestnicyZawodow;

-- 6. Wyczyść tabelę Trenerzy
TRUNCATE TABLE Trenerzy;

-- 7. Wyczyść tabelę Sponsorzy
TRUNCATE TABLE Sponsorzy;

-- 8. Wyczyść tabelę Mecze
TRUNCATE TABLE Mecze;

-- 9. Wyczyść tabelę ObiektySportowe
TRUNCATE TABLE ObiektySportowe;

-- 10. Wyczyść tabelę Zgłoszenia
TRUNCATE TABLE Zgłoszenia;


--ALTER 

-- 1. Dodaj kolumnę Klub do tabeli Sportowcy
ALTER TABLE Sportowcy ADD Klub VARCHAR(100);

-- 2. Zmień nazwę kolumny Miejsce na Miasto w tabeli Zawody
ALTER TABLE Zawody RENAME COLUMN Miejsce TO Miasto;

-- 3. Zmień typ danych kolumny LiczbaMedali na INT w tabeli Sportowcy
ALTER TABLE Sportowcy MODIFY COLUMN LiczbaMedali INT;

-- 4. Usuń kolumnę WynikOstatnichZawodow z tabeli Sportowcy
ALTER TABLE Sportowcy DROP COLUMN WynikOstatnichZawodow;

-- 5. Dodaj klucz obcy do tabeli Zawody (kolumna ZwyciezcaID odnosi się do ID w tabeli Sportowcy)
ALTER TABLE Zawody ADD CONSTRAINT FK_Zawody_Sportowcy FOREIGN KEY (ZwyciezcaID) REFERENCES Sportowcy(ID);

-- 6. Dodaj indeks na kolumnie NazwaZawodow w tabeli Zawody
ALTER TABLE Zawody ADD INDEX idx_nazwa_zawodow (NazwaZawodow);

-- 7. Dodaj ograniczenie na unikalność kolumny Imie i Nazwisko w tabeli Sportowcy
ALTER TABLE Sportowcy ADD CONSTRAINT UQ_ImieNazwisko UNIQUE (Imie, Nazwisko);

-- 8. Zmień nazwę tabeli Zawody na Turnieje
ALTER TABLE Zawody RENAME TO Turnieje;

-- 9. Dodaj kolumnę DataZmiany do tabeli Sportowcy
ALTER TABLE Sportowcy ADD DataZmiany TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 10. Zmień nazwę kolumny Dyscyplina na Sport w tabeli Sportowcy
ALTER TABLE Sportowcy RENAME COLUMN Dyscyplina TO Sport;


--RENAME

-- 1. Zmień nazwę tabeli Sportowcy na Atleci
ALTER TABLE Sportowcy RENAME TO Atleci;

-- 2. Zmień nazwę tabeli Zawody na Wydarzenia
ALTER TABLE Zawody RENAME TO Wydarzenia;

-- 3. Zmień nazwę kolumny NazwaZawodow na NazwaTurnieju w tabeli Zawody
ALTER TABLE Zawody RENAME COLUMN NazwaZawodow TO NazwaTurnieju;

-- 4. Zmień nazwę kolumny Imie na PierwszeImie w tabeli Sportowcy
ALTER TABLE Sportowcy RENAME COLUMN Imie TO PierwszeImie;

-- 5. Zmień nazwę tabeli Trenerzy na Szkoleniowcy
ALTER TABLE Trenerzy RENAME TO Szkoleniowcy;

-- 6. Zmień nazwę kolumny Miejsce na Lokalizacja w tabeli Zawody
ALTER TABLE Zawody RENAME COLUMN Miejsce TO Lokalizacja;

-- 7. Zmień nazwę kolumny LiczbaMedali na MedalCount w tabeli Sportowcy
ALTER TABLE Sportowcy RENAME COLUMN LiczbaMedali TO MedalCount;

-- 8. Zmień nazwę kolumny DataUrodzenia na DataNarodzin w tabeli Sportowcy
ALTER TABLE Sportowcy RENAME COLUMN DataUrodzenia TO DataNarodzin;

-- 9. Zmień nazwę tabeli Sponsorzy na Wspierajacy
ALTER TABLE Sponsorzy RENAME TO Wspierajacy;

-- 10. Zmień nazwę kolumny Organizator na Organizacja w tabeli Zawody
ALTER TABLE Zawody RENAME COLUMN Organizator TO Organizacja;


--DELETE

-- 1. Usuń sportowca o ID 1
DELETE FROM Sportowcy WHERE ID = 1;

-- 2. Usuń wszystkie sportowców, którzy zdobyli mniej niż 2 medale
DELETE FROM Sportowcy WHERE LiczbaMedali < 2;

-- 3. Usuń wszystkie zawody, które odbyły się przed 2020 rokiem
DELETE FROM Zawody WHERE DataZawodow < '2020-01-01';

-- 4. Usuń sportowców, których narodowość to 'Niemcy'
DELETE FROM Sportowcy WHERE Narodowosc = 'Niemcy';

-- 5. Usuń zawody, które miały mniej niż 100 uczestników
DELETE FROM Zawody WHERE LiczbaUczestnikow < 100;

-- 6. Usuń wszystkich sportowców z dyscypliny 'Szachy'
DELETE FROM Sportowcy WHERE Dyscyplina = 'Szachy';

-- 7. Usuń wszystkie zawody, które odbyły się w 'Warszawa'
DELETE FROM Zawody WHERE Miejsce = 'Warszawa';

-- 8. Usuń sportowców, którzy nie ustanowili żadnego rekordu
DELETE FROM Sportowcy WHERE WynikOstatnichZawodow IS NULL;

-- 9. Usuń wszystkie zawody organizowane przez 'SportClub'
DELETE FROM Zawody WHERE Organizator = 'SportClub';

-- 10. Usuń sportowców, którzy urodzili się przed 1990 rokiem
DELETE FROM Sportowcy WHERE DataUrodzenia < '1990-01-01';


--VIEW 

-- 1. Utwórz widok dla sportowców z liczbą medali większą niż 5
CREATE VIEW SportowcyMedalisci AS
SELECT * FROM Sportowcy WHERE LiczbaMedali > 5;

-- 2. Utwórz widok dla zawodów, które odbyły się po 2020 roku
CREATE VIEW NoweZawody AS
SELECT * FROM Zawody WHERE DataZawodow > '2020-01-01';

-- 3. Utwórz widok dla sportowców z narodowości 'Polska'
CREATE VIEW PolscySportowcy AS
SELECT * FROM Sportowcy WHERE Narodowosc = 'Polska';

-- 4. Utwórz widok dla zawodów, w których uczestniczyło więcej niż 500 osób
CREATE VIEW DuzeZawody AS
SELECT * FROM Zawody WHERE LiczbaUczestnikow > 500;

-- 5. Utwórz widok dla sportowców urodzonych po 1995 roku
CREATE VIEW MlodsiSportowcy AS
SELECT * FROM Sportowcy WHERE DataUrodzenia > '1995-01-01';

-- 6. Utwórz widok dla zawodów, które odbyły się w 'Warszawa'
CREATE VIEW ZawodyWarszawa AS
SELECT * FROM Zawody WHERE Miejsce = 'Warszawa';

-- 7. Utwórz widok dla rekordzistów sportowych
CREATE VIEW Rekordzisci AS
SELECT Imie, Nazwisko, Dyscyplina FROM Sportowcy WHERE WynikOstatnichZawodow IS NOT NULL;

-- 8. Utwórz widok dla zawodów z nagrodą za pierwsze miejsce powyżej 1000 PLN
CREATE VIEW ZawodyZNagroda AS
SELECT * FROM Zawody WHERE NagrodaZaPierwszeMiejsce > 1000;

-- 9. Utwórz widok dla sportowców z określoną liczbą medali
CREATE VIEW SportowcyWgMedali AS
SELECT Imie, Nazwisko, LiczbaMedali FROM Sportowcy ORDER BY LiczbaMedali DESC;

-- 10. Utwórz widok dla zawodów z rekordem poniżej 10 sekund
CREATE VIEW ZawodyRekordowe AS
SELECT * FROM Zawody WHERE RekordZawodow < 10;


--INDEX 

-- 1. Utwórz indeks na kolumnie Imie w tabeli Sportowcy
CREATE INDEX idx_imie ON Sportowcy(Imie);

-- 2. Utwórz indeks na kolumnie Nazwisko w tabeli Sportowcy
CREATE INDEX idx_nazwisko ON Sportowcy(Nazwisko);

-- 3. Utwórz indeks na kolumnie Dyscyplina w tabeli Sportowcy
CREATE INDEX idx_dyscyplina ON Sportowcy(Dyscyplina);

-- 4. Utwórz indeks na kolumnie DataZawodow w tabeli Zawody
CREATE INDEX idx_data_zawodow ON Zawody(DataZawodow);

-- 5. Utwórz indeks na kolumnie Miejsce w tabeli Zawody
CREATE INDEX idx_miejsce ON Zawody(Miejsce);

-- 6. Utwórz indeks na kolumnie LiczbaMedali w tabeli Sportowcy
CREATE INDEX idx_liczba_medali ON Sportowcy(LiczbaMedali);

-- 7. Utwórz indeks na kolumnie Organizator w tabeli Zawody
CREATE INDEX idx_organizator ON Zawody(Organizator);

-- 8. Utwórz indeks na kolumnie RekordZawodow w tabeli Zawody
CREATE INDEX idx_rekord_zawodow ON Zawody(RekordZawodow);

-- 9. Utwórz indeks na kolumnie Narodowosc w tabeli Sportowcy
CREATE INDEX idx_narodowosc ON Sportowcy(Narodowosc);

-- 10. Utwórz indeks na kolumnie TypZawodow w tabeli Zawody
CREATE INDEX idx_typ_zawodow ON Zawody(TypZawodow);


--LIKE 

-- 1. Wybierz sportowców, których imię zaczyna się na 'A'
SELECT * FROM Sportowcy WHERE Imie LIKE 'A%';

-- 2. Wybierz sportowców, których nazwisko kończy się na 'ski'
SELECT * FROM Sportowcy WHERE Nazwisko LIKE '%ski';

-- 3. Wybierz sportowców, których imię zawiera 'ar'
SELECT * FROM Sportowcy WHERE Imie LIKE '%ar%';

-- 4. Wybierz zawody, które odbyły się w mieście zaczynającym się na 'W'
SELECT * FROM Zawody WHERE Miejsce LIKE 'W%';

-- 5. Wybierz zawody, których nazwa zawiera 'Mistrzostwa'
SELECT * FROM Zawody WHERE NazwaZawodow LIKE '%Mistrzostwa%';

-- 6. Wybierz sportowców, których imię ma 4 litery
SELECT * FROM Sportowcy WHERE Imie LIKE '____';

-- 7. Wybierz zawody, których organizator ma 'Club' w nazwie
SELECT * FROM Zawody WHERE Organizator LIKE '%Club%';

-- 8. Wybierz sportowców, których narodowość zaczyna się na 'P'
SELECT * FROM Sportowcy WHERE Narodowosc LIKE 'P%';

-- 9. Wybierz sportowców, których nazwisko zawiera 'kow'
SELECT * FROM Sportowcy WHERE Nazwisko LIKE '%kow%';

-- 10. Wybierz zawody, których miejsce ma 5 liter
SELECT * FROM Zawody WHERE Miejsce LIKE '_____';


--CASE WHEN

-- 1. Wyświetl imiona i nazwiska sportowców oraz etykietę 'Wielu Medali' lub 'Mało Medali'
SELECT Imie, Nazwisko,
       CASE 
           WHEN LiczbaMedali > 5 THEN 'Wielu Medali'
           ELSE 'Mało Medali'
       END AS MedalStatus
FROM Sportowcy;

-- 2. Wyświetl nazwiska sportowców oraz etykietę 'Młody' lub 'Starszy' w zależności od wieku
SELECT Nazwisko,
       CASE 
           WHEN YEAR(CURDATE()) - YEAR(DataUrodzenia) < 25 THEN 'Młody'
           ELSE 'Starszy'
       END AS WiekGrupa
FROM Sportowcy;

-- 3. Wyświetl zawody oraz etykietę 'Duże Zawody' lub 'Małe Zawody'
SELECT NazwaZawodow,
       CASE 
           WHEN LiczbaUczestnikow > 500 THEN 'Duże Zawody'
           ELSE 'Małe Zawody'
       END AS TypZawodow
FROM Zawody;

-- 4. Wyświetl imiona sportowców oraz etykietę 'Polak' lub 'Obcokrajowiec'
SELECT Imie,
       CASE 
           WHEN Narodowosc = 'Polska' THEN 'Polak'
           ELSE 'Obcokrajowiec'
       END AS Pochodzenie
FROM Sportowcy;

-- 5. Wyświetl zawody oraz etykietę 'Rekordowy' lub 'Bez Rekordu'
SELECT NazwaZawodow,
       CASE 
           WHEN RekordZawodow < 10 THEN 'Rekordowy'
           ELSE 'Bez Rekordu'
       END AS StatusRekordu
FROM Zawody;

-- 6. Wyświetl sportowców oraz etykietę 'Lekkoatleta' lub 'Inny Sportowiec'
SELECT Imie, Nazwisko,
       CASE 
           WHEN Dyscyplina = 'Lekkoatletyka' THEN 'Lekkoatleta'
           ELSE 'Inny Sportowiec'
       END AS TypSportowca
FROM Sportowcy;

-- 7. Wyświetl zawody oraz etykietę 'Lokalne' lub 'Międzynarodowe'
SELECT NazwaZawodow,
       CASE 
           WHEN TypZawodow = 'Lokalne' THEN 'Lokalne'
           ELSE 'Międzynarodowe'
       END AS ZasiegZawodow
FROM Zawody;

-- 8. Wyświetl sportowców oraz etykietę 'Rekordzista' lub 'Bez Rekordu'
SELECT Imie, Nazwisko,
       CASE 
           WHEN WynikOstatnichZawodow IS NOT NULL THEN 'Rekordzista'
           ELSE 'Bez Rekordu'
       END AS StatusWyniku
FROM Sportowcy;

-- 9. Wyświetl zawody oraz etykietę 'Wysoka Nagroda' lub 'Niska Nagroda'
SELECT NazwaZawodow,
       CASE 
           WHEN NagrodaZaPierwszeMiejsce > 10000 THEN 'Wysoka Nagroda'
           ELSE 'Niska Nagroda'
       END AS StatusNagrody
FROM Zawody;

-- 10. Wyświetl sportowców oraz etykietę 'Junior' lub 'Senior'
SELECT Imie, Nazwisko,
       CASE 
           WHEN YEAR(CURDATE()) - YEAR(DataUrodzenia) < 18 THEN 'Junior'
           ELSE 'Senior'
       END AS GrupaWiekowa
FROM Sportowcy;