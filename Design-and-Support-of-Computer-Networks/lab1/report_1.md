## Лабораторная работа № 1.  
## Физическое проектирование корпоративной сети предприятия с территориально распределенными офисами.  

## Оглавление:
- [Цель работы](#section1)
- [Краткие теоретические сведения](#section1.2)
- [Требования](#section1.3)
- [Описание задач](#section1.4)
- [Ход работы](#section1.5)
  - [Часть 1. Установка среды моделирования](#section2)
  - [Часть 2. Проектирование и реализация](#section2.1)
- [Вывод](#section3) 

## <a name="section1">Цель работы</a> 

Сформировать навыки работы проектирования физического расположения в среде моделирования сети Cisco Packet Tracer. 

## <a name="section1.2">Краткие теоретические сведения</a>

Среда моделирования Cisco Packet Tracer служит для начальной подготовки сетевых инженеров. Она доступна к загрузке с сайта https://www.netacad.com и для работы с ней требуется зарегистрироваться на указанном сайте с помощью VPN. В Cisco Packet Tracer вы можете визуально проектировать сеть и работать с эмуляцией реального оборудования компании CISCO.

## <a name="section1.3">Требования</a>

Для выполнения работы необходима установленная среда моделирования Cisco Packet Tracer. 

## <a name="section1.4">Описание задачи</a>

Некой организации требуется объединить в единую сеть оборудование (компьютеры, принтеры, Web камеры, IP телефоны, Wi-Fi точки доступа), установленное в нескольких помещениях нескольких зданиях. Нужно определить тип используемых проводов, расположить розетки, проложить провода, выбрать место для серверной, выбрать места для установки Wi-Fi точек, подвести провода в патч-панель.

## <a name="section1.5">Ход работы</a>

### <a name="section2">Часть 1. Установка среды моделирования</a>

Был установлен Cisco Packet Tracer. 

### <a name="section2.1">Часть 2. Проектирование и реализация</a>

1. Мои варианты, согласно условиям лабораторной работы: 3 и 3. Значит моя корпаративная сеть будет построена соответственно условиям ниже

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/e0649213-d207-461b-a8a3-f167f8868ea1" width=700></p>

2. Карта местности (2000х1238)

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/d22681b8-13d8-4944-ba93-a1f16ab9a345" width=700></p>

3. Далее необходимо было расположить 3-и офиса, согласно 3-ему варианту, расстояние между 1 и 2: 100м, между 1, 2 и 3: 900м.

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/8e69ebbd-1aae-4a1f-a1d8-908c4c7f4022" width=700></p>

4. Офис №1 (Размеры 10x15), серверная 1x1

Предварительно во всех офисах установлена wi-fi точка (с радиусом действия 15м) и работающим dhcp сервером, покрытие 100%, на данном этапе работы vlan отсутствуют.

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/f9bbce1b-c422-440c-b166-788923c196e3" width=700></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/40085df7-d96c-40f6-b072-e6a6f57f6a6c" width=700></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/cca8884b-81d4-4fc4-886c-a43f29dc366c" width=700></p>

В 1 офисе 22 устройства, 11 панелей розеток (44 разъема) => Свободно 22 (Условие о 50% свободных разъемов выполнено).

5. Офис №2 (Размеры 13x10), серверная 1x1

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/2f49ccc8-8c83-4f62-88b4-a2bc0003264d" width=700></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/b9121edf-d098-4696-9b14-23a7b8ab3a90" width=700></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/32cf6d13-99eb-43d6-bb67-dc3f6e5e4bdf" width=700></p>

В 1 офисе 7 панелей розеток, 28 разъемов. Всего 13 устройств и 15 разъемов свободно (Условие о 50% свободных разъемов выполнено).


7. Офис №3 (Размеры 15x8), серверная 1x1

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/609e94b4-8f81-4bf9-a50a-02dc40fa7c9e" width=700></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/f1d7ec93-d5f9-4f9d-ba49-adcd285bd8a4" width=700></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/06c75e3b-dd4f-40ee-b793-d11e75d0b9d4" width=700></p>

В 3 офисе всего 10 устройств; 5 панелей розеток по 20 разъемов => Свободно 10 (Условие о 50% свободных разъемов выполнено).


## <a name="section3">Вывод</a>

Были сформированы навыки работы проектирования физического расположения в среде моделирования сети Cisco Packet Tracer. Было объединено в единую сеть оборудование (компьютеры, принтеры, Web камеры, IP телефоны, Wi-Fi точки доступа) в 3-ех разных офисах, 3-ех разных зданий.
