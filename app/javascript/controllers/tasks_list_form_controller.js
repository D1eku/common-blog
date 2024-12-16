import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks-list-form"
export default class extends Controller {
  connect() {
    console.log("Tasks List Form Controller connected")

    document.addEventListener("DOMContentLoaded", () => {
      const tasksContainer = document.getElementById("tasks-container"); // Contenedor de tareas
      const addTaskButton = document.getElementById("add-task"); // Botón de "Add Task"
      let taskIndex = tasksContainer.children.length; // Contador de tareas inicializado al número de campos existentes

      // Función para crear una nueva tarea dinámica
      const createTaskTemplate = (index) => {
        return `
      <div class="task-item mb-3">
        <div class="mb-3">
          <label for="tasks_list_tasks_attributes_${index}_title" class="form-label">Task Title</label>
          <input type="text" name="tasks_list[tasks_attributes][${index}][title]" id="tasks_list_tasks_attributes_${index}_title" class="form-control" placeholder="Task title">
        </div>
        <div class="mb-3">
          <label for="tasks_list_tasks_attributes_${index}_description" class="form-label">Task Description</label>
          <textarea name="tasks_list[tasks_attributes][${index}][description]" id="tasks_list_tasks_attributes_${index}_description" class="form-control" placeholder="Task description"></textarea>
        </div>
        <button type="button" class="btn btn-danger btn-sm remove-task">Remove Task</button>
        <hr>
      </div>
    `;
      };

      // Evento para agregar una nueva tarea
      addTaskButton.addEventListener("click", () => {
        const taskTemplate = createTaskTemplate(taskIndex); // Crea la plantilla de tarea
        tasksContainer.insertAdjacentHTML("beforeend", taskTemplate); // Inserta el HTML al contenedor
        taskIndex++; // Incrementa el índice
      });

      // Evento delegado para eliminar una tarea dinámica
      tasksContainer.addEventListener("click", (event) => {
        if (event.target.classList.contains("remove-task")) {
          const taskItem = event.target.closest(".task-item");
          tasksContainer.removeChild(taskItem); // Elimina el HTML de la tarea
        }
      });
    });
  }
}
