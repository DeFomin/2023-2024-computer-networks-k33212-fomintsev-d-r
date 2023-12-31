## Практическая работа № 4.
## Оглавление
- [Организация отказоустойчивой сети на основе коммутаторов. Протоколы STP и EtherChannel.](#section1)
  - [Цель работы](#section1.1)  
  - [Краткие теоретические сведения](#section1.2)
  - [Требования](#section1.3)
- [Ход работы](#section1.4)
  - [Тестирование протокола STP](#section1.5)
  - [Тестирование протокола RSTP](#section1.6)
  - [Работа с протоколом EtherChannel](#section1.7)
  - [Динамическое агрегирование LACP](#section1.8)
- [Вывод](#section2)


## <a name="section1">Организация отказоустойчивой сети на основе коммутаторов. Протоколы STP и EtherChannel.</a>

## <a name="section1.1">Цель работы</a>

Целью данной лабораторной работы является изучение и практическое ознакомление с основными принципами работы концентраторов и коммутаторов второго уровня в компьютерных сетях, а также организация отказоустойчивой сети на основе коммутаторов.

## <a name="section1.2">Краткие теоретическме сведения</a>  

Методы организации отказоустойчивых каналов связи:

1) Резервирование соединений. Традиционная избыточная топология. Используются протоколы SТР и RSTP.
Spanning Tree Protocol (STP, протокол покрывающего дерева) — канальный протокол. Основной задачей STP является устранение петель в топологии произвольной сети Ethernet, в которой есть один или более сетевых мостов, связанных избыточными соединениями. STP решает эту задачу, автоматически блокируя соединения, которые в данный момент для полной связности коммутаторов являются избыточными. Необходимость устранения топологических петель в сети Ethernet следует из того, что их наличие в реальной сети Ethernet с коммутатором с высокой вероятностью приводит к бесконечным повторам передачи одних и тех же кадров Ethernet одним и более коммутатором, отчего пропускная способность сети оказывается почти полностью занятой этими бесполезными повторами; в этих условиях, хотя формально сеть может продолжать работать, на практике её производительность становится настолько низкой, что может выглядеть как полный отказ сети. STP относится ко второму уровню модели OSI. Протокол описан в стандарте IEEE 802.1D, выработанным рабочей группой IEEE 802.1 по межсетевому взаимодействию. Если в сети с мостовыми подключениями (в сегменте сети из коммутаторов) имеется несколько путей, могут образоваться циклические маршруты, и следование простым правилам пересылки данных через мост (коммутатор) приведёт к тому, что один и тот же пакет будет бесконечно передаваться с одного моста на другой (передаваться по кольцу из коммутаторов). Алгоритм остовного дерева позволяет по мере необходимости автоматически отключать передачу через мост в отдельных портах (блокировать порты коммутатора), чтобы предотвратить зацикливание в топологии маршрутов пересылки пакетов. Для использования алгоритма остовного дерева в сетевом мосте никакой дополнительной настройки не требуется. С момента создания исходного стандарта IEEE 802.1D было разработано несколько разновидностей протоколов STP. К разновидностям протоколов STP относятся следующие: 

 STP. Это исходная версия IEEE 802.1D (802.1D-1998 и более ранняя), которая предотвращает формирование петель в топологии сети с резервными каналами. Общий протокол spanning-tree (CST): предполагает использование только одного экземпляра протокола spanning-tree для всей сети с мостовым соединением независимо от количества сетей VLAN.  
 Быстрый протокол STP (RSTP) или IEEE 802.1w: доработанный протокол STP, который обеспечивает более быстрое схождение, чем протокол STP.  
 PVST+ является усовершенствованным протоколом компании Cisco, в котором для каждого отдельного VLAN используется отдельный экземпляр RSTP. Рассматриваемый вариант протокола spanning-tree поддерживает PortFast, UplinkFast, BackboneFast, BPDU guard, BPDU filter, root guard и loop guard.  
 Rapid PVST+: усовершенствованный корпорацией Cisco протокол RSTP, который использует PVST+. Rapid PVST+ предоставляет отдельный экземпляр 802.1w для каждой сети VLAN. Каждый отдельный экземпляр поддерживает функции PortFast, BPDU guard, BPDU filter, root guard и loop guard.  
 … еще несколько подобных протоколов.  

Коммутаторы Cisco под управлением IOS 15.0 или более поздней версии по умолчанию запускают PVST+. Эта версия содержит множество спецификаций IEEE 802.1D-2004, таких как альтернативные порты вместо бывших неназначенных портов. Однако, чтобы использовать протокол RSTP, коммутаторы должны быть явно настроены на быстрый режим связующего дерева.

2) Агрегирование каналов - объединение нескольких физических каналов в один логический. Используется протокол EtherChannel. Возможны варианты агрегирования:
    ◦ Динамическое агрегирование  
        ▪ LACP (Link Aggregation Control Protocol)  
        ▪ PAgP (Port Aggregation Protocol)  
            
Поскольку оба протокола присутствуют в оборудовании Cisco, то лучше использовать LACP поскольку он является стандартизированным.
        ◦ Статическое агрегирование  

Для использования протокола EtherChannel  необходимо чтобы порты имели одинаковые:

● скорость (speed),  
● режим дуплекса (duplex mode),  
● native VLAN,  
● диапазон разрешенных VLAN,  
● статус порта (trunk или access),  
● тип интерфейса.  

EtherСhannel — это технология, позволяющая объединять (агрегировать) несколько физических проводов (каналов, портов) в единый логический интерфейс. Как правило, это используется для повышения отказоустойчивости и увеличения пропускной способности канала. Обычно, для соединения критически важных узлов (коммутатор-коммутатор, коммутатор-сервер и др.). Само слово EtherChannel введено компанией Cisco и все, что связано с агрегированием, она включает в него. Другие вендоры агрегирование называют по-разному. Huawei называет это Link Aggregation, D-Link называет LAG и так далее.

## <a name="section1.3">Требования</a>

Для выполнения работы необходима установка симулятора CISCO PacketTracer.

## <a name="section1.4">Ход работы</a>

## <a name="section1.5">Тестирование протокола STP</a>

Определим корневой коммутатор с помощью команды ```show spanning-tree```.
Вывод информации о каждом Spanning Tree Protocol (STP) представлен ниже

* 6 коммутатор
<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/0cf787b3-cd72-4df9-b90b-6f14799eb098" width=600></p>


* 3 коммутатор
<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/8bd84afd-42b6-4890-b035-fd1c70a6a7da" width=600></p>


* 1 коммутатор
<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/56bad8d3-4254-44e2-ae80-99738352a158" width=600></p>

Видно, что первый коммутатор является корневым ("This bridge is the root"). __Корневым коммутатором становится тот, у которого самый низкий Bridge ID. Bridge ID формируется путем объединения Priority и MAC-адреса коммутатора. Priority может быть настроен администратором, и чем ниже значение, тем выше приоритет. MAC-адрес используется в качестве "запасного" значения при равенстве приоритетов. Коммутатор с более низким MAC-адресом предпочтителен.__

С помощью приоритета и mac адреса докажем, что выбран верный коммутатор.

|   | Priority  | MAC-address  |
|:---:|:---:|:---:|
| Switch 6  | 32769  | 0030.F253.50C3 (48.20675.20675) |
| Switch 3  | 32769  | 0009.7CA1.61C4 (9.31905.25028) |
| Switch 1  | 32769  | 0004.9A62.23C5 (4.39522.9157) |


В данном случае значение приоритета выставлено по умолчанию 32768 + 1 или ```32768 + VLAN ID```. По mac адресу видно, что switch - корневой. Чтобы понять, какой порт лучше использовать, каждый некорневой коммутатор определяет стоимость маршрута от каждого своего порта до корневого коммутатора.

Основной критерий для выбора порта как резервного - это принадлежность к пути с наименьшим "стоимостным" путем до корневого коммутатора. Стоимость пути определяется суммой стоимостей всех сегментов (соединений) от коммутатора до корневого коммутатора. Блокировка портов с высокой стоимостью помогает предотвратить возможные петли в сети и обеспечить её стабильность.


Можно видеть, что порт Fa 0/1 стал дополнительным. Fa 0/11 является основным
<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/751f5b24-6233-4db3-844a-46f0413050c5" width=600></p>

Если вручную отключить порт 0/11, то Fa 0/1 станет основным
<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/0c0fd954-7f8a-47b8-ade2-3455c63bd34b" width=600></p>

## <a name="section1.6">Тестирование протокола RSTP</a>

У меня 15 вариант, поэтому 15 % 4 = 3, поэтому я соединяю switch3 и L3 в петлю. В кажестве корневого был выбран switch 1.

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/fd3c3274-537c-4dce-b285-e79395182f5c" width=600></p>

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/0cc88f33-06a9-4b1d-8b74-59c5c798fc15" width=600></p>

Для того, чтобы определить время сходимости при использовании STP, отключим порт FastEthernet0/2 на коммутаторе L3. И примерно через минуту соединение появилось через запасной порт.

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/b6c4bda6-c0a3-41e1-8426-83c2c5fc6e2f" width=600></p>

Далее возвращаем в рабочее состояние порт Fa 0/2 и переключаем коммутаторы на протокол RSTP

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/39819740-7798-40e7-8fdf-1e64c5991eac" width=600></p>

Теперь снова тестируем время сходимости. Отключаем порт и смотрим: __подключение появилось мгновенно__.

## <a name="section1.7">Работа с протоколом EtherChannel</a>

Агрегация каналов (EtherChannel) позволяет объединять несколько физических интерфейсов в один логический канал. Это позволяет увеличить пропускную способность, обеспечивает избыточность и повышает надежность сети.

По 15 варианту мне небходимо соединить 1 и 2 коммутаторы агрегацией из 4-ёх каналов.

Как видно, после подключения коммутаторов из-за протокола STP он отключает все порты, кромеодного, чтобы не было петли.

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/62db8700-cbde-46b1-ba16-84589983c3aa" width=600></p>

LACP и PAgP группируют интерфейсы с одинаковыми:

* скоростью (speed),  
* режимом дуплекса (duplex mode),  
* native VLAN,  
* диапазон разрешенных VLAN,  
* trunking status,  
* типом интерфейса.  

Просмотр информации о EtherChannel:  
```sh etherchannel summary```    
```show etherchannel port-channel```  

Аналогично примеру из доп. материалов к лабораторной работе настраиваем агрегацию.

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/6428c53a-8af6-4e6b-a37d-d10b1de84910" width=400></p>

После настроик видем, что все получилось и работает.

* Для 2-го коммутатора
<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/ae31a92d-2ce5-4760-a921-82d6aead4c66" width=600></p>

* Для 1-го коммутатора
<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/e08ddead-7445-4837-bb43-d49b1edb9c2d" width=600></p>

* Сеть
<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/b322e984-f2fa-4841-9209-91067fd67ba0" width=600></p>

Теперь данные порты отображаются как один.

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/060ea071-567c-4204-8328-5196dc980e2f" width=600></p>

## <a name="section1.8">Динамическое агрегирование LACP</a>

LACP (Link Aggregation Control Protocol) - это протокол управления агрегацией каналов, позволяет устройствам автоматически определять и настраивать агрегированный канал между собой.

Дальше строим схему как на рисунке 

<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/0079af97-6eee-4cca-9c73-d77a1b10cfd5" width=600></p>

На первом, втором и третьем коммутаторах на нужных портах была настроена агрегация каналов с помощью команды channel-group n mode active, где n — номер коммутатора.

* Для коммутатора 1 все порты, связанные с L3 были агрегированы  
<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/d0b2c8a2-4178-4d67-b3f5-a1a3350a85c3" width=600></p>

* Для коммутатора 2 все порты, связанные с L3 были агрегированы  
<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/66197884-c714-4b79-9176-8ed46b8242a7" width=600></p>

* Для коммутатора 3 все порты, связанные с L3 были агрегированы  
<p align=center><img src="https://github.com/DeFomin/2023-2024-computer-networks-k33212-fomintsev-d-r/assets/90705279/6a69110b-ce9f-4bd7-a495-869e791fca26" width=600></p>


## <a name="section2">Вывод</a>
В ходе выполнения данной лабораторной работы я изучил и практически ознакомился с протоколами STP и RSTP, а также с созданием и тестированием агрегированных портов.









