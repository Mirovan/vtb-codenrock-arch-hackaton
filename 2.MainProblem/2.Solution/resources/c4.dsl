workspace {

    model {
        user = person "Клиент" "Клиент ресторана"
        waiter = person "Официант" "Официант ресторана"
        manager = person "Управляющий" "Управляющий рестораном"
        deliver = person "Курьер" "Сотрудник курьерской службы"
        accountant = person "Бухгалтер" "Бухгалтер, финансовый аналитик"
        admin = person "Бизнес администратор" "Бизнес администратор системы"


        platformContext = softwareSystem "Система приема заказа" "Прием заказов и обеспечение работы ресторана" {
            spaContainer = container "Single-Page Application" "Предоставляет доступ к приложению через браузер" "JavaScript, React" "Web Browser"

            bffContainer = container "BFF service" "Осуществляет проксирование запросов в сервисы" "Java, Spring"

            mobileApp = container "Mobile App" "Мобильное приложение" "Flutter" "Mobile App"

            orderContainer = container "Order Service" "Управление заказами" "Java, Spring"
            orderDbContainer = container "Order Database" "Хранение данных клиента" "Postgres" "Database"

            paymentAdapterContainer = container "Payment Adapter Service" "Управление платежами" "Java, Spring"
            paymentAdapterDbContainer = container "Payment Adapter Database" "Хранение данных клиента" "Postgres" "Database"

            restoContainer = container "Restaurant Service" "Управление заказами" "Java, Spring"
            restoDbContainer = container "Restaurant Database" "Хранение данных клиента" "Postgres" "Database"

            financeContainer = container "Finance Service" "Управление заказами" "Java, Spring"
            financeDbContainer = container "Finance Database" "Хранение данных клиента" "Postgres" "Database"

            deliveryContainer = container "Delivery Service" "Управление заказами" "Java, Spring"
            deliveryDbContainer = container "Delivery Database" "Хранение данных клиента" "Postgres" "Database"

            adminContainer = container "Business management Service" "Управление заказами" "Java, Spring"
            adminDbContainer = container "Business management Database" "Хранение данных клиента" "Postgres" "Database"
        }

        paymentContext = softwareSystem "Payment Gateway" "Платежный шлюз" "Other" {
            outPaymentContainer = container "Payment Service" "Внешний платежный шлюз" "" "Other"
        }

        taxContext = softwareSystem "Tax Service" "Налоговая служба" "Other" {
            outTaxContainer = container "Tax Service" "Управление данными финансовой отчетности" "" "Other"
        }


        user -> spaContainer "Создание и оплата заказа"
        user -> mobileApp "Создание заказа"

        waiter -> spaContainer "Создание заказа"

        manager -> spaContainer "Управление рестораном"

        deliver -> spaContainer "Доставка заказа"
        deliver -> mobileApp "Доставка заказа"

        accountant -> spaContainer "Управление финансовой отчетностью"

        admin -> spaContainer "Бизнес-администрирование"

        spaContainer -> bffContainer
        mobileApp -> bffContainer

        bffContainer -> orderContainer
        bffContainer -> paymentAdapterContainer
        bffContainer -> restoContainer
        bffContainer -> deliveryContainer
        bffContainer -> financeContainer
        bffContainer -> adminContainer

        orderContainer -> paymentAdapterContainer

        deliveryContainer -> orderContainer

        paymentAdapterContainer -> outPaymentContainer

        financeContainer -> paymentAdapterContainer
        financeContainer -> outTaxContainer

        #DB
        orderContainer -> orderDbContainer
        paymentAdapterContainer -> paymentAdapterDbContainer
        restoContainer -> restoDbContainer
        financeContainer -> financeDbContainer
        deliveryContainer -> deliveryDbContainer
        adminContainer -> adminDbContainer

    }

    views {
        systemContext platformContext "SystemContext" {
            include *
            autoLayout tb
        }

        container platformContext {
            include *
            autolayout tb
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
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Other" {
                background #eeeeee
                color #000000
            }
        }
    }

}