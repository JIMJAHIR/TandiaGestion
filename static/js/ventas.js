let equipmentCount = 0; // Variable para mantener un seguimiento de los equipos agregados

// Función para agregar una nueva sección de equipo
function addEquipment() {
  equipmentCount++;

  var equipmentSection = document.createElement("div");
  equipmentSection.className = "conteiner-infoNewClient conteiner-infoNewClient-three";
  equipmentSection.id = "equipment-" + equipmentCount; // Asignar un ID único

  var equipmentSelect = document.createElement("div");
  equipmentSelect.className = "newInput-container";

  var selectLabel = document.createElement("label");
  selectLabel.className = "label-overlay";
  selectLabel.textContent = "Equipo";

  var selectElement = document.createElement("select");
  selectElement.className = "styled-input";
  selectElement.name = "nameE";

  var equipmentOptions = [
    "Impresora Azul Alámbrica",
    "Impresora Portátil",
    "Impresora de 80 MM",
    "Lector de Barras Alámbrico",
    "Lector de Barras Inalámbrico",
    "Gaveta de Dinero",
    "V2 - T-Portátil",
    "Lector Sunmi - 2",
    "Impresora de Código de Barras",
    "Otros"
  ];

  for (var i = 0; i < equipmentOptions.length; i++) {
    var option = document.createElement("option");
    option.value = equipmentOptions[i];
    option.text = equipmentOptions[i];
    selectElement.appendChild(option);
  }

  equipmentSelect.appendChild(selectLabel);
  equipmentSelect.appendChild(selectElement);

  var quantityInput = document.createElement("div");
  quantityInput.className = "newInput-container";

  var quantityLabel = document.createElement("label");
  quantityLabel.className = "label-overlay";
  quantityLabel.textContent = "Cantidad";

  var quantityElement = document.createElement("input");
  quantityElement.className = "styled-input";
  quantityElement.type = "number";
  quantityElement.name = "quantityE";
  quantityElement.value = "1";
  quantityElement.min = "1";
  quantityElement.max = "10";
  quantityElement.step = "1";
  quantityElement.required = true;

  quantityInput.appendChild(quantityLabel);
  quantityInput.appendChild(quantityElement);

  equipmentSection.appendChild(equipmentSelect);
  equipmentSection.appendChild(quantityInput);

  // Crear un botón "Quitar" para esta sección de equipo
  var removeButton = document.createElement("button");
  removeButton.textContent = "Eliminar";
  removeButton.className = "styled-input remove-button";
  removeButton.addEventListener("click", function() {
    removeEquipment(equipmentSection.id); // Llamar a la función para quitar esta sección
  });

  equipmentSection.appendChild(removeButton);

  // Obtener el elemento de referencia con la clase "conteiner-reference"
  var referenceElement = document.querySelector(".conteiner-reference");

  // Insertar la nueva sección de equipo antes del elemento de referencia
  if (referenceElement) {
    referenceElement.parentNode.insertBefore(equipmentSection, referenceElement);
  } else {
    // Si no se encuentra el elemento de referencia, simplemente agrégalo al final
    document.querySelector(".conteiner-new").appendChild(equipmentSection);
  }
}

// Función para quitar una sección de equipo
function removeEquipment(equipmentId) {
  var equipmentToRemove = document.getElementById(equipmentId);
  if (equipmentToRemove) {
    equipmentToRemove.remove(); // Eliminar la sección de equipo
  }
}

