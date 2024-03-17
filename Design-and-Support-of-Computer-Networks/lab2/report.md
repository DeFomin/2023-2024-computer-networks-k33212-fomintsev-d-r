## Лабораторная работа № 2.  
## Настройка коммутации уровня доступа.  

## Оглавление:
- [Цель работы](#section1)
- [Краткие теоретические сведения](#section1.2)
- [Требования](#section1.3)
- [Описание задач](#section1.4)
- [Ход работы](#section1.5)
  - [Часть 1. Установка коммутаторов](#section2)
  - [Часть 2. Настройка VLAN](#section2.1)
- [Вывод](#section3) 

## <a name="section1">Цель работы</a> 

Установка коммутаторов уровня доступа в корпоративную сеть. Настройка коммутаторов уровня доступа. Настройка VLAN. Настройка локальных подсетей внутри предприятия.  

## <a name="section1.2">Краткие теоретические сведения</a>

Все пространство IP адресов делится на логические группы – IP-сети предназначенные для организации иерархической адресации в составной IP-сети, например Интернете. Каждой локальной сети присваивается своя IP-сеть. Маршрут до IP-узлов, находящихся в этой локальной сети, строится на маршрутизаторах как маршрут до их IP-сети. Только после того, как пакет попал в конкретную IP-сеть, решается задача его доставки на отдельный узел.
В IP-адресе выделяются две части – адрес сети и адрес узла. Деление происходит с помощью маски – 4-x байтного числа, которое поставлено в соответствие IP-адресу. Макса содержит двоичные 1 в тех разрядах IP-адреса, которые определяют адрес сети и двоичные 0 в тех разрядах IP адреса, которые определяют адрес узла. 
Адресом IP-сети считается IP-адрес из этой сети, в котором в поле адреса узла содержатся двоичные 0. Этот адрес обозначает сеть целиком в таблицах маршрутизации. Есть еще служебный IP-адрес – адрес ограниченного широковещания – в поле адреса узла он содержит двоичные 1. Оба эти адреса не используются для адресации реальных узлов сети, однако входят в диапазон адресов IP-сети.


VLAN (Virtual Local Area Network) — группа устройств, имеющих возможность взаимодействовать между собой напрямую на канальном уровне, хотя физически при этом они могут быть подключены к разным сетевым коммутаторам. 
К основным преимуществам использования VLAN относятся:
    1. Безопасность: группы, обладающие уязвимыми данными, отделены от остальной части сети, благодаря чему снижается вероятность утечки конфиденциальной информации.
    2. Снижение расходов: благодаря экономии на дорогих обновлениях сетевой инфраструктуры и более эффективному использованию имеющейся полосы пропускания и восходящих каналов происходит снижение расходов.
    3. Повышение производительности: разделение однородных сетей 2-го уровня на несколько логических рабочих групп (широковещательных доменов) уменьшает количество лишнего сетевого трафика и повышает производительность.
    4. Уменьшенные широковещательные домены: разделение сети на сети VLAN уменьшает количество устройств в широковещательном домене. 
    5. Повышение производительности ИТ-отдела: сети VLAN упрощают управление сетью, поскольку пользователи с аналогичными требованиями к сети используют одну и ту же сеть VLAN. При введении в эксплуатацию нового коммутатора на назначенных портах реализуются все правила и процедуры, уже применённые в этой конкретной VLAN. Также ИТ-специалистам легче определять функцию сети VLAN, назначая ей соответствующее имя.
В коммутаторах могут быть реализованы следующие типы VLAN:
•	на основе портов;
•	на основе стандарта IEEE 802.1Q;
•	на основе стандарта IEEE 802.1ad (Q-in-Q VLAN);
•	на основе портов и протоколов IEEE 802.1v;
•	на основе MAC-адресов;
•	асимметричные.

## <a name="section1.3">Требования</a>

Для выполнения работы необходима установленная среда моделирования Cisco Packet Tracer. 

## <a name="section1.4">Описание задачи</a>

Устройства уровня доступа это, как правило, коммутаторы второго уровня (L2) модели OSI, т.е. без функции маршрутизации. Коммутаторы осуществляют первичное сегментирование сети (технология VLAN).
Оборудование которое может применяться в качестве уровня доступа (разные коммутаторы представлены в разных версиях CPT):
    • Cisco Catalyst 4507R+E 7-slot Chassis with 48Gbps per slot
    • Cisco Catalyst 4500 E-Series Supervisor Engine 7L-E
    • Cisco Catalyst 4500 E-Series 48 Ethernet 10/100/1000 (RJ45) PoE+ ports
    • Cisco Catalyst 4500 E-Series 48 Ethernet 10/100/1000 (RJ45) PoE+, UPoE ports
    • Cisco Catalyst 3750-X Series Stackable 48 Ethernet 10/100/1000 PoE+ ports
    • Cisco Catalyst 3750-X Series Stackable 24 Ethernet 10/100/1000 PoE+ ports
    • Cisco Catalyst 3560-X Series Standalone 48 Ethernet 10/100/1000 PoE+ ports
    • Cisco Catalyst 3560-X Series Standalone 24 Ethernet 10/100/1000 PoE+ ports
    • Cisco Catalyst 2960-S Series 48 Ethernet 10/100/1000 PoE+ ports and Two 10GbE SFP+ Uplink ports
    • Cisco Catalyst 2960-S Series 48 Ethernet 10/100/1000 PoE+ ports and Four GbE SFP Uplink ports
    • Cisco Catalyst 2960-S Series 24 Ethernet 10/100/1000 PoE+ ports and Two 10GbE SFP+ Uplink ports
    • Cisco Catalyst 2960-S Series 24 Ethernet 10/100/1000 PoE+ ports and Four GbE SFP Uplink port

## <a name="section1.5">Ход работы</a>  
### <a name="section2">Часть 1. Установка коммутаторов</a>  


### <a name="section2.1">Часть 2. Настройка VLAN</a>  

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/628ddc33-ff0d-40c8-b331-2f339b54fa33" width=700></p>

### Офис №3
Настройка switch 1 
ПК (сотрудники, vlan 80)

Сначала для всех коммутаторов была добавлена информация о всех существующих VLAN:

```
interface range FastEthernet0/n - (n+k)
switchport access vlan N
```

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/a0e63bbc-b1e3-4960-bd4e-fbd96596dfeb)

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/e72e8789-0c1a-4363-9ff4-694621fd32b9)


![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/726146a5-ec73-4b2d-984f-d75464c4e05e)

Аналогично для остальных устройств. Настройка switch 2 (vlan 10/20/30/40) 

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/74638076-743a-48a4-a19d-5b83fc9b3f47)

* Агрегация

switch2  
![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/ece26570-7ee8-4024-bdb1-78b2766fe2a4)

switch1  
![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/d5b83bce-4852-4d49-8294-59818b5c45d5)

Включение интерфейсов на switch2  
![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/f66e0077-0f1a-477b-a8ed-97ef911e6fbd)


Соответственно можно убедиться в работоспособности через команду ```show etherchannel port-channel``` и ```show etherchannel summary```

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/b3b9cf87-3967-4c0f-b6d7-530bfeaea25d)

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/ed7a093b-ca53-4038-94c2-fee50eb498b2)


![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/30627df8-5533-4056-a1ce-25dfcc7f9684)

### Офис №2

Соответственно действиям, связанным с установкой коммутаторов в офисе 3, устанавливаем коммутаторы в офисе 2

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/8eb717f4-9db8-4b15-8ecd-20cf6212dfac)

* switch 1

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/da55454a-3dfc-4eac-82ed-61cea165cbd1)


* switch 2

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/96d6d886-56b2-4fdf-8f33-fd0397157b75)


* Агрегация

Также как и в офисе 3

* switch 1  
![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/3e45c9c0-1496-4194-a57a-66001c2c1102)

* switch 2  
![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/e5e1be1e-4803-41ab-a77c-ca69a32f7f04)


Работоспособность:

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/df4ea0bb-db6a-42b3-8a8f-6e5ebb28a459)

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/4fed0a3e-ca9e-4f0c-9e77-0e23527f7bfa)


### Офис №1

Соответственно действиям, связанным с установкой коммутаторов в офисе 3, устанавливаем коммутаторы в офисе 1

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/6d494dc2-fb92-427d-b34d-a0f4f48f2fc6)


* switch 1

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/9e9bb9a5-10c5-45c2-bf89-102f3b9842de)


* switch 2  

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/8d0c9f31-2cf1-4382-82f7-fe2e08b21b41)


* Агрегация

Соответственно пердыдущим шагам настраиваем агрегацию каналов для коммутаторов

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/511e8cc1-4a21-4418-b09b-667bc9308765)

![image](https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/73771528-e321-4a78-9db7-b0a259df90e4)


## <a name="section3">Вывод</a>










