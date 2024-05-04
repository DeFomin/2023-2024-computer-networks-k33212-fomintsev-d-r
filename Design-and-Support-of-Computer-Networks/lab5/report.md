## Лабораторная работа № 5.
## Основы безопасности. Списки доступа Access List (ACL). Межсетевой экран Cisco ASA.

## Оглавление:
- [Цель работы](#section1)
- [Требования](#section1.2)
- [Краткие теоретические сведения](#section1.3)
- [Ход работы](#section1.5)
  - [Часть 1. Настройка ACL.](#section2)
  - [Установка и настройка Cisco ASA.](#section2.1)
- [Вывод](#section3)

## <a name="section1">Цель работы</a>  
Работа с безопасностью в корпоративной сети. Настройка списков доступа.

## <a name="section1.2">Требования</a> 
Для выполнения работы необходима установленная среда моделирования Cisco Packet Tracer и выполненные предыдущие лабораторные работы. 

## <a name="section1.3">Краткие теоретические сведения</a>   
ACL (Access Control List) — это набор текстовых выражений, которые что-то разрешают, либо что-то запрещают. Обычно ACL разрешает или запрещает IP-пакеты, но помимо всего прочего он может заглядывать внутрь IP-пакета, просматривать тип пакета, TCP и UDP порты. Также ACL существует для различных сетевых протоколов (IP, IPX, AppleTalk и так далее). В основном применение списков доступа рассматривают с точки зрения пакетной фильтрации, то есть пакетная фильтрация необходима в тех ситуациях, когда у вас стоит оборудование на границе Интернет и вашей частной сети и нужно отфильтровать ненужный трафик.
Функционал ACL состоит в классификации трафика, нужно его проверить сначала, а потом что-то с ним сделать в зависимости от того, куда ACL применяется. ACL применяется везде, например:
    • На интерфейсе: пакетная фильтрация
    • На линии Telnet: ограничения доступа к маршрутизатору
    • VPN: какой трафик нужно шифровать
    • QoS: какой трафик обрабатывать приоритетнее
    • NAT: какие адреса транслировать
Для применения ACL для всех этих компонентов нужно понять как они работают. И мы в первую очередь будем касаться пакетной фильтрации. Применительно к пакетной фильтрации, ACL размещаются на интерфейсах, сами они создаются независимо, а уже потом они прикручиваются к интерфейсу. Как только вы его прикрутили к интерфейсу маршрутизатор начинает просматривать трафик. Маршрутизатор рассматривает трафик как входящий и исходящий. Тот трафик, который входит в маршрутизатор называется входящим, тот который из него выходит — исходящий. Соответственно ACL размещаются на входящем или на исходящем направлении.
Виды Access List-ов
    • Стандартыне
    • Расширенные
    • Динамические
    • Рефлексивные
    • Временные

Cisco ASA (Adaptive Security Appliance) — серия аппаратных межсетевых экранов, разработанных компанией Cisco Systems. Cisco ASA является аппаратным межсетевым экраном с инспектированием сессий с сохранением состояния (stateful inspection). ASA умеет работать в двух режимах: routed (режим маршрутизатора, по умолчанию) и transparent (прозрачный межсетевой экран, когда ASA работает как бридж с фильтрацией). Представлен в Cisco Packet Tracer.

## <a name="section1.5">Ход работы</a>  

## <a name="section2">Часть 1. Настройка ACL.</a>  

Необходимо реализовать данный ACL

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/025334ea-0020-4e34-8217-7726942f44a8" width=700></p>

1. ПК сотрудников, Компьютеры начальства, Компьютеры бухгалтерии -> Разрешено -> Принтеры, Серверы


<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/ce5fd86e-d4dc-46ed-8ff1-261710fe8022" width=700></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/c551cd9e-95ab-4349-8460-fb141a861826" width=700></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/c4d5c106-fc06-4804-93fc-cb783bc5473d" width=700></p>


2. ПК прочих сотрудников -> запрещено -> Компьютеры бухгалтерии


<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/a17ce87c-d31c-4a20-bc40-46e9499bad68"></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/d5172959-9d09-4bc2-a6a4-12ffaedb26eb"></p>

out: Это означает, что список доступа будет применяться к пакетам, покидающим данный субинтерфейс. То есть список доступа будет проверяться перед отправкой пакетов из субинтерфейса в сеть.

in: Если бы использовался in, список доступа проверялся бы для пакетов, входящих в данный субинтерфейс. То есть список доступа проверялся бы после получения пакетов, но до того, как они будут переданы в обработку маршрутизатором.

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/7d8194fd-6fb1-44a8-962b-ac3b4425d905" width=700></p>

3. IP телефоны -> разрешено -> Определенный сервер: IP телефония

Изначально был создан новый сервер, который будет предназначаться для IP телефонии

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/30f81fce-2f23-4915-b47a-e2b5291261a2" width=700></p>

И разрешен доступ к серверам для телефонов

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/38cc5ef8-c630-4965-9cbf-020c3d93281a" width=700></p>


<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/a8b71fd9-3813-4c0f-8e5a-98c405554d33" width=700></p>


<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/3e27e62a-7d8c-4d39-b36a-1ff3f49ca9a3" width=700></p>


<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/b23d1b36-447d-46cb-bea0-44b48f3e633d" width=700></p>

## <a name="section2.1">Установка и настройка Cisco ASA.</a>  

Настройка security level. Для внутренного понизим уровень доверенного влана до 80 приоритетен. Для наружного оставим более приоритетный 0. 

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/ce10ba5c-fa85-4835-bd64-eea7949df942" width=700></p>

Путь до роутера провайдера от сетевого экрана

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/c85133f9-b27d-431e-bc34-b3327e7f9f8b" width=700></p>

Теперь у нас есть доступ от ASA до сервера интернета

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/07819a23-8bf8-4b3d-aea6-5499c699bd86" width=700></p>

На самом маршрутизаторе был прописан маршрут в локальную сеть через ip ASA

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/87597149-66b0-4927-850b-2a7199c14778" width=700></p>

Настроим инспекцию пакетов с запоминанием состояния

* Тип трафика
* Политика трафика (инспекция)
* Направление (у нас оба направления global)

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/ef566891-2e96-44fa-82ee-2795b5471e14" width=700></p>

Теперь нам надо перенастроить NAT. Сперва удаляем статические адреса с маршрутизатора провайдера и локального роутера, на последнем создаем новый маршрут направленныйы на ASA  
```ip route 0.0.0.0 0.0.0.0 192.168.1.1```

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/2ab2cd2d-11c6-46a8-bd77-cce120872fef" width=700></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/85823c7d-0010-4970-911f-ed16995a7f92" width=700></p>



Попасть в локальную сеть извне уже нельзя

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/79047ebb-351f-4151-9d80-409966d0cfe2" width=700></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/c60d6b02-9476-44cc-9ee9-8ba22f541e27" width=700></p>

## <a name="section3">Вывод</a>  

В ходе выполнения лабораторной работы была произведена настройка ACL, а также установлен и настроен межсетевой экран Cisco ASA.















