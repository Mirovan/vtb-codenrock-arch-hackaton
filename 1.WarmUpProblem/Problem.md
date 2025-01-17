# Разминочная задача

У задачи есть:
- условия (aka «дано»)
- набор предлагаемых для ее решения технологий и / или инструментов

В решении должны быть описаны:
- архитектура системы
- функциональная структура системы
- архитектура данных
- API взаимодействия
- архитектура развертывания

Дано:
- Имеется web-приложение интернет-магазина, реализованное с использованием популярных технологий (например, NodeJS+React)
- Руководитель проекта поручил повысить позиции сайта в результирующих выборках поисковых сервисов.
  Для этого необходимо предоставить возможность сбора и анализа статистики посещения web-страниц приложения

Что нужно сделать:
- Спроектируйте архитектуру и структуру приложения с учетом нового функционала
  по сбору и отображению статистики посещения web-страниц за определенный период времени
- Дополнительно предусмотрите возможность горизонтального масштабирования приложения при повышении числа запросов,
  равномерного распределения потоков запросов между обработчиками, а также горячего резервирования компонентов приложения
  для обеспечения отказоустойчивой работы

Технологический стек:
- NodeJS, Flask, Docker, Nginx, HAProxy, ELK, PostgreSQL, VMWare, React, Vue, heartbeat, waf, Proxmox, Prometheus + Grafana

Ожидаемый результат (в формате презентации*):
- архитектурная схема
- функциональная структура
- архитектура данных
- описание API для работы со статистикой
- архитектура развертывания

Прикрепите файл в формате .pptx или .pdf