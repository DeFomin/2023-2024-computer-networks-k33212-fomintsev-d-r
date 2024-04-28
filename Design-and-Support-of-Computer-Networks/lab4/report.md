## Лабораторная работа № 4.
## Начало установки модуля Интернет. Установка и настройка модулей NAT и DNS  корпоративной сети.


## Оглавление:
- [Цель работы](#section1)
- [Краткие теоретические сведения](#section1.2)
- [Требования](#section1.3)
- [Ход работы](#section1.5)
  - [Часть 1. Установка модуля сети Интернет.](#section2)
  - [Часть 2. Установка и настройка DNS.](#section2.1)
- [Вывод](#section3) 

## <a name="section1">Цель работы</a>  
Установка и настройка модулей NAT и DNS  корпоративной сети.

## <a name="section1.3">Требования</a> 
Для выполнения работы необходима установленная среда моделирования Cisco Packet Tracer и выполненные предыдущие лабораторные работы. 

## <a name="section1.5">Ход работы</a>

## <a name="section2">Часть 1. Установка модуля сети Интернет.</a>

Маршрутизатор внутренней сети был добавлен в самый большой офис, подключен к L3 коммутатору уровня доступа. К тому же коммутатору был подключен и web сервер

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/309c64b2-0514-4e6b-ba5d-af0212667148" width=700></p>

Для начала был прокинут транк порт между L3 и нашим маршрутизатором, настроены белые ip адреса одной подсети для соединений между роутером провайдера и сервером провайдера, а также роуттером провайдера и нашим роутером

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/f67ca73b-12d8-43ac-bd0b-e291302716a6" width=700></p>

DHCP сервер был перенастроен с внутреннего сервера на основной маршрутизатор.

```show run```

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/51cf712c-06ad-4124-b38c-2278ad639d11" width=700></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/6232cfdc-5840-4a90-8d97-acd08846e8f6" width=700></p>

Соответственно настройки NAT были созданы принимающие сабинтерфейсы

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/470ea160-255c-46e8-bfea-cd5a9b83c5ed" width=700></p>

Также был создан accept list ```ip access-list standard FOR-NAT```

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/72716077-72b0-4b71-b5b5-97abfc9646ba" width=700></p>

```
ip nat inside source list FOR-NAT interface FastEthernet0/0 overload
ip nat inside source static tcp 10.70.0.2 80 213.234.10.2 80
```

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/62ef7298-c5d6-4441-b08b-baea990cf6ad" width=700></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/fee31d69-59a1-4728-970a-b049ac1f8ff2" width=700></p>

Проверка настройки нашего динамического nat: 

* Сервер провайдера -> наш сервер

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/0af014de-8822-4f64-8a26-db229a24c4ec" width=700></p>

* Наш сервер -> Сервер провайдера

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/9c866585-33cc-4173-ae4d-fa9a1533e0e9" width=700></p>

* icmp запрос провайдеру с ПК маленького офиса

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/1459aaa0-a6b5-4cfb-ab58-3f60da11cdc1" width=700></p>

## <a name="section2.1">Часть 2. Установка и настройка DNS.</a>

Dns сервер был установлен в маленьком офисе с ip 10.70.0.11. Для его работы на маршрутизаторе сети были добавлены настройки dns к dhcp ```dns-server 10.70.0.11```

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/44116671-d097-45ff-a2f3-6e43a32cdcc8" width=700></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/9d29a698-ebbe-41ea-a24e-b723e60d7f8b" width=700></p>

Проверка с ПК большого офиса:

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/d1b117f7-286d-4c99-a80b-a389accc817e" width=700></p>

## <a name="section3">Вывод</a>

В ходе выполнения лабораторной работы были настроены web и dns серверы, установлен модуль сети интернета и настроена работа NAT.
