workspace {

    model {
        user = person "Пользователь" "Посетитель сайта"

        onlineShopSystem = softwareSystem "Интернет-магазин" "Web-приложение Интернет-магазин" {
            spaContainer = container "Single-Page Application" "Предоставляет доступ к приложению через браузер" "JavaScript, React" "Web Browser"

            shopContainer = container "Clients service" "Личный кабинет клиента" "Python, Django"
            shopDbContainer = container "Clients Database" "Хранение данных клиента" "Postgres" "Database"

            statisticContainer = container "Statistic service" "Сервис  статистики действий пользователей на сайте" ""
            statisticDbContainer = container "Statistic Database" "Хранение статистики действий пользователей на сайте" "Postgres???" "Database"

            # mqContainer = container "Message Queue" "Брокер сообщений" "Kafka" "MQ"
        }

        statisticSystem = softwareSystem "Система сбора статистики" "Хранение статистики о действиях пользователя на страницах сайта"


        user -> onlineShopSystem "Навигация по страницам"
        onlineShopSystem -> statisticSystem "Отправка статистики о действиях пользователя"

        user -> spaContainer
        spaContainer -> shopContainer
        spaContainer -> statisticContainer
        shopContainer -> shopDbContainer
        statisticContainer -> statisticDbContainer
    }

    views {
        systemContext onlineShopSystem "SystemContext" {
            include *
            autoLayout lr
        }

        container onlineShopSystem {
            include *
            autolayout
        }

        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
        }
    }

}