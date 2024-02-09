import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
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
