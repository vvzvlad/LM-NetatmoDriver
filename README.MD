Задача:
Подключение погодной станции Netatmo в качестве источника информации о температуре, влажности, давлении и качестве воздуха. 

Подготовка:
Покупаем станцию Netatmo(http://madrobots.ru/p/netatmo/)
Регистрируем аккаунт и подключаем станцию к домашней сети согласно прилагаемой инструкции. 
Входим в раздел разработчика(http://dev.netatmo.com) и создаем новое приложение(https://dev.netatmo.com/dev/createapp). Поля заполняем произвольно. 
Заходим в созданное приложение и копируем содержимое полей Client id и Client secret. 

Установка:
Скачиваем архив https://github.com/vvzvlad/NetatmoLDDriver/raw/master/NetatmoLDDriver.tar.gz
Кнопкой "Restore/add libraries" в Scripts -> User libraries устанавливаем архив. 

Сохраняем скрипт. 
Создаем новый Scheduled скрипт, настраивая его ну нужную вам частоту запуска(например, раз в 5 минут: */5 * * * *), и вызываем в нем драйвер следующим образом:
------начало кода------
netatmo_error, netatmo_data = netatmo(client_id,client_secret,username,password,netatmo_debug)
------конец кода------

Пример вызова:
`
netatmo_error, netatmo_data = netatmo('56462a08e6da23d4784b4584','zySY5owFsvxmjE85K9MumZEWDBKT63YPPvH8rqTjpT','madrobots@madrobots.ru','secretpassword', false)
`

Где client_id и client_secret — данные со страницы приложения, username и password — логин и пароль аккаунта, к которому привязана станция. 
netatmo_debug — переменная, определяющая вывод отладочных сообщений в Logs, принимающая значения true или false. 

В ответ фунция netatmo возвращает данные: netatmo_error, netatmo_data
netatmo_error — статут запроса. При нормальной работе скрипта nil, при ошибках принимает текстовое значение вида "netatmo auth error code: 301, set netatmo_debug to true for detaled output in log"
Коды соотвествуют кодам ошибок http, возвращенных в ответ на запрос. 

netatmo_data — данные с внешних и внутреннего блоков системы. Структура их такова:

|_netatmo_data
  |_outdoor_1
    |_module_name — Имя модуля, например "За окном"
    |_rf_status — Приведенный к процентнам уровень сигнала, например "40". Тип данных 05.001(dt.scale), суффикс %, 
    |_battery_vp — Приведенный к процентнам заряд батареи, например "70". Тип данных 05.001(dt.scale), суффикс %
    |_max_temp — Максимальная температура за день, например, "20". Тип данных 09.001(dt.float16), суффикс °C(или иной)
    |_min_temp — Минимальная температура за день, например, "10". Тип данных 09.001(dt.float16), суффикс °C(или иной)
    |_Temperature — Текущая температура, например, "15". Тип данных 09.001(dt.float16), суффикс °C(или иной)
    |_Humidity — Текущая относительная влажность в процентах, например, "15". Тип данных 05.001(dt.scale), суффикс %
  |_outdoor_2
    |_... — Данные со второго датчика повторяют структуру данных с первого
  |_wind
    |_module_name — Имя модуля, например "Датчик ветра"
    |_rf_status — Приведенный к процентнам уровень сигнала, например "24". Тип данных 05.001(dt.scale), суффикс %
    |_battery_vp — Приведенный к процентнам заряд батареи, например "33". Тип данных 05.001(dt.scale), суффикс %
    |_WindAngle — Среднее направление ветра за последние 5 минут в градусах, например, "365". Тип данных 05.003(dt.angle), суффикс °
    |_WindStrength — Средняя скорость ветра за последние 5 минут в км/час, например, "20". Тип данных 05(dt.uint8), суффикс км/час
    |_GustAngle — Направление максимальных порывов ветра за последние 5 минут в градусах, например, "94". Тип данных 05.003(dt.angle), суффикс °
    |_GustStrength — Скорость максимальных порывов ветра за последние 5 минут в км/час, например, "20". Тип данных 05(dt.uint8), суффикс км/час
  |_rain
    |_module_name — Имя модуля, например "Датчик дождя"
    |_rf_status — Приведенный к процентнам уровень сигнала, например "34". Тип данных 05.001(dt.scale), суффикс %
    |_battery_vp — Приведенный к процентнам заряд батареи, например "73". Тип данных 05.001(dt.scale), суффикс %
    |_Rain — Количество осадков в течении последнего дождя, в миллиметрах, например "12". Тип данных 07(dt.uint16), суффикс мм
    |_sum_rain_1 — Количество осадков в течении последнего часа, в миллиметрах, наприиер "5". Тип данных 07(dt.uint16), суффикс мм
    |_sum_rain_24 — Количество осадков в течении последнего дня, в миллиметрах, наприиер "300". Тип данных 07(dt.uint16), суффикс мм
  |_indoor
    |_module_name — Имя модуля, например "Офис"
    |_Humidity — Текущая относительная влажность в процентах, например, "15". Тип данных 05.001(dt.scale), суффикс %
    |_CO2 — Текущее содержание углекислого газа в воздухе, в ppm, например, "800". Тип данных 12(dt.uint16), суффикс ppm
    |_Temperature — Текущая температура, например, "25". Тип данных 09.001(dt.float16), суффикс °C(или иной)
    |_Noise — Уровень шума в db, например, "50". Тип данных 05(dt.uint8), суффикс db
    |_max_temp — Максимальная температура за день, например, "27". Тип данных 09.001(dt.float16), суффикс °C(или иной)
    |_min_temp — Минимальная температура за день, например, "23". Тип данных 09.001(dt.float16), суффикс °C(или иной)
    |_Pressure — Текущее давление приведенное к уровню моря, например, "1010". Тип данных 07(dt.uint16), суффикс mbar(или иной)
    |_pressure_trend — Тренд изменения давления, например, "down". Тип данных 16(dt.string).
    |_AbsolutePressure — Абсолютное давление, например, "1010". Тип данных 07(dt.uint16), суффикс mbar(или иной)
    |_wifi_status — Приведенный к процентнам уровень сигнала WIFI, например "40". Тип данных 05.001(dt.scale), суффикс %
  |_information
    |_unit_system — Используемая метрическая система, "metric" или "imperial". Тип данных 16(dt.string).
    |_wind_unit — Используемые единицы измерения скорости ветра: "kph", "mph", "ms", "beaufort", "knot". Тип данных 16(dt.string).
    |_pressure_unit — Используемые единицы измерения давления: "mbar", "inHg", "mmHg". Тип данных 16(dt.string).

Все наборы данных, кроме "indoor" могут не присутствовать в ответе, например, из-за того, что соотвествующий датчик не установлен или не передает 
 данные.


wifi_status и rf_status можно использовать при отладке и пусконаладке для выбора оптимальных мест размещения внутреннего и внешнего блоков. 
battery_vp можно использовать для мониторинга состояния батареи и вывода уведомлений для пользователя о необходимости замены батарей внешнего блока.


Для записи данных с блока в обьекты LM для дальнейшего использования во внутренних скриптах или в других KNX-устройствах, надо:

1)Создать обьекты следующих типов:
Для температуры — тип данных 09.001(Temperature), суффикс °C(или иной, в случае других настроек)
Для влажности — тип данных 05.001, scale, суффикс %
Для показаний датчика CO2 — тип данных 12, суффикс ppm - dt.uint16
Для значений уровня шума — тип данных 05, суффикс db
Для значений давления — тип данных 07, суффикс mbar(или иной, в случае других настроек станции) - dt.uint16

2)
grp.write("Netatmo Temperature indoor",module_indoor_data.Temperature,dt.float16)
grp.write("Netatmo Humidity indoor",module_indoor_data.Humidity,dt.scale)
grp.write("Netatmo Pressure",module_indoor_data.Pressure,dt.uint16)
grp.write("Netatmo CO2",module_indoor_data.CO2,dt.uint16)
grp.write("Netatmo Noise",module_indoor_data.Noise,dt.uint8)
grp.write("Netatmo Temperature indoor minimum",module_indoor_data.min_temp,dt.float16)
grp.write("Netatmo Temperature indoor maximum",module_indoor_data.max_temp,dt.float16)
grp.write("Netatmo Absolute Pressure",module_indoor_data.AbsolutePressure,dt.uint16)
grp.write("Netatmo Temperature oudoor",module_outdoor_data.Temperature,dt.float16)
grp.write("Netatmo Humidity oudoor",module_outdoor_data.Humidity,dt.float16)
grp.write("Netatmo Temperature oudoor minimum",module_outdoor_data.min_temp,dt.float16)
grp.write("Netatmo Temperature oudoor maximum",module_outdoor_data.max_temp,dt.float16)


