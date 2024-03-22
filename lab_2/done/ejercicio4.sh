#!/bin/bash

function handle_process() {

  # Display actions available
  echo "Acciones disponibles: (1) Detener proceso / (2) Cambiar prioridad:"

  # Read user input for action
  read -r action

  # Check if action is 1 (to stop the process)
  if [[ $action -eq 1 ]]; then
    # Use kill to kill the process
    kill "$pId"
    return
  fi

  # Check if action is 2 (to change priority)
  if [[ $action -eq 2 ]]; then
    # Get old priority
    old_priority=$(ps -o nice= -p "$pId")    
	  
    # Get new priority
    echo "Ingrese la nueva prioridad (número): "
    read -r new_priority

    # Use renice for priority change
    renice "$new_priority" "$pId"
    
    # Inform the user about the change
    echo "$pId (process ID) old priority $old_priority, new priority $new_priority"
    echo "Prioridad del proceso $pId cambiada a $new_priority."
    
    return
  fi

  # Invalid action entered
  echo "Opción no válida."
}

# Excecute the code as long as the user exits the it
while true; do

  echo "==== Monitor de Recursos Interactivo ===="

  # Print the first 10 processes by CPU usage as a list
  ps aux --sort -%cpu | head -n 11 | awk '{print $1,$2,$3,$4,$11}' | column -t

  # Ask the user what he wants to do
  echo "Seleccione el PID del proceso para realizar acciones (o presione Enter para salir):"
  read -r pId

  # Check if empty meaning that the user pressed Enter
  if [[ -z "$pId" ]]; then
    # Exit the script
    exit 0
  fi

  # Manage the process if user entered a PID
  handle_process "$pId"

done
