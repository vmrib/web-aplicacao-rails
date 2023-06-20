import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="table"
export default class extends Controller {
  show() {
    const element = this.element;
    const parent = $(element).parent();
    const root = document.documentElement;
    const sourceUrl = $(element).attr("ref");

    $(element).empty();
    $(element)
      .append(`<span class="loading loading-spinner loading-md"></span>`)
      .addClass("btn-disabled opacity-50 w-full");

    $.ajax({
      url: sourceUrl,
      type: "GET",
      dataType: "html",
      success: (showView) => {
        $(parent).find(".modal").remove();
        $(parent).append(showView);
        $(parent).find(".modal").fadeIn().get(0).showModal();
        $(element)
          .empty()
          .append("Mostrar")
          .removeClass("btn-disabled opacity-50 w-full");
      },
      error: (data) => {
        console.log(data);
      },
    });
  }

  edit() {
    const element = this.element;
    const parent = $(element).parent();
    const root = document.documentElement;
    const sourceUrl = $(element).attr("ref");

    $(element).empty();
    $(element)
      .append(`<span class="loading loading-spinner loading-md"></span>`)
      .addClass("btn-disabled opacity-50 w-full");

    $.ajax({
      url: sourceUrl,
      type: "GET",
      dataType: "html",
      success: (editView) => {
        $(parent).find(".modal").remove();
        $(parent).append(editView);
        $(parent).find(".modal").fadeIn().get(0).showModal();
        $(element)
          .empty()
          .append("Editar")
          .removeClass("btn-disabled opacity-50 w-full");
      },
      error: (data) => {
        console.log(data);
      },
    });
  }

  new() {
    const element = this.element;
    const parent = $(element).parent();
    const root = document.documentElement;
    const sourceUrl = $(element).attr("ref");

    $(element).empty();
    $(element)
      .append(`<span class="loading loading-spinner loading-md"></span>`)
      .addClass("btn-disabled opacity-50");

    $.ajax({
      url: sourceUrl,
      type: "GET",
      dataType: "html",
      success: (newView) => {
        $(parent).find(".modal").remove();
        $(parent).append(newView);
        $(parent).find(".modal").fadeIn().get(0).showModal();
        $(element)
          .empty()
          .append("Novo")
          .removeClass("btn-disabled opacity-50 w-full");
      },
      error: (data) => {
        console.log(data);
      },
    });
  }
}
