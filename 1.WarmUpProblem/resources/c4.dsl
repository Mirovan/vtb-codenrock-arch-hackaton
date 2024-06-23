workspace {

    model {
        user = person "Пользователь" "Посетитель сайта"
        analytic = person "Аналитик" "Эксперт по анализу данных"


        onlineShopSystem = softwareSystem "Интернет-магазин" "Web-приложение Интернет-магазин" {
            spaContainer = container "Single-Page Application" "Предоставляет доступ к приложению через браузер" "JavaScript, React" "Web Browser"

            shopContainer = container "Backend shop service" "Backend Интернет-магазина" "Node.js"
            shopDbContainer = container "Shop Database" "Хранение данных Интернет-магазина" "Postgres" "Database"

            statisticContainer = container "Statistics capture service" "Сервис статистики действий пользователей на сайте" ""
            statisticDbContainer = container "Statistics Database" "Хранение статистики действий пользователей на сайте" "Cassandra" "Database"

            statisticAnalyzeContainer = container "Statistics analyze service" "Сервис анализа статистики" ""
        }

        statisticSystem = softwareSystem "Система сбора статистики" "Сбор и сохранение статистики о действиях пользователя на страницах сайта"


        user -> onlineShopSystem "Навигация по страницам"
        onlineShopSystem -> statisticSystem "Отправка статистики о действиях пользователя"

        user -> spaContainer
        spaContainer -> shopContainer
        spaContainer -> statisticContainer
        shopContainer -> shopDbContainer
        statisticContainer -> statisticDbContainer
        statisticAnalyzeContainer -> statisticDbContainer
        analytic -> statisticSystem
        analytic -> onlineShopSystem "Получение результатов статистики"
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
            element "Web Browser" {
                shape WebBrowser
            }
            element "Database" {
                shape Cylinder
                background #7aa5c2
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "MQ" {
                background #555555
                color #000000
            }
            element "Other" {
                background #eeeeee
                color #000000
            }
        }
    }

}