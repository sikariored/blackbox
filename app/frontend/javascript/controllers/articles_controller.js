import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    connect() {
        document.addEventListener('DOMContentLoaded', function() {
            const activeArticleId = 1
            const activeSectionId = 1

            const articleElement = document.getElementById(`article_${activeArticleId}`)
            const sectionElement = document.getElementById(`section_${activeSectionId}`)

            // Проверяем, существует ли элемент с заданными идентификаторами
            if (articleElement && sectionElement) {
                // Добавляем класс активности к найденным элементам
                articleElement.classList.add('active')
                sectionElement.classList.add('active')
            }
        });
    }

    show(e) {

        const id = e.currentTarget.id
        const article = document.getElementById("article_" + id.split("_")[1])

        // Очистка содержимого блока от предыдущего текста
        const articleColumn = article.parentElement.parentElement.querySelector(".article-column")
        articleColumn.querySelectorAll(".article").forEach(element => {
            element.style.display = 'none'
            element.classList.remove('active')
        })

        // Отображение выбранной статьи
        article.style.display = 'block'

        // Добавление класса active к выбранной статье
        article.classList.add('active')

        // Удаление класса active у всех кнопок
        document.querySelectorAll('.section').forEach(button => {
            button.classList.remove('active')
        })

        // Добавление класса active-section к выбранной кнопке
        e.currentTarget.classList.add('active')
    }
}
