# Back Buddy - projekt dbający o twój komfort w miejscu pracy



## Nasze Cele
Obecnie jednym z głównych problemów współczesnego pracownika jest zdrowie psychiczne, do czego przyczynia się często przygnębiające otoczenie pracy. Chcieliśmy stworzyć narzędzie, dzięki któremu przestrzeń biurowa mogłaby stać się ciekawsza i przede wszystkim - zdrowsza!
Wiemy, jak często zdrowie fizyczne łączy się z dobrym samopoczuciem, dlatego wpadliśmy na pomysł systemu monitorującego postawę siedzenia za pomocą **tensometru, akcelerometru i czujników odległości TOF.** Postawę pracownik może monitorować **na dedykowanej aplikacji mobilnej, wraz z elementami grywalizacji pomiędzy współpracownikami** lub dostając znak o niepoprawnej postawie za pomocą wibracji w podłokietniku.

## Użyte narzędzia
- Raspberry Pi 4B 2G
- Czujniki TOF
- Akcelerometr
- Tensometr
---
- Serwer stworzony w FastAPI, przechowujący dane użytkowników o ich postawach i zdobytych punktach
- Raspberry Pi komunikuje się za pomocą protokołu HTTP z naszym serwerem
- Aplikacja mobilna stworzona w technologii Flutter pobiera dane z serwera również z pomocą protokołu HTTP


## Mocne strony naszego rozwiązania
- Ograniczamy bodźce - wibracje, zamiast powiadomień
- Względnie dokładne wykrycie poprawnej postawy
- Dedykowana aplikacja mobilna wraz z funkcją podglądu swojej postawy na żywo
- System nagród motywuje pracowników - dzięki rankingowi, współpracownicy mogą ze sobą rywalizować w "konkursie prostega siedzenia", wraz z możliwością otrzymania comiesięcznych nagród dla najlepszych!
 
## Potencjał na rozwój w przyszłości
- Możliwość kalibracji dowolnego siedzenia
- Haptyka w dwóch podłokietnikach dla lepszych odczuć
- Wbudowane powiadomienia w aplikacji informujące o dokładniejszych wadach postawy
<p align="center">
  <img src="https://github.com/muxonn/best-hacking-league-2024/assets/40025452/6f4ea75c-35d9-4b79-8f26-ff7c2c0a06cb" alt="logo-transparent">
</p>

Projekt stworzony przez: Jakuba Mądrego, Szymona Pawłowskiego, Antoniego Pękałę, Piotra Wojciechowskiego

